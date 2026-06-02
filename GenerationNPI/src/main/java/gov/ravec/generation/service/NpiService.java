package gov.ravec.generation.service;

import gov.ravec.generation.dto.NpiRequest;
import gov.ravec.generation.dto.NpiResponse;
import gov.ravec.generation.dto.TypeNpi;
import gov.ravec.generation.entity.*;
import gov.ravec.generation.exception.QuotaDepasseException;
import gov.ravec.generation.npi.formula.NpiFormulaService;
import gov.ravec.generation.repository.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

@Service
public class NpiService {

    private final NpiFormulaService formulaService;
    private final QuartierRepository quartierRepository;
    private final PaysRepository paysRepository;
    private final NpiGenereRepository npiGenereRepository;
    private final NpiQuotaQuartierRepository quotaRepository;

    @Value("${ravec.npi.quota-mensuel:10000}")
    private int quotaMensuel;

    public NpiService(NpiFormulaService formulaService,
                      QuartierRepository quartierRepository,
                      PaysRepository paysRepository,
                      NpiGenereRepository npiGenereRepository,
                      NpiQuotaQuartierRepository quotaRepository) {
        this.formulaService = formulaService;
        this.quartierRepository = quartierRepository;
        this.paysRepository = paysRepository;
        this.npiGenereRepository = npiGenereRepository;
        this.quotaRepository = quotaRepository;
    }

    @Transactional
    public NpiResponse generer(NpiRequest request, String generatedBy) {
        validate(request);

        UUID quotaQuartierId = resolveQuotaQuartierId(request);
        Quartier quartier = resolveQuartier(quotaQuartierId);

        verifierEtIncrementerQuota(quartier);

        String npi = buildUniqueNpi(request, quartier);

        NpiGenere entity = buildEntity(request, npi, generatedBy, quartier);
        npiGenereRepository.save(entity);

        return NpiResponse.builder()
                .npi(npi)
                .type(request.getType())
                .dateGeneration(entity.getDateGeneration())
                .statut("GENERE")
                .build();
    }

    // ── Validation métier ────────────────────────────────────────────────────

    private void validate(NpiRequest req) {
        switch (req.getType()) {
            case GUINEEN_NE_EN_GUINEE -> {
                if (req.getLieuNaissanceQuartierId() == null)
                    throw new IllegalArgumentException("lieuNaissanceQuartierId est obligatoire pour le type 1");
            }
            case GUINEEN_NE_ETRANGER -> {
                if (req.getPaysNaissanceCode() == null || req.getQuartierId() == null)
                    throw new IllegalArgumentException("paysNaissanceCode et quartierId sont obligatoires pour le type 2");
                if (req.getNumeroPasseport() == null || req.getNumeroPasseport().isBlank())
                    throw new IllegalArgumentException("numeroPasseport est obligatoire pour le type 2");
            }
            case ETRANGER_RESIDENT_PERMANENT -> {
                if (req.getPaysNaissanceCode() == null || req.getQuartierId() == null)
                    throw new IllegalArgumentException("paysNaissanceCode et quartierId sont obligatoires pour le type 3");
                if (req.getNumeroCarte() == null || req.getNumeroCarte().isBlank())
                    throw new IllegalArgumentException("numeroCarte est obligatoire pour le type 3");
            }
            case ETRANGER_RESIDENT_TEMPORAIRE -> {
                if (req.getPaysNaissanceCode() == null || req.getQuartierId() == null)
                    throw new IllegalArgumentException("paysNaissanceCode et quartierId sont obligatoires pour le type 4");
                if (req.getNumeroPasseport() == null || req.getNumeroPasseport().isBlank())
                    throw new IllegalArgumentException("numeroPasseport est obligatoire pour le type 4");
                if (req.getDateExpirationTitreSejour() == null)
                    throw new IllegalArgumentException("dateExpirationTitreSejour est obligatoire pour le type 4");
            }
        }
    }

    // ── Résolution du quartier de quota ─────────────────────────────────────

    private UUID resolveQuotaQuartierId(NpiRequest req) {
        return req.getType() == TypeNpi.GUINEEN_NE_EN_GUINEE
                ? req.getLieuNaissanceQuartierId()
                : req.getQuartierId();
    }

    private Quartier resolveQuartier(UUID quartierId) {
        return quartierRepository.findByIdWithHierarchy(quartierId)
                .orElseThrow(() -> new IllegalArgumentException("Quartier introuvable : " + quartierId));
    }

    // ── Gestion du quota ─────────────────────────────────────────────────────

    private void verifierEtIncrementerQuota(Quartier quartier) {
        LocalDate debutMois = LocalDate.now().withDayOfMonth(1);

        NpiQuotaQuartier quota = quotaRepository
                .findByQuartierIdAndMoisForUpdate(quartier.getId(), debutMois)
                .orElseGet(() -> NpiQuotaQuartier.builder()
                        .quartierId(quartier.getId())
                        .mois(debutMois)
                        .compteur(0)
                        .build());

        if (quota.getCompteur() >= quotaMensuel) {
            LocalDate reinit = debutMois.plusMonths(1);
            throw new QuotaDepasseException(
                    quartier.getNom(),
                    reinit.format(DateTimeFormatter.ISO_LOCAL_DATE)
            );
        }

        quota.setCompteur(quota.getCompteur() + 1);
        quotaRepository.save(quota);
    }

    // ── Construction du NPI unique ───────────────────────────────────────────

    private String buildUniqueNpi(NpiRequest req, Quartier quartier) {
        int maxAttempts = 10;
        for (int i = 0; i < maxAttempts; i++) {
            String npi = compose(req, quartier);
            if (!npiGenereRepository.existsByNpi(npi)) {
                return npi;
            }
        }
        throw new IllegalStateException("Impossible de générer un NPI unique après " + maxAttempts + " tentatives");
    }

    private String compose(NpiRequest req, Quartier quartier) {
        return switch (req.getType()) {
            case GUINEEN_NE_EN_GUINEE -> {
                Quartier lieuNaissance = req.getLieuNaissanceQuartierId().equals(quartier.getId())
                        ? quartier
                        : resolveQuartier(req.getLieuNaissanceQuartierId());
                yield formulaService.generateType1(req.getSexe(), req.getDateNaissance(), lieuNaissance);
            }
            case GUINEEN_NE_ETRANGER -> {
                Pays pays = findPays(req.getPaysNaissanceCode());
                yield formulaService.generateType2(req.getSexe(), req.getDateNaissance(), pays);
            }
            case ETRANGER_RESIDENT_PERMANENT -> {
                Pays pays = findPays(req.getPaysNaissanceCode());
                yield formulaService.generateType3(req.getSexe(), req.getDateNaissance(), pays);
            }
            case ETRANGER_RESIDENT_TEMPORAIRE -> {
                Pays pays = findPays(req.getPaysNaissanceCode());
                yield formulaService.generateType4(req.getSexe(), req.getDateNaissance(), pays);
            }
        };
    }

    private Pays findPays(String code) {
        return paysRepository.findByCode(code)
                .orElseThrow(() -> new IllegalArgumentException("Pays introuvable avec le code : " + code));
    }

    // ── Mappage vers entité ──────────────────────────────────────────────────

    private NpiGenere buildEntity(NpiRequest req, String npi, String generatedBy, Quartier quartier) {
        return NpiGenere.builder()
                .npi(npi)
                .typeNpi(req.getType())
                .nom(req.getNom().toUpperCase())
                .prenom(req.getPrenom())
                .dateNaissance(req.getDateNaissance())
                .sexe(req.getSexe())
                .quartierId(resolveQuotaQuartierId(req))
                .communeNaissanceId(req.getCommuneNaissanceId())
                .paysNaissanceCode(req.getPaysNaissanceCode())
                .numeroCertificatNaissance(req.getNumeroCertificatNaissance())
                .numeroActeNaissance(req.getNumeroActeNaissance())
                .numeroPasseport(req.getNumeroPasseport())
                .nationalite(req.getNationalite())
                .numeroCarte(req.getNumeroCarte())
                .dateExpirationTitreSejour(req.getDateExpirationTitreSejour())
                .dateGeneration(LocalDateTime.now())
                .statut("GENERE")
                .generatedBy(generatedBy)
                .build();
    }
}

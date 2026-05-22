package gov.ravec.backend.services;

import gov.ravec.backend.dto.NpiClientRequest;
import gov.ravec.backend.dto.NpiClientResponse;
import gov.ravec.backend.entities.ActeNaissance;
import gov.ravec.backend.entities.Commune;
import gov.ravec.backend.entities.Personne;
import gov.ravec.backend.entities.Quartier;
import gov.ravec.backend.repositories.CommuneRepository;
import gov.ravec.backend.repositories.QuartierRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClient;

import java.time.Instant;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

@Service
public class NpiClientService {

    private static final Logger log = LoggerFactory.getLogger(NpiClientService.class);

    private static final String TYPE_1 = "GUINEEN_NE_EN_GUINEE";

    private final RestClient restClient;
    private final QuartierRepository quartierRepository;
    private final CommuneRepository communeRepository;

    @Value("${npi.service.username:superadmin@ravec.gov.gn}")
    private String serviceUsername;

    @Value("${npi.service.password:ChangeMe2026!}")
    private String servicePassword;

    private volatile String cachedToken;
    private volatile Instant tokenExpiry = Instant.EPOCH;

    public NpiClientService(@Qualifier("npiRestClient") RestClient restClient,
                            QuartierRepository quartierRepository,
                            CommuneRepository communeRepository) {
        this.restClient = restClient;
        this.quartierRepository = quartierRepository;
        this.communeRepository = communeRepository;
    }

    /**
     * Génère le NPI via le microservice GenerationNPI.
     * Retourne null en cas d'échec (l'appelant doit utiliser le générateur local).
     */
    public String generateNpi(ActeNaissance acte) {
        try {
            Personne enfant = acte.getEnfant();
            if (enfant == null) return null;

            NpiClientRequest request = buildRequest(enfant, acte);
            if (request == null) return null;

            String token = getToken();
            if (token == null) return null;

            NpiClientResponse response = restClient.post()
                    .uri("/api/npi/generer")
                    .header("Authorization", "Bearer " + token)
                    .contentType(MediaType.APPLICATION_JSON)
                    .body(request)
                    .retrieve()
                    .body(NpiClientResponse.class);

            return (response != null) ? response.getNpi() : null;

        } catch (Exception e) {
            log.warn("GenerationNPI indisponible, bascule sur le générateur local : {}", e.getMessage());
            return null;
        }
    }

    // ── Construction du DTO de requête ────────────────────────────────────────

    private NpiClientRequest buildRequest(Personne enfant, ActeNaissance acte) {
        // Seul TYPE 1 (Guinéen né en Guinée) est supporté via le microservice pour un acte de naissance.
        // Les autres types nécessitent passport/carte de séjour, absents à la naissance.
        if (!isBornInGuinea(enfant.getPaysNaissance())) {
            return null;
        }

        if (enfant.getNom() == null || enfant.getNom().isBlank()
                || enfant.getPrenom() == null || enfant.getPrenom().isBlank()
                || enfant.getDateNaissance() == null
                || enfant.getSexe() == null) {
            log.warn("Données enfant incomplètes pour appel NPI microservice");
            return null;
        }

        // Résoudre la commune d'abord (nécessaire pour reconstruire le code quartier)
        String communeVal = enfant.getCommuneNaissance();
        if (communeVal == null || communeVal.isBlank()) {
            if (acte.getCommune() != null) communeVal = acte.getCommune().getCode();
        }
        UUID communeId = resolveCommuneId(communeVal, acte);

        // Résoudre le quartier (obligatoire pour TYPE 1 dans GenerationNPI)
        UUID quartierId = resolveQuartierId(enfant.getQuartierNaissance(), communeVal);
        if (quartierId == null) {
            log.info("Quartier '{}' non résolvable, bascule sur générateur local",
                    enfant.getQuartierNaissance());
            return null;
        }

        return NpiClientRequest.builder()
                .type(TYPE_1)
                .nom(enfant.getNom().trim())
                .prenom(enfant.getPrenom().trim())
                .dateNaissance(enfant.getDateNaissance())
                .sexe(normalizeSexe(enfant.getSexe()))
                .numeroActeNaissance(acte.getNumeroActe())
                .lieuNaissanceQuartierId(quartierId)
                .communeNaissanceId(communeId)
                .build();
    }

    /**
     * Résout l'UUID du quartier depuis sa valeur stockée dans Personne.quartierNaissance.
     * RAVEC peut stocker : code complet ("CKY0801"), newCode ("0801"), ou nom textuel.
     * Si newCode (4 chiffres), reconstruit le code complet via le code commune.
     */
    private UUID resolveQuartierId(String quartierVal, String communeVal) {
        if (quartierVal == null || quartierVal.isBlank()) return null;
        String val = quartierVal.trim();

        // 1. Essai par code exact (ex: "CKY0801")
        Optional<Quartier> found = quartierRepository.findByCode(val);
        if (found.isPresent()) return found.get().getId();

        // 2. Si val ressemble à un newCode (4 chars) et commune connue → reconstruire le code complet
        //    Ex: communeCode="CKY08", newCode="0801" → fullCode="CKY08"+"01"="CKY0801"
        if (val.length() == 4 && communeVal != null && !communeVal.isBlank()) {
            String communeCode = communeVal.trim();
            // Vérifier que les 2 premiers chars du newCode correspondent au suffixe commune
            String communeSuffix = communeCode.length() >= 2
                    ? communeCode.substring(communeCode.length() - 2) : communeCode;
            if (val.startsWith(communeSuffix)) {
                String quartierSuffix = val.substring(2);
                String fullCode = communeCode + quartierSuffix;
                found = quartierRepository.findByCode(fullCode);
                if (found.isPresent()) return found.get().getId();
            }
        }

        // 3. Recherche par nom (texte libre)
        return quartierRepository.findFirstByNomIgnoreCase(val)
                .map(Quartier::getId)
                .orElse(null);
    }

    private UUID resolveCommuneId(String communeVal, ActeNaissance acte) {
        if (communeVal == null || communeVal.isBlank()) {
            if (acte.getCommune() != null) return acte.getCommune().getId();
            return null;
        }
        String val = communeVal.trim();
        // RAVEC stocke le code (ex: "CKY08") ou le nom textuel
        return communeRepository.findByCode(val)
                .or(() -> communeRepository.findFirstByNomIgnoreCase(val))
                .map(Commune::getId)
                .orElse(null);
    }

    // ── Détection naissance en Guinée ─────────────────────────────────────────

    private boolean isBornInGuinea(String paysNom) {
        if (paysNom == null || paysNom.isBlank()) return true;
        String upper = paysNom.trim().toUpperCase();
        return upper.contains("GUIN") || upper.equals("GN") || upper.equals("GIN");
    }

    // ── Gestion du token JWT (cache 23h) ──────────────────────────────────────

    private synchronized String getToken() {
        if (cachedToken != null && Instant.now().isBefore(tokenExpiry)) {
            return cachedToken;
        }
        try {
            @SuppressWarnings("unchecked")
            Map<String, String> resp = restClient.post()
                    .uri("/auth/login")
                    .contentType(MediaType.APPLICATION_JSON)
                    .body(Map.of("username", serviceUsername, "password", servicePassword))
                    .retrieve()
                    .body(Map.class);

            if (resp != null && resp.get("token") != null) {
                cachedToken = resp.get("token");
                tokenExpiry = Instant.now().plusSeconds(23 * 3600);
                log.debug("Token NPI microservice renouvelé");
                return cachedToken;
            }
        } catch (Exception e) {
            log.warn("Impossible de s'authentifier auprès de GenerationNPI : {}", e.getMessage());
        }
        return null;
    }

    // ── Utilitaires ───────────────────────────────────────────────────────────

    private String normalizeSexe(String sexe) {
        if (sexe == null) return null;
        String s = sexe.trim().toUpperCase();
        return s.startsWith("M") ? "M" : "F";
    }
}

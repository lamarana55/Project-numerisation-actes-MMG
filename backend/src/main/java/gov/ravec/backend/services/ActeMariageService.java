package gov.ravec.backend.services;

import gov.ravec.backend.dto.ActeMariageDetailDTO;
import gov.ravec.backend.dto.ActeMariageRequest;
import gov.ravec.backend.dto.ActePageResponseDTO;
import gov.ravec.backend.dto.ActeSummaryDTO;
import gov.ravec.backend.entities.ActeMariage;
import gov.ravec.backend.entities.Personne;
import gov.ravec.backend.repositories.ActeMariageRepository;
import gov.ravec.backend.repositories.TypeActeRepository;
import gov.ravec.backend.utils.ActionsFaire;
import gov.ravec.backend.utils.Delete;
import gov.ravec.backend.utils.SourceActe;
import gov.ravec.backend.utils.ValidationStatut;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

@Service
public class ActeMariageService {

    private final ActeMariageRepository acteRepo;
    private final TypeActeRepository typeActeRepo;
    private final UserConnected userConnected;

    public ActeMariageService(ActeMariageRepository acteRepo,
                              TypeActeRepository typeActeRepo,
                              UserConnected userConnected) {
        this.acteRepo      = acteRepo;
        this.typeActeRepo  = typeActeRepo;
        this.userConnected = userConnected;
    }

    @Transactional(readOnly = true)
    public ActeMariageDetailDTO getById(String id) {
        ActeMariage acte = acteRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Acte de mariage introuvable : " + id));
        return ActeMariageDetailDTO.from(acte);
    }

    @Transactional
    public ActeSummaryDTO valider(String id) {
        ActeMariage acte = acteRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Acte de mariage introuvable : " + id));
        acte.setStatut(ValidationStatut.VALIDE);
        acte.setValidateur(userConnected.getUserConnected());
        acte.setDateAction(LocalDateTime.now());
        acteRepo.save(acte);
        return ActeSummaryDTO.from(acte);
    }

    @Transactional
    public void softDelete(String id) {
        ActeMariage acte = acteRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Acte de mariage introuvable : " + id));
        acte.setIsDeleted(Delete.Yes);
        acteRepo.save(acte);
    }

    @Transactional(readOnly = true)
    public ActePageResponseDTO search(String nom, String prenom, String numero,
                                      String dateDebut, String dateFin,
                                      int page, int size) {
        LocalDate debut = parseDate(dateDebut);
        LocalDate fin   = parseDate(dateFin);

        PageRequest pageable = PageRequest.of(page, size, Sort.by(Sort.Direction.DESC, "createdAt"));
        Page<ActeMariage> result = acteRepo.search(
                blankToNull(nom), blankToNull(prenom),
                blankToNull(numero),
                debut, fin, Delete.No, pageable
        );
        return ActePageResponseDTO.from(result, ActeSummaryDTO::from);
    }

    @Transactional
    public ActeSummaryDTO createDeclaration(ActeMariageRequest req) {
        return sauvegarder(req, SourceActe.DECLARATION);
    }

    private ActeSummaryDTO sauvegarder(ActeMariageRequest req, SourceActe source) {

        Personne epoux = new Personne();
        epoux.setId(UUID.randomUUID().toString());
        epoux.setPrenom(req.getPrenomEpoux());
        epoux.setNom(req.getNomEpoux());
        epoux.setSexe("M");
        epoux.setDateNaissance(req.getDateNaissanceEpoux());
        epoux.setCommuneNaissance(req.getCommuneNaissanceEpoux());
        epoux.setNationalite(req.getNationaliteEpoux());
        epoux.setProfession(req.getProfessionEpoux());
        epoux.setTelephone(req.getTelephoneEpoux());
        epoux.setNpi(req.getNpiEpoux());
        epoux.setAdresse(req.getAdresseEpoux());
        epoux.setCommuneDomicile(req.getCommuneDomicileEpoux());
        epoux.setQuartierDomicile(req.getQuartierDomicileEpoux());

        Personne epouse = new Personne();
        epouse.setId(UUID.randomUUID().toString());
        epouse.setPrenom(req.getPrenomEpouse());
        epouse.setNom(req.getNomEpouse());
        epouse.setSexe("F");
        epouse.setDateNaissance(req.getDateNaissanceEpouse());
        epouse.setCommuneNaissance(req.getCommuneNaissanceEpouse());
        epouse.setNationalite(req.getNationaliteEpouse());
        epouse.setProfession(req.getProfessionEpouse());
        epouse.setTelephone(req.getTelephoneEpouse());
        epouse.setNpi(req.getNpiEpouse());
        epouse.setAdresse(req.getAdresseEpouse());
        epouse.setCommuneDomicile(req.getCommuneDomicileEpouse());
        epouse.setQuartierDomicile(req.getQuartierDomicileEpouse());

        Personne temoin1 = null;
        if (hasName(req.getPrenomTemoin1(), req.getNomTemoin1())) {
            temoin1 = new Personne();
            temoin1.setId(UUID.randomUUID().toString());
            temoin1.setPrenom(req.getPrenomTemoin1());
            temoin1.setNom(req.getNomTemoin1());
            temoin1.setSexe(req.getSexeTemoin1() != null ? req.getSexeTemoin1() : "M");
            temoin1.setProfession(req.getProfessionTemoin1());
            temoin1.setTelephone(req.getTelephoneTemoin1());
            temoin1.setNpi(req.getNpiTemoin1());
            temoin1.setAdresse(req.getAdresseTemoin1());
        }

        Personne temoin2 = null;
        if (hasName(req.getPrenomTemoin2(), req.getNomTemoin2())) {
            temoin2 = new Personne();
            temoin2.setId(UUID.randomUUID().toString());
            temoin2.setPrenom(req.getPrenomTemoin2());
            temoin2.setNom(req.getNomTemoin2());
            temoin2.setSexe(req.getSexeTemoin2() != null ? req.getSexeTemoin2() : "M");
            temoin2.setProfession(req.getProfessionTemoin2());
            temoin2.setTelephone(req.getTelephoneTemoin2());
            temoin2.setNpi(req.getNpiTemoin2());
            temoin2.setAdresse(req.getAdresseTemoin2());
        }

        Personne declarant = null;
        if (hasName(req.getPrenomDeclarant(), req.getNomDeclarant())) {
            declarant = new Personne();
            declarant.setId(UUID.randomUUID().toString());
            declarant.setPrenom(req.getPrenomDeclarant());
            declarant.setNom(req.getNomDeclarant());
        }

        Personne pereEpoux = null;
        if (hasName(req.getPrenomPereEpoux(), req.getNomPereEpoux())) {
            pereEpoux = new Personne();
            pereEpoux.setId(UUID.randomUUID().toString());
            pereEpoux.setPrenom(req.getPrenomPereEpoux());
            pereEpoux.setNom(req.getNomPereEpoux());
            pereEpoux.setSexe("M");
            pereEpoux.setProfession(req.getProfessionPereEpoux());
            pereEpoux.setNationalite(req.getNationalitePereEpoux());
        }

        Personne mereEpoux = null;
        if (hasName(req.getPrenomMereEpoux(), req.getNomMereEpoux())) {
            mereEpoux = new Personne();
            mereEpoux.setId(UUID.randomUUID().toString());
            mereEpoux.setPrenom(req.getPrenomMereEpoux());
            mereEpoux.setNom(req.getNomMereEpoux());
            mereEpoux.setSexe("F");
            mereEpoux.setProfession(req.getProfessionMereEpoux());
            mereEpoux.setNationalite(req.getNationaliteMereEpoux());
        }

        Personne pereEpouse = null;
        if (hasName(req.getPrenomPereEpouse(), req.getNomPereEpouse())) {
            pereEpouse = new Personne();
            pereEpouse.setId(UUID.randomUUID().toString());
            pereEpouse.setPrenom(req.getPrenomPereEpouse());
            pereEpouse.setNom(req.getNomPereEpouse());
            pereEpouse.setSexe("M");
            pereEpouse.setProfession(req.getProfessionPereEpouse());
            pereEpouse.setNationalite(req.getNationalitePereEpouse());
        }

        Personne mereEpouse = null;
        if (hasName(req.getPrenomMereEpouse(), req.getNomMereEpouse())) {
            mereEpouse = new Personne();
            mereEpouse.setId(UUID.randomUUID().toString());
            mereEpouse.setPrenom(req.getPrenomMereEpouse());
            mereEpouse.setNom(req.getNomMereEpouse());
            mereEpouse.setSexe("F");
            mereEpouse.setProfession(req.getProfessionMereEpouse());
            mereEpouse.setNationalite(req.getNationaliteMereEpouse());
        }

        var typeActe = typeActeRepo.findByCode("MARIAGE").orElse(null);

        ActionsFaire actionsFaire = ActionsFaire.EN_COURS_SAISIE;
        if (req.getActionsFaire() != null) {
            try {
                actionsFaire = ActionsFaire.valueOf(req.getActionsFaire().toUpperCase());
            } catch (IllegalArgumentException ignored) { }
        }

        ActeMariage acte = ActeMariage.builder()
                .id(UUID.randomUUID().toString())
                .source(source)
                .typeActe(typeActe)
                .numeroActe(req.getNumeroActe())
                .epoux(epoux)
                .epouse(epouse)
                .temoin1(temoin1)
                .temoin2(temoin2)
                .declarant(declarant)
                .pereEpoux(pereEpoux)
                .mereEpoux(mereEpoux)
                .pereEpouse(pereEpouse)
                .mereEpouse(mereEpouse)
                .dateMariage(req.getDateMariage())
                .heureMariage(req.getHeureMariage())
                .typeMariage(req.getTypeMariage())
                .lieuMariage(req.getLieuMariage())
                .regimeMatrimonial(req.getRegimeMatrimonial())
                .etatCivilAntEpoux(req.getEtatCivilAntEpoux())
                .etatCivilAntEpouse(req.getEtatCivilAntEpouse())
                .dateDeclaration(req.getDateDeclaration())
                .signatureDeclarant(req.getSignatureDeclarant())
                .dateDressage(req.getDateDressage())
                .heureDressage(req.getHeureDressage())
                .pointCollecte(req.getPointCollecte())
                .actionsFaire(actionsFaire)
                .statut(ValidationStatut.EN_ATTENTE)
                .dateAction(LocalDateTime.now())
                .agent(userConnected.getUserConnected())
                .isDeleted(Delete.No)
                .build();

        acteRepo.save(acte);
        return ActeSummaryDTO.from(acte);
    }

    private boolean hasName(String prenom, String nom) {
        return (prenom != null && !prenom.isBlank()) || (nom != null && !nom.isBlank());
    }

    private String blankToNull(String s) {
        return (s == null || s.isBlank()) ? null : s;
    }

    private LocalDate parseDate(String s) {
        try {
            return (s != null && !s.isBlank()) ? LocalDate.parse(s) : null;
        } catch (Exception e) {
            return null;
        }
    }
}

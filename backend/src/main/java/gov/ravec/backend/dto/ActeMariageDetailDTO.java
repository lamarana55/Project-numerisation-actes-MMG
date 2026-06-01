package gov.ravec.backend.dto;

import gov.ravec.backend.entities.ActeMariage;
import gov.ravec.backend.entities.Personne;
import lombok.*;

import java.time.LocalDate;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class ActeMariageDetailDTO {

    private String id;
    private String source;
    private String typeActe;
    private String statut;
    private String actionsFaire;
    private String numeroActe;
    private String anneeRegistre;
    private String feuillet;

    // ── Mariage ───────────────────────────────────────────────────
    private LocalDate dateMariage;
    private String heureMariage;
    private String typeMariage;
    private String lieuMariage;
    private String regimeMatrimonial;
    private String etatCivilAntEpoux;
    private String etatCivilAntEpouse;

    // ── Époux ─────────────────────────────────────────────────────
    private String npiEpoux;
    private String prenomEpoux;
    private String nomEpoux;
    private LocalDate dateNaissanceEpoux;
    private String communeNaissanceEpoux;
    private String nationaliteEpoux;
    private String professionEpoux;
    private String telephoneEpoux;
    private String adresseEpoux;
    private String communeDomicileEpoux;
    private String quartierDomicileEpoux;

    // ── Parents de l'époux ────────────────────────────────────────
    private String prenomPereEpoux;
    private String nomPereEpoux;
    private String professionPereEpoux;
    private String nationalitePereEpoux;
    private String prenomMereEpoux;
    private String nomMereEpoux;
    private String professionMereEpoux;
    private String nationaliteMereEpoux;

    // ── Épouse ────────────────────────────────────────────────────
    private String npiEpouse;
    private String prenomEpouse;
    private String nomEpouse;
    private LocalDate dateNaissanceEpouse;
    private String communeNaissanceEpouse;
    private String nationaliteEpouse;
    private String professionEpouse;
    private String telephoneEpouse;
    private String adresseEpouse;
    private String communeDomicileEpouse;
    private String quartierDomicileEpouse;

    // ── Parents de l'épouse ───────────────────────────────────────
    private String prenomPereEpouse;
    private String nomPereEpouse;
    private String professionPereEpouse;
    private String nationalitePereEpouse;
    private String prenomMereEpouse;
    private String nomMereEpouse;
    private String professionMereEpouse;
    private String nationaliteMereEpouse;

    // ── Témoin 1 ──────────────────────────────────────────────────
    private String npiTemoin1;
    private String prenomTemoin1;
    private String nomTemoin1;
    private String sexeTemoin1;
    private String professionTemoin1;
    private String telephoneTemoin1;
    private String adresseTemoin1;

    // ── Témoin 2 ──────────────────────────────────────────────────
    private String npiTemoin2;
    private String prenomTemoin2;
    private String nomTemoin2;
    private String sexeTemoin2;
    private String professionTemoin2;
    private String telephoneTemoin2;
    private String adresseTemoin2;

    // ── Officier / Déclarant ──────────────────────────────────────
    private String prenomDeclarant;
    private String nomDeclarant;
    private LocalDate dateDeclaration;
    private String signatureDeclarant;

    // ── Inscription ───────────────────────────────────────────────
    private LocalDate dateDressage;
    private String heureDressage;
    private String pointCollecte;

    // ── Méta ─────────────────────────────────────────────────────
    private String commune;
    private String agentNomComplet;
    private String validateurNomComplet;
    private String createdAt;

    public static ActeMariageDetailDTO from(ActeMariage a) {
        Personne ex  = a.getEpoux();
        Personne se  = a.getEpouse();
        Personne t1  = a.getTemoin1();
        Personne t2  = a.getTemoin2();
        Personne dec = a.getDeclarant();
        Personne pEx = a.getPereEpoux();
        Personne mEx = a.getMereEpoux();
        Personne pSe = a.getPereEpouse();
        Personne mSe = a.getMereEpouse();

        return ActeMariageDetailDTO.builder()
                .id(a.getId())
                .source(a.getSource() != null ? a.getSource().name() : null)
                .typeActe("mariage")
                .statut(a.getStatut() != null ? a.getStatut().name() : null)
                .actionsFaire(a.getActionsFaire() != null ? a.getActionsFaire().name() : null)
                .numeroActe(a.getNumeroActe())
                .anneeRegistre(a.getAnneeRegistre())
                .feuillet(a.getFeuillet())
                // Mariage
                .dateMariage(a.getDateMariage())
                .heureMariage(a.getHeureMariage())
                .typeMariage(a.getTypeMariage())
                .lieuMariage(a.getLieuMariage())
                .regimeMatrimonial(a.getRegimeMatrimonial())
                .etatCivilAntEpoux(a.getEtatCivilAntEpoux())
                .etatCivilAntEpouse(a.getEtatCivilAntEpouse())
                // Époux
                .npiEpoux(ex != null ? ex.getNpi() : null)
                .prenomEpoux(ex != null ? ex.getPrenom() : null)
                .nomEpoux(ex != null ? ex.getNom() : null)
                .dateNaissanceEpoux(ex != null ? ex.getDateNaissance() : null)
                .communeNaissanceEpoux(ex != null ? ex.getCommuneNaissance() : null)
                .nationaliteEpoux(ex != null ? ex.getNationalite() : null)
                .professionEpoux(ex != null ? ex.getProfession() : null)
                .telephoneEpoux(ex != null ? ex.getTelephone() : null)
                .adresseEpoux(ex != null ? ex.getAdresse() : null)
                .communeDomicileEpoux(ex != null ? ex.getCommuneDomicile() : null)
                .quartierDomicileEpoux(ex != null ? ex.getQuartierDomicile() : null)
                // Parents époux
                .prenomPereEpoux(pEx != null ? pEx.getPrenom() : null)
                .nomPereEpoux(pEx != null ? pEx.getNom() : null)
                .professionPereEpoux(pEx != null ? pEx.getProfession() : null)
                .nationalitePereEpoux(pEx != null ? pEx.getNationalite() : null)
                .prenomMereEpoux(mEx != null ? mEx.getPrenom() : null)
                .nomMereEpoux(mEx != null ? mEx.getNom() : null)
                .professionMereEpoux(mEx != null ? mEx.getProfession() : null)
                .nationaliteMereEpoux(mEx != null ? mEx.getNationalite() : null)
                // Épouse
                .npiEpouse(se != null ? se.getNpi() : null)
                .prenomEpouse(se != null ? se.getPrenom() : null)
                .nomEpouse(se != null ? se.getNom() : null)
                .dateNaissanceEpouse(se != null ? se.getDateNaissance() : null)
                .communeNaissanceEpouse(se != null ? se.getCommuneNaissance() : null)
                .nationaliteEpouse(se != null ? se.getNationalite() : null)
                .professionEpouse(se != null ? se.getProfession() : null)
                .telephoneEpouse(se != null ? se.getTelephone() : null)
                .adresseEpouse(se != null ? se.getAdresse() : null)
                .communeDomicileEpouse(se != null ? se.getCommuneDomicile() : null)
                .quartierDomicileEpouse(se != null ? se.getQuartierDomicile() : null)
                // Parents épouse
                .prenomPereEpouse(pSe != null ? pSe.getPrenom() : null)
                .nomPereEpouse(pSe != null ? pSe.getNom() : null)
                .professionPereEpouse(pSe != null ? pSe.getProfession() : null)
                .nationalitePereEpouse(pSe != null ? pSe.getNationalite() : null)
                .prenomMereEpouse(mSe != null ? mSe.getPrenom() : null)
                .nomMereEpouse(mSe != null ? mSe.getNom() : null)
                .professionMereEpouse(mSe != null ? mSe.getProfession() : null)
                .nationaliteMereEpouse(mSe != null ? mSe.getNationalite() : null)
                // Témoin 1
                .npiTemoin1(t1 != null ? t1.getNpi() : null)
                .prenomTemoin1(t1 != null ? t1.getPrenom() : null)
                .nomTemoin1(t1 != null ? t1.getNom() : null)
                .sexeTemoin1(t1 != null ? t1.getSexe() : null)
                .professionTemoin1(t1 != null ? t1.getProfession() : null)
                .telephoneTemoin1(t1 != null ? t1.getTelephone() : null)
                .adresseTemoin1(t1 != null ? t1.getAdresse() : null)
                // Témoin 2
                .npiTemoin2(t2 != null ? t2.getNpi() : null)
                .prenomTemoin2(t2 != null ? t2.getPrenom() : null)
                .nomTemoin2(t2 != null ? t2.getNom() : null)
                .sexeTemoin2(t2 != null ? t2.getSexe() : null)
                .professionTemoin2(t2 != null ? t2.getProfession() : null)
                .telephoneTemoin2(t2 != null ? t2.getTelephone() : null)
                .adresseTemoin2(t2 != null ? t2.getAdresse() : null)
                // Déclarant
                .prenomDeclarant(dec != null ? dec.getPrenom() : null)
                .nomDeclarant(dec != null ? dec.getNom() : null)
                .dateDeclaration(a.getDateDeclaration())
                .signatureDeclarant(a.getSignatureDeclarant())
                // Inscription
                .dateDressage(a.getDateDressage())
                .heureDressage(a.getHeureDressage())
                .pointCollecte(a.getPointCollecte())
                // Méta
                .commune(a.getCommune() != null ? a.getCommune().getNom() : null)
                .agentNomComplet(a.getAgent() != null ? a.getAgent().getNomComplet() : null)
                .validateurNomComplet(a.getValidateur() != null ? a.getValidateur().getNomComplet() : null)
                .createdAt(a.getCreatedAt() != null ? a.getCreatedAt().toString() : null)
                .build();
    }
}

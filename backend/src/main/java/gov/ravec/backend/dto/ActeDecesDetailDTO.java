package gov.ravec.backend.dto;

import gov.ravec.backend.entities.ActeDeces;
import gov.ravec.backend.entities.Personne;
import lombok.*;

import java.time.LocalDate;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class ActeDecesDetailDTO {

    private String id;
    private String source;
    private String typeActe;
    private String statut;
    private String actionsFaire;
    private String numeroActe;
    private String anneeRegistre;
    private String feuillet;

    // ── Défunt ──────────────────────────────────────────────────────
    private String prenom;
    private String nom;
    private String sexe;
    private LocalDate dateNaissance;
    private String npiDefunt;
    private String paysNaissance;
    private String regionNaissance;
    private String prefectureNaissance;
    private String communeNaissance;
    private String quartierNaissance;
    private String villeNaissance;
    private String nationalite;
    private String profession;
    private String adresseDomicile;
    private String communeDomicile;
    private String quartierDomicile;

    // ── Décès ────────────────────────────────────────────────────────
    private LocalDate dateDeces;
    private String heureDeces;
    private String lieuDeces;
    private String causeDeces;
    private String typeDeces;

    // ── Situation matrimoniale / Conjoint ─────────────────────────────
    private String situationMatrimoniale;
    private String prenomConjoint;
    private String nomConjoint;
    private String nationaliteConjoint;
    private String professionConjoint;

    // ── Père ─────────────────────────────────────────────────────────
    private String npiPere;
    private String prenomPere;
    private String nomPere;
    private LocalDate dateNaissancePere;
    private String communeNaissancePere;
    private String prefectureNaissancePere;
    private String nationalitePere;
    private String professionPere;
    private String telephonePere;
    private String adresseDomicilePere;
    private String communeDomicilePere;
    private String quartierDomicilePere;

    // ── Mère ─────────────────────────────────────────────────────────
    private String npiMere;
    private String prenomMere;
    private String nomMere;
    private LocalDate dateNaissanceMere;
    private String communeNaissanceMere;
    private String prefectureNaissanceMere;
    private String nationaliteMere;
    private String professionMere;
    private String telephoneMere;
    private String adresseDomicileMere;
    private String communeDomicileMere;
    private String quartierDomicileMere;

    // ── Déclarant ────────────────────────────────────────────────────
    private String lienParente;
    private LocalDate dateDeclaration;
    private String npiDeclarant;
    private String prenomDeclarant;
    private String nomDeclarant;
    private String sexeDeclarant;
    private LocalDate dateNaissanceDeclarant;
    private String communeNaissanceDeclarant;
    private String nationaliteDeclarant;
    private String professionDeclarant;
    private String adresseDeclarant;
    private String communeDomicileDeclarant;
    private String quartierDeclarant;
    private String telephoneDeclarant;
    private String signatureDeclarant;
    private String raisonNonSignature;

    // ── Transcription ────────────────────────────────────────────────
    private LocalDate dateJugement;
    private String numeroJugement;
    private String tribunal;

    // ── Inscription / Dressage ──────────────────────────────────────
    private LocalDate dateInscription;
    private LocalDate dateDressage;
    private String heureDressage;
    private String pointCollecte;

    // ── Méta ─────────────────────────────────────────────────────────
    private String commune;
    private String agentNomComplet;
    private String validateurNomComplet;
    private String createdAt;

    // ── Factory ──────────────────────────────────────────────────────
    public static ActeDecesDetailDTO from(ActeDeces a) {
        Personne def  = a.getDefunt();
        Personne conj = a.getConjoint();
        Personne p    = a.getPere();
        Personne m    = a.getMere();
        Personne d    = a.getDeclarant();

        return ActeDecesDetailDTO.builder()
                .id(a.getId())
                .source(a.getSource() != null ? a.getSource().name() : null)
                .typeActe("deces")
                .statut(a.getStatut() != null ? a.getStatut().name() : null)
                .actionsFaire(a.getActionsFaire() != null ? a.getActionsFaire().name() : null)
                .numeroActe(a.getNumeroActe())
                .anneeRegistre(a.getAnneeRegistre())
                .feuillet(a.getFeuillet())
                // Défunt
                .prenom(def != null ? def.getPrenom() : null)
                .nom(def != null ? def.getNom() : null)
                .sexe(def != null ? def.getSexe() : null)
                .dateNaissance(def != null ? def.getDateNaissance() : null)
                .npiDefunt(def != null ? def.getNpi() : null)
                .paysNaissance(def != null ? def.getPaysNaissance() : null)
                .regionNaissance(def != null ? def.getRegionNaissance() : null)
                .prefectureNaissance(def != null ? def.getPrefectureNaissance() : null)
                .communeNaissance(def != null ? def.getCommuneNaissance() : null)
                .quartierNaissance(def != null ? def.getQuartierNaissance() : null)
                .nationalite(def != null ? def.getNationalite() : null)
                .profession(def != null ? def.getProfession() : null)
                .adresseDomicile(def != null ? def.getAdresse() : null)
                .communeDomicile(def != null ? def.getCommuneDomicile() : null)
                .quartierDomicile(def != null ? def.getQuartierDomicile() : null)
                // Décès
                .dateDeces(a.getDateDeces())
                .heureDeces(a.getHeureDeces())
                .lieuDeces(a.getLieuDeces())
                .causeDeces(a.getCauseDeces())
                .typeDeces(a.getTypeDeces())
                .situationMatrimoniale(a.getSituationMatrimoniale())
                // Conjoint
                .prenomConjoint(conj != null ? conj.getPrenom() : null)
                .nomConjoint(conj != null ? conj.getNom() : null)
                .nationaliteConjoint(conj != null ? conj.getNationalite() : null)
                .professionConjoint(conj != null ? conj.getProfession() : null)
                // Père
                .npiPere(p != null ? p.getNpi() : null)
                .prenomPere(p != null ? p.getPrenom() : null)
                .nomPere(p != null ? p.getNom() : null)
                .dateNaissancePere(p != null ? p.getDateNaissance() : null)
                .communeNaissancePere(p != null ? p.getCommuneNaissance() : null)
                .prefectureNaissancePere(p != null ? p.getPrefectureNaissance() : null)
                .nationalitePere(p != null ? p.getNationalite() : null)
                .professionPere(p != null ? p.getProfession() : null)
                .telephonePere(p != null ? p.getTelephone() : null)
                .adresseDomicilePere(p != null ? p.getAdresse() : null)
                .communeDomicilePere(p != null ? p.getCommuneDomicile() : null)
                .quartierDomicilePere(p != null ? p.getQuartierDomicile() : null)
                // Mère
                .npiMere(m != null ? m.getNpi() : null)
                .prenomMere(m != null ? m.getPrenom() : null)
                .nomMere(m != null ? m.getNom() : null)
                .dateNaissanceMere(m != null ? m.getDateNaissance() : null)
                .communeNaissanceMere(m != null ? m.getCommuneNaissance() : null)
                .prefectureNaissanceMere(m != null ? m.getPrefectureNaissance() : null)
                .nationaliteMere(m != null ? m.getNationalite() : null)
                .professionMere(m != null ? m.getProfession() : null)
                .telephoneMere(m != null ? m.getTelephone() : null)
                .adresseDomicileMere(m != null ? m.getAdresse() : null)
                .communeDomicileMere(m != null ? m.getCommuneDomicile() : null)
                .quartierDomicileMere(m != null ? m.getQuartierDomicile() : null)
                // Déclarant
                .lienParente(a.getLienDeclarantDefunt())
                .dateDeclaration(a.getDateDeclaration())
                .npiDeclarant(d != null ? d.getNpi() : null)
                .prenomDeclarant(d != null ? d.getPrenom() : null)
                .nomDeclarant(d != null ? d.getNom() : null)
                .sexeDeclarant(d != null ? d.getSexe() : null)
                .dateNaissanceDeclarant(d != null ? d.getDateNaissance() : null)
                .communeNaissanceDeclarant(d != null ? d.getCommuneNaissance() : null)
                .nationaliteDeclarant(d != null ? d.getNationalite() : null)
                .professionDeclarant(d != null ? d.getProfession() : null)
                .adresseDeclarant(d != null ? d.getAdresse() : null)
                .communeDomicileDeclarant(d != null ? d.getCommuneDomicile() : null)
                .quartierDeclarant(d != null ? d.getQuartierDomicile() : null)
                .telephoneDeclarant(d != null ? d.getTelephone() : null)
                .signatureDeclarant(a.getSignatureDeclarant())
                // Transcription
                .dateJugement(a.getDateJugement())
                .numeroJugement(a.getNumeroJugement())
                .tribunal(a.getTribunal())
                // Inscription
                .dateInscription(a.getDateInscription())
                .dateDressage(a.getDateDressage())
                .heureDressage(a.getHeureDressage())
                // Méta
                .commune(a.getCommune() != null ? a.getCommune().getNom() : null)
                .agentNomComplet(a.getAgent() != null ? a.getAgent().getNomComplet() : null)
                .validateurNomComplet(a.getValidateur() != null ? a.getValidateur().getNomComplet() : null)
                .createdAt(a.getCreatedAt() != null ? a.getCreatedAt().toString() : null)
                .build();
    }
}

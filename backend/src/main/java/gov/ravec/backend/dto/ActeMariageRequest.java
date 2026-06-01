package gov.ravec.backend.dto;

import lombok.*;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ActeMariageRequest {

    // ── Mariage ───────────────────────────────────────────────────
    private LocalDate dateMariage;
    private String heureMariage;
    private String typeMariage;   // CIVIL | RELIGIEUX | COUTUMIER
    private String lieuMariage;
    private String communeMariage;
    private String regimeMatrimonial;

    // ── Époux ─────────────────────────────────────────────────────
    private String prenomEpoux;
    private String nomEpoux;
    private LocalDate dateNaissanceEpoux;
    private String communeNaissanceEpoux;
    private String nationaliteEpoux;
    private String professionEpoux;
    private String telephoneEpoux;
    private String npiEpoux;
    private String adresseEpoux;
    private String communeDomicileEpoux;
    private String quartierDomicileEpoux;
    private String etatCivilAntEpoux;

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
    private String prenomEpouse;
    private String nomEpouse;
    private LocalDate dateNaissanceEpouse;
    private String communeNaissanceEpouse;
    private String nationaliteEpouse;
    private String professionEpouse;
    private String telephoneEpouse;
    private String npiEpouse;
    private String adresseEpouse;
    private String communeDomicileEpouse;
    private String quartierDomicileEpouse;
    private String etatCivilAntEpouse;

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
    private String prenomTemoin1;
    private String nomTemoin1;
    private String sexeTemoin1;
    private String professionTemoin1;
    private String telephoneTemoin1;
    private String npiTemoin1;
    private String adresseTemoin1;

    // ── Témoin 2 ──────────────────────────────────────────────────
    private String prenomTemoin2;
    private String nomTemoin2;
    private String sexeTemoin2;
    private String professionTemoin2;
    private String telephoneTemoin2;
    private String npiTemoin2;
    private String adresseTemoin2;

    // ── Officier / Déclarant ──────────────────────────────────────
    private String prenomDeclarant;
    private String nomDeclarant;
    private String qualiteDeclarant;
    private LocalDate dateDeclaration;
    private String signatureDeclarant;

    // ── Inscription ───────────────────────────────────────────────
    private LocalDate dateDressage;
    private String heureDressage;
    private String pointCollecte;
    private String actionsFaire;
    private String numeroActe;
}

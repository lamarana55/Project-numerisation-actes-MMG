package gov.ravec.backend.entities;

import gov.ravec.backend.utils.ActionsFaire;
import gov.ravec.backend.utils.BaseEntity;
import gov.ravec.backend.utils.Delete;
import gov.ravec.backend.utils.SourceActe;
import gov.ravec.backend.utils.ValidationStatut;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "acte_mariage")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ActeMariage extends BaseEntity {

    @Id
    private String id;

    // ── Source ────────────────────────────────────────────────────
    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private SourceActe source;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "type_acte_id")
    private TypeActe typeActe;

    @Column(name = "numero_acte")
    private String numeroActe;

    @Column(name = "annee_registre")
    private String anneeRegistre;

    private String feuillet;

    // ── Personnes ─────────────────────────────────────────────────

    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name = "epoux_id")
    private Personne epoux;

    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name = "epouse_id")
    private Personne epouse;

    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name = "temoin1_id")
    private Personne temoin1;

    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name = "temoin2_id")
    private Personne temoin2;

    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name = "declarant_id")
    private Personne declarant;

    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name = "pere_epoux_id")
    private Personne pereEpoux;

    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name = "mere_epoux_id")
    private Personne mereEpoux;

    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name = "pere_epouse_id")
    private Personne pereEpouse;

    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name = "mere_epouse_id")
    private Personne mereEpouse;

    // ── Mariage ───────────────────────────────────────────────────
    @Column(name = "date_mariage")
    private LocalDate dateMariage;

    @Column(name = "heure_mariage")
    private String heureMariage;

    @Column(name = "type_mariage")
    private String typeMariage;

    @Column(name = "lieu_mariage")
    private String lieuMariage;

    @Column(name = "regime_matrimonial")
    private String regimeMatrimonial;

    // ── État civil antérieur ──────────────────────────────────────
    @Column(name = "etat_civil_ant_epoux")
    private String etatCivilAntEpoux;

    @Column(name = "etat_civil_ant_epouse")
    private String etatCivilAntEpouse;

    // ── Déclaration ───────────────────────────────────────────────
    @Column(name = "date_declaration")
    private LocalDate dateDeclaration;

    @Column(name = "signature_declarant")
    private String signatureDeclarant;

    // ── Inscription ───────────────────────────────────────────────
    @Column(name = "date_dressage")
    private LocalDate dateDressage;

    @Column(name = "heure_dressage")
    private String heureDressage;

    @Column(name = "point_collecte")
    private String pointCollecte;

    // ── Localisation ──────────────────────────────────────────────
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "commune_id")
    private Commune commune;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "agent_id")
    private User agent;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "validateur_id")
    private User validateur;

    // ── Workflow ──────────────────────────────────────────────────
    @Enumerated(EnumType.STRING)
    @Column(name = "actions_faire", nullable = false)
    @Builder.Default
    private ActionsFaire actionsFaire = ActionsFaire.EN_COURS_SAISIE;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    @Builder.Default
    private ValidationStatut statut = ValidationStatut.EN_ATTENTE;

    @Column(name = "motif_rejet", columnDefinition = "TEXT")
    private String motifRejet;

    @Column(name = "date_action")
    private LocalDateTime dateAction;

    @Enumerated(EnumType.STRING)
    @Column(name = "is_deleted", nullable = false)
    @Builder.Default
    private Delete isDeleted = Delete.No;
}

package gov.ravec.generation.entity;

import gov.ravec.generation.dto.TypeNpi;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.UuidGenerator;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "npi_genere")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NpiGenere {

    @Id
    @UuidGenerator
    private UUID id;

    @Column(nullable = false, unique = true, length = 20)
    private String npi;

    @Enumerated(EnumType.STRING)
    @Column(name = "type_npi", nullable = false, length = 50)
    private TypeNpi typeNpi;

    @Column(nullable = false, length = 100)
    private String nom;

    @Column(nullable = false, length = 100)
    private String prenom;

    @Column(name = "date_naissance", nullable = false)
    private LocalDate dateNaissance;

    @Column(nullable = false, length = 1)
    private String sexe;

    @Column(name = "quartier_id")
    private UUID quartierId;

    @Column(name = "commune_naissance_id")
    private UUID communeNaissanceId;

    @Column(name = "pays_naissance_code", length = 3)
    private String paysNaissanceCode;

    @Column(name = "numero_certificat_naissance", length = 50)
    private String numeroCertificatNaissance;

    @Column(name = "numero_acte_naissance", length = 50)
    private String numeroActeNaissance;

    @Column(name = "numero_passeport", length = 50)
    private String numeroPasseport;

    @Column(name = "nationalite", length = 100)
    private String nationalite;

    @Column(name = "numero_carte", length = 50)
    private String numeroCarte;

    @Column(name = "date_expiration_titre_sejour")
    private LocalDate dateExpirationTitreSejour;

    @Column(name = "date_generation", nullable = false)
    private LocalDateTime dateGeneration;

    @Column(nullable = false, length = 20)
    private String statut;

    @Column(name = "generated_by", length = 100)
    private String generatedBy;
}

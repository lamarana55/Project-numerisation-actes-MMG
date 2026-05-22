package gov.ravec.generation.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.Data;

import java.time.LocalDate;
import java.util.UUID;

@Data
public class NpiRequest {

    @NotNull(message = "Le type de NPI est obligatoire")
    private TypeNpi type;

    @NotBlank(message = "Le nom est obligatoire")
    private String nom;

    @NotBlank(message = "Le prénom est obligatoire")
    private String prenom;

    @NotNull(message = "La date de naissance est obligatoire")
    private LocalDate dateNaissance;

    @NotBlank(message = "Le sexe est obligatoire")
    @Pattern(regexp = "^[MF]$", message = "Le sexe doit être M ou F")
    private String sexe;

    // === TYPE 1 ===
    private UUID lieuNaissanceQuartierId;
    private String numeroCertificatNaissance;
    private String numeroActeNaissance;
    private UUID communeNaissanceId;

    // === TYPES 2, 3, 4 ===
    private String paysNaissanceCode;
    private UUID quartierId;

    // === TYPE 2, 4 ===
    private String numeroPasseport;

    // === TYPES 3, 4 ===
    private String nationalite;

    // === TYPE 3 ===
    private String numeroCarte;

    // === TYPE 4 ===
    private LocalDate dateExpirationTitreSejour;
}

package gov.ravec.backend.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Builder;
import lombok.Data;

import java.time.LocalDate;
import java.util.UUID;

@Data
@Builder
@JsonInclude(JsonInclude.Include.NON_NULL)
public class NpiClientRequest {

    private String type;
    private String nom;
    private String prenom;
    private LocalDate dateNaissance;
    private String sexe;

    // TYPE 1 — Guinéen né en Guinée
    private UUID lieuNaissanceQuartierId;
    private UUID communeNaissanceId;
    private String numeroActeNaissance;

    // TYPE 2 — Guinéen né à l'étranger
    private String paysNaissanceCode;
}

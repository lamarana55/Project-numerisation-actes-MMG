package gov.ravec.backend.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class NpiClientResponse {
    private String npi;
    private String type;
    private LocalDateTime dateGeneration;
    private String statut;
}

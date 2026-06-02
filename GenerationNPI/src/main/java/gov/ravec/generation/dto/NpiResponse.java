package gov.ravec.generation.dto;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Builder
public class NpiResponse {
    private String npi;
    private TypeNpi type;
    private LocalDateTime dateGeneration;
    private String statut;
}

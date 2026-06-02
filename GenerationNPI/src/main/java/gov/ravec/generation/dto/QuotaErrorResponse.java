package gov.ravec.generation.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class QuotaErrorResponse {
    private String code;
    private String message;
    private String reinitialisation;
}

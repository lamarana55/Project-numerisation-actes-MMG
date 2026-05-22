package gov.ravec.generation.exception;

import gov.ravec.generation.dto.QuotaErrorResponse;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.Map;
import java.util.stream.Collectors;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(QuotaDepasseException.class)
    public ResponseEntity<QuotaErrorResponse> handleQuota(QuotaDepasseException ex) {
        return ResponseEntity.status(HttpStatus.TOO_MANY_REQUESTS).body(
                QuotaErrorResponse.builder()
                        .code("QUOTA_QUARTIER_DEPASSE")
                        .message("Le quartier [" + ex.getQuartierNom() + "] a atteint la limite de 10 000 NPI pour le mois en cours.")
                        .reinitialisation(ex.getReinitialisation())
                        .build()
        );
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<Map<String, String>> handleValidation(MethodArgumentNotValidException ex) {
        Map<String, String> errors = ex.getBindingResult().getFieldErrors().stream()
                .collect(Collectors.toMap(
                        fe -> fe.getField(),
                        fe -> fe.getDefaultMessage() != null ? fe.getDefaultMessage() : "Invalide"
                ));
        return ResponseEntity.badRequest().body(errors);
    }

    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity<Map<String, String>> handleIllegal(IllegalArgumentException ex) {
        return ResponseEntity.badRequest().body(Map.of("error", ex.getMessage()));
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<Map<String, String>> handleGeneric(Exception ex) {
        return ResponseEntity.internalServerError().body(
                Map.of("error", "Erreur interne", "message", ex.getMessage())
        );
    }
}

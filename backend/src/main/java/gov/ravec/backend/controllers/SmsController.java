package gov.ravec.backend.controllers;

import gov.ravec.backend.dto.SmsSendRequest;
import gov.ravec.backend.services.NimbaSmsService;
import gov.ravec.backend.utils.Response;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * API d'envoi de SMS via NimbaSMS.
 */
@Tag(name = "SMS", description = "Envoi de SMS via NimbaSMS")
@RestController
@RequestMapping("/sms")
public class SmsController {

    private final NimbaSmsService nimbaSmsService;

    public SmsController(NimbaSmsService nimbaSmsService) {
        this.nimbaSmsService = nimbaSmsService;
    }

    @Operation(summary = "Envoyer un SMS",
            description = "Envoie un SMS au destinataire indiqué via NimbaSMS.")
    @PostMapping("/send")
    @PreAuthorize("hasAuthority('CAN_MANAGE_SETTINGS')")
    public ResponseEntity<Object> send(@RequestBody SmsSendRequest request) {
        boolean ok = nimbaSmsService.send(request.getTo(), request.getMessage());
        if (ok) {
            return ResponseEntity.ok(new Response<>(true, "SMS envoyé avec succès."));
        }
        return ResponseEntity.status(HttpStatus.BAD_GATEWAY)
                .body(new Response<>(false, "Échec de l'envoi du SMS. Vérifiez la configuration NimbaSMS."));
    }

    @Operation(summary = "Solde / compte NimbaSMS",
            description = "Retourne les informations du compte NimbaSMS (dont le solde de SMS).")
    @GetMapping("/account")
    @PreAuthorize("hasAuthority('CAN_MANAGE_SETTINGS')")
    public ResponseEntity<Map<String, Object>> account() {
        return ResponseEntity.ok(nimbaSmsService.getAccount());
    }
}

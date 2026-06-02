package gov.ravec.generation.controller;

import gov.ravec.generation.dto.NpiRequest;
import gov.ravec.generation.dto.NpiResponse;
import gov.ravec.generation.service.NpiService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/npi")
@Tag(name = "NPI", description = "Génération du Numéro Personnel d'Identification")
@SecurityRequirement(name = "bearerAuth")
public class NpiController {

    private final NpiService npiService;

    public NpiController(NpiService npiService) {
        this.npiService = npiService;
    }

    @PostMapping("/generer")
    @Operation(
        summary = "Générer un NPI",
        description = "Génère un NPI unique pour l'un des 4 types de personnes. "
                + "Retourne HTTP 429 si le quota mensuel du quartier est dépassé."
    )
    public ResponseEntity<NpiResponse> generer(
            @Valid @RequestBody NpiRequest request,
            @AuthenticationPrincipal UserDetails currentUser) {

        NpiResponse response = npiService.generer(request, currentUser.getUsername());
        return ResponseEntity.ok(response);
    }
}

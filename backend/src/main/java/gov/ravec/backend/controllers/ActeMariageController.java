package gov.ravec.backend.controllers;

import gov.ravec.backend.dto.ActeMariageDetailDTO;
import gov.ravec.backend.dto.ActeMariageRequest;
import gov.ravec.backend.dto.ActePageResponseDTO;
import gov.ravec.backend.dto.ActeSummaryDTO;
import gov.ravec.backend.services.ActeMariageService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@Tag(name = "Actes Mariage", description = "Gestion des actes de mariage")
@RestController
@RequestMapping("/actes/mariage")
public class ActeMariageController {

    private final ActeMariageService acteMariageService;

    public ActeMariageController(ActeMariageService acteMariageService) {
        this.acteMariageService = acteMariageService;
    }

    @Operation(summary = "Lister les actes de mariage")
    @GetMapping
    @PreAuthorize("hasAuthority('CAN_VIEW_VALIDATED_ACTS')")
    public ResponseEntity<ActePageResponseDTO> search(
            @RequestParam(required = false) String nom,
            @RequestParam(required = false) String prenom,
            @RequestParam(required = false) String numero,
            @RequestParam(required = false) String dateDebut,
            @RequestParam(required = false) String dateFin,
            @RequestParam(defaultValue = "0")  int page,
            @RequestParam(defaultValue = "25") int size) {

        return ResponseEntity.ok(acteMariageService.search(nom, prenom, numero, dateDebut, dateFin, page, size));
    }

    @Operation(summary = "Créer une déclaration de mariage")
    @PostMapping
    @PreAuthorize("hasAuthority('CAN_SAISIR_NAISSANCE')")
    public ResponseEntity<ActeSummaryDTO> createDeclaration(@RequestBody ActeMariageRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(acteMariageService.createDeclaration(request));
    }

    @Operation(summary = "Consulter le détail d'un acte de mariage")
    @GetMapping("/{id}")
    @PreAuthorize("hasAuthority('CAN_VIEW_VALIDATED_ACTS')")
    public ResponseEntity<ActeMariageDetailDTO> getById(@PathVariable String id) {
        return ResponseEntity.ok(acteMariageService.getById(id));
    }

    @Operation(summary = "Valider un acte de mariage")
    @PutMapping("/{id}/valider")
    @PreAuthorize("hasAuthority('CAN_VALIDATE_ACTS')")
    public ResponseEntity<ActeSummaryDTO> valider(@PathVariable String id) {
        return ResponseEntity.ok(acteMariageService.valider(id));
    }

    @Operation(summary = "Supprimer logiquement un acte de mariage")
    @DeleteMapping("/{id}")
    @PreAuthorize("hasAuthority('CAN_SAISIR_NAISSANCE')")
    public ResponseEntity<Void> softDelete(@PathVariable String id) {
        acteMariageService.softDelete(id);
        return ResponseEntity.noContent().build();
    }
}

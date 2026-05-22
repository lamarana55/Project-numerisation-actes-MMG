package gov.ravec.generation.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.util.UUID;

@Entity
@Table(
    name = "npi_quota_quartier",
    uniqueConstraints = @UniqueConstraint(
        name = "uq_quota_quartier_mois",
        columnNames = {"quartier_id", "mois"}
    )
)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NpiQuotaQuartier {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "quartier_id", nullable = false)
    private UUID quartierId;

    @Column(nullable = false)
    private LocalDate mois;

    @Column(nullable = false)
    private Integer compteur;
}

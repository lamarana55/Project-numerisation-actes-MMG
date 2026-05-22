package gov.ravec.generation.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.UUID;

@Entity
@Table(name = "prefecture")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Prefecture {

    @Id
    private UUID id;

    private String code;
    private String nom;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "region_id")
    private Region region;
}

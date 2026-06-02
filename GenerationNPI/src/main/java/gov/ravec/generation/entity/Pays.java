package gov.ravec.generation.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.UUID;

@Entity
@Table(name = "pays")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Pays {

    @Id
    private UUID id;

    /** Code ISO alpha-3 (ex : "FRA", "GIN") */
    private String code;

    private String nom;

    /** Code numérique ISO 3166-1 sur 3 chiffres (ex : "250", "324") */
    @Column(name = "code_numerique")
    private String codeNumerique;

    /** Code région ONU sur 3 chiffres (ex : "150", "002") */
    @Column(name = "code_region")
    private String codeRegion;
}

package gov.ravec.generation.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.UUID;

@Entity
@Table(name = "quartier")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Quartier {

    @Id
    private UUID id;

    private String code;
    private String nom;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "commune_id")
    private Commune commune;

    /**
     * new_code = 2 derniers chars du code commune + 2 derniers chars du code quartier.
     * Ex : commune "CKY01", quartier "0101" → new_code = "0101"
     */
    public String getNewCode() {
        if (commune == null || commune.getCode() == null || code == null) return null;
        String commSuffix = commune.getCode().length() >= 2
                ? commune.getCode().substring(commune.getCode().length() - 2)
                : commune.getCode();
        String quartSuffix = code.length() >= 2
                ? code.substring(code.length() - 2)
                : code;
        return commSuffix + quartSuffix;
    }
}

package gov.ravec.backend.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Payload d'envoi d'un SMS via NimbaSMS.
 */
@Getter
@Setter
@NoArgsConstructor
public class SmsSendRequest {

    /** Destinataire au format international (ex: +224620000000). */
    private String to;

    /** Contenu du message. */
    private String message;
}

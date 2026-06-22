package gov.ravec.backend.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

/**
 * Corps de la requête d'envoi de SMS NimbaSMS (POST /v1/messages).
 * Les noms de champs JSON suivent l'API : sender_name, to, message.
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class NimbaSmsMessageRequest {

    @JsonProperty("sender_name")
    private String senderName;

    private List<String> to;

    private String message;
}

package gov.ravec.backend.services;

import com.fasterxml.jackson.databind.ObjectMapper;
import gov.ravec.backend.dto.NimbaSmsMessageRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClient;

import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.List;
import java.util.Map;

/**
 * Service d'envoi de SMS via l'API NimbaSMS (https://developers.nimbasms.com/).
 *
 * <p>Authentification : HTTP Basic ({@code service_id:secret_token}).
 * Endpoint d'envoi : {@code POST https://api.nimbasms.com/v1/messages} avec un corps
 * JSON {@code { "sender_name": "...", "to": ["+224..."], "message": "..." }}.</p>
 *
 * <p>Les identifiants sont fournis par variables d'environnement
 * ({@code NIMBASMS_SERVICE_ID}, {@code NIMBASMS_SECRET_TOKEN}, {@code NIMBASMS_SENDER_NAME}).</p>
 */
@Service
public class NimbaSmsService {

    private static final Logger log = LoggerFactory.getLogger(NimbaSmsService.class);

    private final RestClient restClient;
    private final String authHeader;
    private final String senderName;
    private final boolean configured;
    private final ObjectMapper objectMapper = new ObjectMapper();

    public NimbaSmsService(@Qualifier("nimbaSmsRestClient") RestClient restClient,
                           @Value("${nimbasms.service-id:}") String serviceId,
                           @Value("${nimbasms.secret-token:}") String secretToken,
                           @Value("${nimbasms.sender-name:RAVEC}") String senderName) {
        this.restClient = restClient;
        // Nettoyage (un .env en CRLF peut introduire des espaces/retours parasites).
        String id = serviceId == null ? "" : serviceId.trim();
        String token = secretToken == null ? "" : secretToken.trim();
        this.senderName = senderName == null ? "RAVEC" : senderName.trim();
        this.configured = !id.isBlank() && !token.isBlank();
        this.authHeader = "Basic " + Base64.getEncoder()
                .encodeToString((id + ":" + token).getBytes(StandardCharsets.UTF_8));
    }

    /** Envoie un SMS à un seul destinataire. */
    public boolean send(String to, String message) {
        return send(List.of(to), message);
    }

    /**
     * Envoie un SMS à un ou plusieurs destinataires (format international, ex: +224620000000).
     *
     * @return {@code true} si l'API a accepté l'envoi, {@code false} sinon.
     */
    @SuppressWarnings("unchecked")
    public boolean send(List<String> to, String message) {
        if (!configured) {
            log.error("NimbaSMS non configuré : renseignez NIMBASMS_SERVICE_ID / NIMBASMS_SECRET_TOKEN.");
            return false;
        }
        if (to == null || to.isEmpty() || message == null || message.isBlank()) {
            log.warn("Envoi SMS ignoré : destinataire ou message vide.");
            return false;
        }
        try {
            NimbaSmsMessageRequest payload = new NimbaSmsMessageRequest(senderName, to, message);
            // Sérialisation manuelle : le RestClient "nu" ne convertit pas l'objet en JSON.
            String json = objectMapper.writeValueAsString(payload);

            Map<String, Object> response = restClient.post()
                    .uri("/messages")
                    .header("Authorization", authHeader)
                    .contentType(MediaType.APPLICATION_JSON)
                    .accept(MediaType.APPLICATION_JSON)
                    .body(json)
                    .retrieve()
                    .body(Map.class);

            log.info("SMS NimbaSMS envoyé à {} (sender='{}', réponse: {})", to, senderName, response);
            return true;
        } catch (Exception e) {
            log.error("Échec de l'envoi du SMS NimbaSMS à {} (sender='{}') : {}", to, senderName, e.getMessage());
            return false;
        }
    }

    /** Récupère les informations du compte (dont le solde de SMS). */
    @SuppressWarnings("unchecked")
    public Map<String, Object> getAccount() {
        if (!configured) {
            return Map.of("error", "NimbaSMS non configuré");
        }
        try {
            return restClient.get()
                    .uri("/accounts")
                    .header("Authorization", authHeader)
                    .retrieve()
                    .body(Map.class);
        } catch (Exception e) {
            log.error("Échec récupération compte NimbaSMS : {}", e.getMessage());
            return Map.of("error", e.getMessage());
        }
    }

    public boolean isConfigured() {
        return configured;
    }
}

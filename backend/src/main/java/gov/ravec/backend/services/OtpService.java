package gov.ravec.backend.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.security.SecureRandom;
import java.time.Duration;
import java.time.Instant;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Génération et vérification de codes OTP (One-Time Password) pour la connexion
 * par téléphone. Le code est envoyé par SMS via {@link NimbaSmsService}.
 *
 * <p>Stockage en mémoire (suffisant pour une instance unique). Pour un déploiement
 * multi-instances, remplacer par un stockage partagé (Redis / table dédiée).</p>
 */
@Service
public class OtpService {

    private static final Logger log = LoggerFactory.getLogger(OtpService.class);

    private static final Duration TTL = Duration.ofMinutes(5);
    private static final int MAX_ATTEMPTS = 5;

    private final NimbaSmsService smsService;
    private final SecureRandom random = new SecureRandom();
    private final Map<String, Otp> store = new ConcurrentHashMap<>();

    public OtpService(NimbaSmsService smsService) {
        this.smsService = smsService;
    }

    private record Otp(String code, Instant expiresAt, int attempts) {}

    /**
     * Génère un code à 6 chiffres, le stocke et l'envoie par SMS.
     *
     * @return {@code true} si le SMS a été accepté par NimbaSMS.
     */
    public boolean requestCode(String telephone) {
        String key = normalize(telephone);
        String code = String.format("%06d", random.nextInt(1_000_000));
        store.put(key, new Otp(code, Instant.now().plus(TTL), 0));

        String message = "Votre code de connexion RAVEC est : " + code
                + ". Il expire dans 5 minutes.";
        boolean envoye = smsService.send(telephone, message);
        if (envoye) {
            log.info("Code OTP envoyé par SMS au {}", key);
        } else {
            log.warn("Échec de l'envoi du code OTP au {}", key);
        }
        return envoye;
    }

    /**
     * Vérifie le code fourni pour un numéro. Consomme le code en cas de succès.
     */
    public boolean verifyCode(String telephone, String code) {
        String key = normalize(telephone);
        Otp otp = store.get(key);
        if (otp == null) return false;

        if (Instant.now().isAfter(otp.expiresAt()) || otp.attempts() >= MAX_ATTEMPTS) {
            store.remove(key);
            return false;
        }

        boolean ok = otp.code().equals(code == null ? "" : code.trim());
        if (ok) {
            store.remove(key);
        } else {
            store.put(key, new Otp(otp.code(), otp.expiresAt(), otp.attempts() + 1));
        }
        return ok;
    }

    private String normalize(String telephone) {
        return telephone == null ? "" : telephone.trim();
    }
}

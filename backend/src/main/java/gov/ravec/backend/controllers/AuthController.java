package gov.ravec.backend.controllers;

import gov.ravec.backend.dto.ChangePasswordRequest;
import gov.ravec.backend.dto.ProfileUpdateRequest;
import gov.ravec.backend.dto.UserDTO;
import gov.ravec.backend.entities.User;
import gov.ravec.backend.repositories.UserRepository;
import gov.ravec.backend.security.JwtProvider;
import gov.ravec.backend.security.JwtResponse;
import gov.ravec.backend.services.SendMailService;
import gov.ravec.backend.services.UserConnected;
import gov.ravec.backend.services.UserService;
import gov.ravec.backend.utils.Delete;
import gov.ravec.backend.utils.LoginInfo;
import gov.ravec.backend.utils.Response;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.mail.MessagingException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/auth")
@Tag(name = "Authentification", description = "Gestion de l'authentification et réinitialisation des mots de passe")
public class AuthController {
    private static final Logger logger = LoggerFactory.getLogger(AuthController.class);

    @Autowired
    private UserConnected userConnected;
    @Autowired
    private SendMailService sendMailService;

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private PasswordEncoder encoder;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private JwtProvider jwtProvider;

    @Autowired
    private gov.ravec.backend.services.OtpService otpService;

    @Value("${ravec.app.frontend.url}")
    private String link;

    @PostMapping("/signin")
    @Operation(summary = "Connexion utilisateur", description = "Authentifié un utilisateur avec son nom d'utilisateur et mot de passe, retourne un token JWT")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Connexion réussie", content = @Content(schema = @Schema(implementation = JwtResponse.class))),
            @ApiResponse(responseCode = "401", description = "Mot de passe incorrect"),
            @ApiResponse(responseCode = "403", description = "Utilisateur non trouvé dans la base de données")
    })
    public ResponseEntity<?> login(@RequestBody LoginInfo loginInfo) {
        Optional<User> user = userRepository.findByUsernameAndIsDelete(loginInfo.getUsername(), Delete.No);

        try {
            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(loginInfo.getUsername(), loginInfo.getPassword()));

            if (user.isEmpty()) {
                logger.warn("Auth succeeded but user {} not found in DB", loginInfo.getUsername());
                return new ResponseEntity<>(
                        new Response<String>("Auth failed", "failed", "Identifiants incorrects. Veuillez contacter l'administrateur."),
                        HttpStatus.UNAUTHORIZED);
            }

            SecurityContextHolder.getContext().setAuthentication(authentication);
            String jwt = jwtProvider.generateJwtToken(authentication);
            gov.ravec.backend.utils.UserPrinciple userPrincipal =
                    (gov.ravec.backend.utils.UserPrinciple) authentication.getPrincipal();
            String name = user.get().getPrenom() + "  " + user.get().getNom();

            JwtResponse response = JwtResponse.builder()
                    .accessToken(jwt)
                    .name(name)
                    .username(loginInfo.getUsername())
                    .tokenType("Bearer")
                    .authorities(userPrincipal.getAuthorities())
                    .profil(userPrincipal.getProfil())
                    .profilLibelle(userPrincipal.getProfilLibelle())
                    .niveauAdministratif(userPrincipal.getNiveauAdministratif())
                    .regionId(userPrincipal.getRegionId())
                    .regionNom(userPrincipal.getRegionNom())
                    .prefectureId(userPrincipal.getPrefectureId())
                    .prefectureNom(userPrincipal.getPrefectureNom())
                    .communeId(userPrincipal.getCommuneId())
                    .communeNom(userPrincipal.getCommuneNom())
                    .mustChangePassword(user.get().isMustChangePassword())
                    .build();

            return ResponseEntity.ok(response);

        } catch (BadCredentialsException e) {
            logger.warn("Failed login attempt for username: {}", loginInfo.getUsername());
            return new ResponseEntity<>(
                    new Response("Auth failed", "failed", "Identifiants incorrects. Veuillez réessayer ou contacter l'administrateur."),
                    HttpStatus.UNAUTHORIZED);
        }
    }

    // @ApiOperation(value = "Methode qui envoi l'email pour la renitialisation du
    // password")
    @PostMapping("/send-email")
    @Operation(summary = "Réinitialisation du mot de passe", description = "Envoie un email avec un lien de réinitialisation du mot de passe à l'adresse email spécifiée")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Email envoyé avec succès"),
            @ApiResponse(responseCode = "404", description = "Email non trouvé dans la base de données")
    })
    public ResponseEntity<Object> send(@RequestBody Map<String, String> body) throws MessagingException {
        String email = body.get("email");
        Optional<User> user = userRepository.findByEmail(email.trim());

        if (user.isPresent()) {
            String resetPasswordToken = userConnected.getRandomString(25);
            String lien = link + "/login/update-password/" + resetPasswordToken;

            User currentUser = user.get();
            currentUser.setResetPasswordToken(resetPasswordToken);
            currentUser.setUpdatedAt(Instant.now().plus(30, ChronoUnit.MINUTES));

            User userUpdate = userRepository.save(currentUser);

            sendMailService.sendEmailHtmlReset(
                    userUpdate.getNom() + " " + userUpdate.getPrenom(),
                    userUpdate.getEmail(),
                    lien);
        }
        // Toujours retourner le même message pour éviter l'énumération des emails
        return ResponseEntity.ok(new Response<>(true, "Si cet email existe, un lien de réinitialisation a été envoyé."));
    }

    /**
     * Changement de mot de passe obligatoire lors de la première connexion
     * (ou après une réinitialisation par un administrateur).
     *
     * <p>L'utilisateur doit être authentifié. Le mot de passe actuel est vérifié
     * avant d'appliquer le nouveau. En cas de succès, le flag {@code mustChangePassword}
     * est remis à {@code false} en base et la réponse le confirme.</p>
     */
    /**
     * Retourne le profil complet de l'utilisateur authentifié.
     */
    @GetMapping("/me")
    @Operation(summary = "Mon profil", description = "Retourne le profil de l'utilisateur connecté")
    public ResponseEntity<Object> getMyProfile() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || !authentication.isAuthenticated()
                || "anonymousUser".equals(authentication.getName())) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(new Response<>(false, "Utilisateur non authentifié."));
        }
        return userRepository.findByUsernameAndIsDelete(authentication.getName(), Delete.No)
                .map(u -> ResponseEntity.ok((Object) User.toDTO(u)))
                .orElse(ResponseEntity.notFound().build());
    }

    /**
     * Met à jour les informations personnelles de l'utilisateur authentifié.
     * Seuls nom, prénom, email, téléphone et fonction sont modifiables.
     */
    @PatchMapping("/me")
    @Operation(summary = "Modifier mon profil", description = "Modifie les informations personnelles de l'utilisateur connecté")
    public ResponseEntity<Object> updateMyProfile(@RequestBody ProfileUpdateRequest req) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || !authentication.isAuthenticated()
                || "anonymousUser".equals(authentication.getName())) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(new Response<>(false, "Utilisateur non authentifié."));
        }
        UserDTO updated = userService.updateMyProfile(authentication.getName(), req);
        if (updated != null) {
            return ResponseEntity.ok((Object) updated);
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND)
                .body(new Response<>(false, "Utilisateur introuvable."));
    }

    // ── Connexion par téléphone + OTP ─────────────────────────────────────────

    @PostMapping("/otp/request")
    @Operation(summary = "Demander un code OTP",
            description = "Génère un code à 6 chiffres et l'envoie par SMS (NimbaSMS) au numéro fourni.")
    public ResponseEntity<Object> otpRequest(@RequestBody Map<String, String> body) {
        String telephone = body.get("telephone");
        if (telephone == null || telephone.isBlank()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new Response<>(false, "Le numéro de téléphone est obligatoire."));
        }
        String tel = telephone.trim();

        // Application réservée au personnel déclarant pré-enregistré : on n'envoie
        // pas de SMS à un numéro inconnu (sécurité + coût SMS). La recherche ignore
        // le formatage (« +224 628228638 » vs « +224628228638 »).
        boolean compteExiste = userRepository.findByTelephoneNormalise(normaliserTelephone(tel))
                .filter(u -> u.getIsDelete() != Delete.Yes)
                .isPresent();
        if (!compteExiste) {
            logger.warn("Demande OTP refusée : aucun compte actif pour le numéro {}", tel);
            return ResponseEntity.status(HttpStatus.FORBIDDEN)
                    .body(new Response<>(false,
                            "Ce numéro n'est pas enregistré. Contactez l'administrateur pour activer votre compte."));
        }

        boolean envoye = otpService.requestCode(tel);
        if (envoye) {
            return ResponseEntity.ok(new Response<>(true, "Un code de connexion a été envoyé par SMS."));
        }
        return ResponseEntity.status(HttpStatus.BAD_GATEWAY)
                .body(new Response<>(false, "Échec de l'envoi du SMS. Réessayez plus tard."));
    }

    @PostMapping("/otp/verify")
    @Operation(summary = "Vérifier le code OTP",
            description = "Vérifie le code reçu par SMS et retourne un token JWT si le compte existe.")
    public ResponseEntity<Object> otpVerify(@RequestBody Map<String, String> body) {
        String telephone = body.get("telephone");
        String code = body.get("code");

        if (telephone == null || telephone.isBlank() || code == null || code.isBlank()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new Response<>(false, "Téléphone et code sont obligatoires."));
        }

        if (!otpService.verifyCode(telephone.trim(), code.trim())) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(new Response<>(false, "Code incorrect ou expiré."));
        }

        String tel = telephone.trim();
        // L'application mobile est réservée au personnel déclarant pré-enregistré
        // dans le système (formations sanitaires : sage-femme, infirmier, médecin ;
        // lieux de culte : imam, prêtre). Aucun auto-provisionnement : si le numéro
        // n'est pas déjà rattaché à un compte actif, l'accès est refusé. La recherche
        // ignore le formatage (espaces, tirets…).
        User user = userRepository.findByTelephoneNormalise(normaliserTelephone(tel))
                .filter(u -> u.getIsDelete() != Delete.Yes)
                .orElse(null);

        if (user == null) {
            logger.warn("Connexion OTP refusée : aucun compte actif pour le numéro {}", tel);
            return ResponseEntity.status(HttpStatus.FORBIDDEN)
                    .body(new Response<>(false,
                            "Ce numéro n'est pas enregistré. Contactez l'administrateur pour activer votre compte."));
        }

        gov.ravec.backend.utils.UserPrinciple principal =
                gov.ravec.backend.utils.UserPrinciple.build(user);
        Authentication authentication =
                new UsernamePasswordAuthenticationToken(principal, null, principal.getAuthorities());

        String jwt = jwtProvider.generateJwtToken(authentication);

        JwtResponse response = JwtResponse.builder()
                .accessToken(jwt)
                .name(user.getPrenom() + "  " + user.getNom())
                .username(user.getUsername())
                .tokenType("Bearer")
                .authorities(principal.getAuthorities())
                .profil(principal.getProfil())
                .profilLibelle(principal.getProfilLibelle())
                .niveauAdministratif(principal.getNiveauAdministratif())
                .regionId(principal.getRegionId())
                .regionNom(principal.getRegionNom())
                .prefectureId(principal.getPrefectureId())
                .prefectureNom(principal.getPrefectureNom())
                .communeId(principal.getCommuneId())
                .communeNom(principal.getCommuneNom())
                .mustChangePassword(user.isMustChangePassword())
                .build();

        return ResponseEntity.ok(response);
    }

    /**
     * Normalise un numéro de téléphone pour la comparaison : supprime espaces,
     * tirets, parenthèses et points, en conservant le « + » et les chiffres.
     * Doit produire le même format que la fonction SQL de
     * {@code findByTelephoneNormalise}.
     */
    private static String normaliserTelephone(String telephone) {
        if (telephone == null) return "";
        return telephone.replaceAll("[\\s\\-().]", "");
    }

    @PostMapping("/change-first-password")
    @Operation(
        summary = "Changement de mot de passe obligatoire",
        description = "Permet à un utilisateur authentifié de changer son mot de passe " +
                      "lorsque le système l'y oblige (première connexion / réinitialisation admin).")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Mot de passe changé avec succès"),
            @ApiResponse(responseCode = "400", description = "Mot de passe actuel incorrect"),
            @ApiResponse(responseCode = "401", description = "Utilisateur non authentifié")
    })
    public ResponseEntity<Object> changeFirstPassword(@RequestBody ChangePasswordRequest req) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || !authentication.isAuthenticated()) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(new Response<>(false, "Utilisateur non authentifié."));
        }

        String username = authentication.getName();
        boolean success = userService.changeFirstPassword(username, req);

        if (success) {
            logger.info("Mot de passe changé avec succès pour l'utilisateur : {}", username);
            return ResponseEntity.ok(new Response<>(true, "Mot de passe changé avec succès."));
        } else {
            logger.warn("Échec du changement de mot de passe pour : {} (mot de passe actuel incorrect)", username);
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new Response<>(false, "Le mot de passe actuel est incorrect."));
        }
    }
}

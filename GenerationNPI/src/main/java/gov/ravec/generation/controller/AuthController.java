package gov.ravec.generation.controller;

import gov.ravec.generation.dto.JwtResponse;
import gov.ravec.generation.dto.LoginRequest;
import gov.ravec.generation.security.JwtProvider;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
@Tag(name = "Authentification", description = "Obtenir un JWT pour accéder à l'API NPI")
public class AuthController {

    private final AuthenticationManager authManager;
    private final JwtProvider jwtProvider;

    public AuthController(AuthenticationManager authManager, JwtProvider jwtProvider) {
        this.authManager = authManager;
        this.jwtProvider = jwtProvider;
    }

    @PostMapping("/login")
    @Operation(summary = "Authentification", description = "Retourne un token JWT valide 24h")
    public ResponseEntity<JwtResponse> login(@Valid @RequestBody LoginRequest request) {
        Authentication authentication = authManager.authenticate(
                new UsernamePasswordAuthenticationToken(request.getUsername(), request.getPassword())
        );
        SecurityContextHolder.getContext().setAuthentication(authentication);
        String token = jwtProvider.generateToken(authentication);
        String username = ((UserDetails) authentication.getPrincipal()).getUsername();
        return ResponseEntity.ok(new JwtResponse(token, username));
    }
}

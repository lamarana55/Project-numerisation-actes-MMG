package gov.ravec.generation.npi.formula;

import org.springframework.stereotype.Component;

/**
 * Calcule la clé de contrôle NPI via l'algorithme modulo 97,
 * identique à celui implémenté dans le simulateur Angular.
 * <p>
 * Algorithme : somme pondérée (poids alternés 2/1) sur les chiffres,
 * les caractères non numériques contribuent 0 (cohérent avec le
 * comportement de parseInt() en JavaScript sur les lettres).
 * Clé = 97 − (somme mod 97), formatée sur 2 chiffres.
 */
@Component
public class ControlKeyCalculator {

    public String calculate(String npiWithoutKey) {
        int sum = 0;
        for (int i = 0; i < npiWithoutKey.length(); i++) {
            char c = npiWithoutKey.charAt(i);
            int digit = Character.isDigit(c) ? (c - '0') : 0;
            sum += digit * (i % 2 == 0 ? 2 : 1);
        }
        int key = 97 - (sum % 97);
        return String.format("%02d", key);
    }
}

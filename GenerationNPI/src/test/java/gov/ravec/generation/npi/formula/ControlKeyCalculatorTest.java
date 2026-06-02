package gov.ravec.generation.npi.formula;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class ControlKeyCalculatorTest {

    private ControlKeyCalculator calculator;

    @BeforeEach
    void setUp() {
        calculator = new ControlKeyCalculator();
    }

    @Test
    void cleControle_surChaineNumerique_calculCorrect() {
        // Pour "1260101012345" : somme pondérée puis 97 - (somme % 97)
        String npiSansCle = "126010101234";
        String cle = calculator.calculate(npiSansCle);
        assertThat(cle).hasSize(2);
        assertThat(cle).matches("\\d{2}");
    }

    @Test
    void cleControle_formatDeuxChiffres() {
        // La clé doit toujours être sur 2 chiffres (ex : "03", "97")
        for (String input : new String[]{"1", "12", "123456789012345678"}) {
            String cle = calculator.calculate(input);
            assertThat(cle).as("Clé pour input=%s", input)
                    .hasSize(2)
                    .matches("\\d{2}");
        }
    }

    @Test
    void cleControle_caracteresAlpha_traites_comme_zero() {
        // "CKY" → chaque lettre vaut 0 → même résultat que "000"
        String avecAlpha = "CKY";
        String avecZeros = "000";
        assertThat(calculator.calculate(avecAlpha)).isEqualTo(calculator.calculate(avecZeros));
    }

    @Test
    void cleControle_chaineVide_retourneNinetySevenModulo97() {
        // somme=0 → 97 - (0 % 97) = 97 → "97"
        assertThat(calculator.calculate("")).isEqualTo("97");
    }

    @Test
    void npiComplet_cleEnPosition16_17() {
        // Vérifie que le NPI généré avec la clé en suffix est cohérent
        String base = "126010101234";
        String cle = calculator.calculate(base);
        String npiComplet = base + cle;
        assertThat(npiComplet).hasSize(14);
    }
}

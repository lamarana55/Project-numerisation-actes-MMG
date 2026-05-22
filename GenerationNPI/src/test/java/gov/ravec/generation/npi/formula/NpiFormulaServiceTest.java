package gov.ravec.generation.npi.formula;

import gov.ravec.generation.entity.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;

class NpiFormulaServiceTest {

    private NpiFormulaService formulaService;
    private ControlKeyCalculator calculator;

    @BeforeEach
    void setUp() {
        calculator = new ControlKeyCalculator();
        formulaService = new NpiFormulaService(calculator);
    }

    private Quartier buildQuartier(String prefCode, String communeCode, String quartierCode) {
        Region region = Region.builder().id(UUID.randomUUID()).code("01").nom("Conakry").build();
        Prefecture pref = Prefecture.builder().id(UUID.randomUUID()).code(prefCode).nom("Test Pref").region(region).build();
        Commune commune = Commune.builder().id(UUID.randomUUID()).code(communeCode).nom("Test Commune").prefecture(pref).build();
        return Quartier.builder().id(UUID.randomUUID()).code(quartierCode).nom("Test Quartier").commune(commune).build();
    }

    private Pays buildPays(String code, String codeNumerique, String codeRegion) {
        return Pays.builder().id(UUID.randomUUID()).code(code).nom("Test Pays")
                .codeNumerique(codeNumerique).codeRegion(codeRegion).build();
    }

    @Test
    void type1_npi_a_18_caracteres() {
        Quartier q = buildQuartier("CKY", "CKY01", "0101");
        String npi = formulaService.generateType1("M", LocalDate.of(2026, 5, 18), q);
        assertThat(npi).hasSize(18);
    }

    @Test
    void type1_sexeMasculin_commenceParUn() {
        Quartier q = buildQuartier("CKY", "CKY01", "0101");
        String npi = formulaService.generateType1("M", LocalDate.of(2026, 5, 18), q);
        assertThat(npi).startsWith("1");
    }

    @Test
    void type1_sexeFeminin_commenceParDeux() {
        Quartier q = buildQuartier("CKY", "CKY01", "0101");
        String npi = formulaService.generateType1("F", LocalDate.of(2026, 5, 18), q);
        assertThat(npi).startsWith("2");
    }

    @Test
    void type1_anneeEtMoisCorrects() {
        Quartier q = buildQuartier("CKY", "CKY01", "0101");
        // Date : 18 mai 2026 → annee="26", mois="05"
        String npi = formulaService.generateType1("M", LocalDate.of(2026, 5, 18), q);
        assertThat(npi.substring(1, 3)).isEqualTo("26");
        assertThat(npi.substring(3, 5)).isEqualTo("05");
    }

    @Test
    void type1_prefixePrefectureCorrect() {
        Quartier q = buildQuartier("CKY", "CKY01", "0101");
        String npi = formulaService.generateType1("M", LocalDate.of(2026, 5, 18), q);
        assertThat(npi.substring(5, 8)).isEqualTo("CKY");
    }

    @Test
    void type1_newCodeQuartierCorrect() {
        // commune "CKY01" → "01", quartier "0101" → "01" → new_code = "0101"
        Quartier q = buildQuartier("CKY", "CKY01", "0101");
        String npi = formulaService.generateType1("M", LocalDate.of(2026, 5, 18), q);
        assertThat(npi.substring(8, 12)).isEqualTo("0101");
    }

    @Test
    void type1_cleControle_valide() {
        Quartier q = buildQuartier("CKY", "CKY01", "0101");
        String npi = formulaService.generateType1("M", LocalDate.of(2026, 5, 18), q);
        String base = npi.substring(0, 16);
        String cle = npi.substring(16);
        assertThat(cle).isEqualTo(calculator.calculate(base));
    }

    @Test
    void type2_npi_a_18_caracteres() {
        Pays pays = buildPays("FRA", "250", "150");
        String npi = formulaService.generateType2("M", LocalDate.of(2000, 1, 15), pays);
        assertThat(npi).hasSize(18);
    }

    @Test
    void type2_codeRegionEnPosition5_8() {
        Pays pays = buildPays("FRA", "250", "150");
        String npi = formulaService.generateType2("M", LocalDate.of(2000, 1, 15), pays);
        assertThat(npi.substring(5, 8)).isEqualTo("150");
    }

    @Test
    void type3_codePaysEnPosition5_8() {
        Pays pays = buildPays("FRA", "250", "150");
        String npi = formulaService.generateType3("F", LocalDate.of(1995, 7, 20), pays);
        assertThat(npi.substring(5, 8)).isEqualTo("FRA");
    }

    @Test
    void type4_codeNumeriqueEnPosition5_8() {
        Pays pays = buildPays("FRA", "250", "150");
        String npi = formulaService.generateType4("M", LocalDate.of(1990, 12, 3), pays);
        assertThat(npi.substring(5, 8)).isEqualTo("250");
    }

    @Test
    void type4_entierementNumerique_saufPositions5a8() {
        // Type 4 : codeNumerique(3 digits) + codeRegion(3 digits) → toutes les parties sont numériques
        Pays pays = buildPays("GIN", "324", "002");
        String npi = formulaService.generateType4("M", LocalDate.of(2000, 6, 1), pays);
        // Vérifier que le NPI sans clé (hors positions 5-8 réservé aux codes) est numérique
        String partieLocale = npi.substring(0, 5) + npi.substring(8);
        assertThat(partieLocale).matches("\\d+");
    }
}

package gov.ravec.generation.npi.formula;

import gov.ravec.generation.dto.TypeNpi;
import gov.ravec.generation.entity.Pays;
import gov.ravec.generation.entity.Quartier;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Random;

/**
 * Compose le NPI selon le type demandé et calcule la clé de contrôle.
 * <p>
 * Structure par type (18 caractères) :
 * <pre>
 * TYPE 1 : sexe(1) + annee(2) + mois(2) + prefCode(3) + commNum(2) + quartNum(2) + rand(4) + cle(2)
 * TYPE 2 : sexe(1) + annee(2) + mois(2) + codeRegion(3) + codePays(3) + rand(5) + cle(2)
 * TYPE 3 : sexe(1) + annee(2) + mois(2) + codePays(3)   + codeRegion(3) + rand(5) + cle(2)
 * TYPE 4 : sexe(1) + annee(2) + mois(2) + codeNum(3)    + codeRegion(3) + rand(5) + cle(2)
 * </pre>
 */
@Service
public class NpiFormulaService {

    private final ControlKeyCalculator keyCalculator;
    private final Random random = new Random();

    public NpiFormulaService(ControlKeyCalculator keyCalculator) {
        this.keyCalculator = keyCalculator;
    }

    public String generateType1(String sexe, LocalDate dateNaissance, Quartier quartier) {
        String base = buildBaseType1(sexe, dateNaissance, quartier);
        return base + keyCalculator.calculate(base);
    }

    public String generateType2(String sexe, LocalDate dateNaissance, Pays paysNaissance) {
        String base = buildBaseType2(sexe, dateNaissance, paysNaissance);
        return base + keyCalculator.calculate(base);
    }

    public String generateType3(String sexe, LocalDate dateNaissance, Pays paysNaissance) {
        String base = buildBaseType3(sexe, dateNaissance, paysNaissance);
        return base + keyCalculator.calculate(base);
    }

    public String generateType4(String sexe, LocalDate dateNaissance, Pays paysNaissance) {
        String base = buildBaseType4(sexe, dateNaissance, paysNaissance);
        return base + keyCalculator.calculate(base);
    }

    // ── TYPE 1 ──────────────────────────────────────────────────────────────

    private String buildBaseType1(String sexe, LocalDate date, Quartier quartier) {
        String sexeCode = "M".equalsIgnoreCase(sexe) ? "1" : "2";
        String annee = String.valueOf(date.getYear()).substring(2);
        String mois = String.format("%02d", date.getMonthValue());
        String prefCode = quartier.getCommune().getPrefecture().getCode();
        String newCode = quartier.getNewCode();          // 4 chars numériques
        String rand = String.format("%04d", 1000 + random.nextInt(9000));
        return sexeCode + annee + mois + prefCode + newCode + rand;
    }

    // ── TYPE 2 ──────────────────────────────────────────────────────────────

    private String buildBaseType2(String sexe, LocalDate date, Pays pays) {
        String sexeCode = "M".equalsIgnoreCase(sexe) ? "1" : "2";
        String annee = String.valueOf(date.getYear()).substring(2);
        String mois = String.format("%02d", date.getMonthValue());
        String codeRegion = padLeft(pays.getCodeRegion(), 3, '0');
        String codePays = pays.getCode();
        String rand = String.format("%05d", 10000 + random.nextInt(90000));
        return sexeCode + annee + mois + codeRegion + codePays + rand;
    }

    // ── TYPE 3 ──────────────────────────────────────────────────────────────

    private String buildBaseType3(String sexe, LocalDate date, Pays pays) {
        String sexeCode = "M".equalsIgnoreCase(sexe) ? "1" : "2";
        String annee = String.valueOf(date.getYear()).substring(2);
        String mois = String.format("%02d", date.getMonthValue());
        String codePays = pays.getCode();
        String codeRegion = padLeft(pays.getCodeRegion(), 3, '0');
        String rand = String.format("%05d", 10000 + random.nextInt(90000));
        return sexeCode + annee + mois + codePays + codeRegion + rand;
    }

    // ── TYPE 4 ──────────────────────────────────────────────────────────────

    private String buildBaseType4(String sexe, LocalDate date, Pays pays) {
        String sexeCode = "M".equalsIgnoreCase(sexe) ? "1" : "2";
        String annee = String.valueOf(date.getYear()).substring(2);
        String mois = String.format("%02d", date.getMonthValue());
        String codeNumerique = padLeft(pays.getCodeNumerique(), 3, '0');
        String codeRegion = padLeft(pays.getCodeRegion(), 3, '0');
        String rand = String.format("%05d", 10000 + random.nextInt(90000));
        return sexeCode + annee + mois + codeNumerique + codeRegion + rand;
    }

    // ── Utilitaire ──────────────────────────────────────────────────────────

    private String padLeft(String value, int length, char pad) {
        if (value == null) return String.valueOf(pad).repeat(length);
        if (value.length() >= length) return value.substring(value.length() - length);
        return String.valueOf(pad).repeat(length - value.length()) + value;
    }

    public TypeNpi detectType(String npi, TypeNpi requestedType) {
        return requestedType;
    }
}

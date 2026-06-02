package gov.ravec.generation.exception;

import lombok.Getter;

@Getter
public class QuotaDepasseException extends RuntimeException {

    private final String quartierNom;
    private final String reinitialisation;

    public QuotaDepasseException(String quartierNom, String reinitialisation) {
        super("Quota mensuel dépassé pour le quartier : " + quartierNom);
        this.quartierNom = quartierNom;
        this.reinitialisation = reinitialisation;
    }
}

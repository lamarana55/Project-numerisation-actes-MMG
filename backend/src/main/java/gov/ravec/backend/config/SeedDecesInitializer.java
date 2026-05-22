package gov.ravec.backend.config;

import gov.ravec.backend.entities.*;
import gov.ravec.backend.repositories.*;
import gov.ravec.backend.utils.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;

@Component
@Order(4)
public class SeedDecesInitializer implements CommandLineRunner {

    private static final Logger log = LoggerFactory.getLogger(SeedDecesInitializer.class);

    private final ActeDecesRepository acteDecesRepo;
    private final PersonneRepository  personneRepo;
    private final CommuneRepository   communeRepo;
    private final UserRepository      userRepo;
    private final TypeActeRepository  typeActeRepo;

    public SeedDecesInitializer(ActeDecesRepository acteDecesRepo,
                                PersonneRepository personneRepo,
                                CommuneRepository communeRepo,
                                UserRepository userRepo,
                                TypeActeRepository typeActeRepo) {
        this.acteDecesRepo = acteDecesRepo;
        this.personneRepo  = personneRepo;
        this.communeRepo   = communeRepo;
        this.userRepo      = userRepo;
        this.typeActeRepo  = typeActeRepo;
    }

    @Override
    @Transactional
    public void run(String... args) {
        log.info("=== SeedDecesInitializer : pré-chargement des actes de décès ===");

        TypeActe typeDeces = typeActeRepo.findByCode("DECES").orElse(null);
        Commune  kaloum = communeRepo.findByCode("CKY04").orElse(null);
        Commune  matam  = communeRepo.findByCode("CKY08").orElse(null);
        Commune  ratoma = communeRepo.findByCode("CKY10").orElse(null);
        Commune  matoto = communeRepo.findByCode("CKY09").orElse(null);
        Commune  dixinn = communeRepo.findByCode("CKY01").orElse(null);

        User agent = userRepo.findByEmail("odec_kaloum@ravec.gov.gn")
                .or(() -> userRepo.findAll().stream()
                        .filter(u -> u.getEmail().startsWith("odec_"))
                        .findFirst())
                .orElse(null);

        int created = 0;

        // ══ 1 — Elhadj Mamadou BALDE — Kaloum — Marié — VALIDE ═══════
        created += seed(ActeDeces.builder()
            .id("SEED-DEC-001")
            .source(SourceActe.DECLARATION)
            .typeActe(typeDeces)
            .numeroActe("2024-D001")
            .anneeRegistre("2024")
            .feuillet("F-001")
            .commune(kaloum)
            .defunt(defunt("PER-DEC-001", "Elhadj Mamadou", "BALDE", "M",
                    LocalDate.of(1945, 4, 10), null, "GIN",
                    "CKY", "CKY04", "Almamya",
                    "111", "CKY04", "Almamya", "Almamya, Kaloum"))
            .pere(parentDeces("PER-DEC-002", "Boubacar", "BALDE", "M",
                    LocalDate.of(1910, 1, 1), null, "GIN",
                    "CKY", "CKY04", null,
                    "111", null, null, null))
            .mere(parentDeces("PER-DEC-003", "Hadja Safiatou", "DIALLO", "F",
                    LocalDate.of(1915, 6, 15), null, "GIN",
                    "CKY", "CKY04", null,
                    "111", null, null, null))
            .conjoint(personne("PER-DEC-004C", "Mariama", "SOW", "F",
                    LocalDate.of(1950, 3, 12), null, "GIN",
                    "CKY", "CKY04", "Almamya",
                    "29", "CKY04", "Almamya", "Almamya, Kaloum"))
            .declarant(declarantDeces("PER-DEC-004", "Ibrahima Sory", "BALDE", "M",
                    LocalDate.of(1970, 8, 22), null, "GIN",
                    "53", "628 11 22 33", "CKY04", "CKY04", "Almamya, Kaloum"))
            .dateDeces(LocalDate.of(2024, 2, 8))
            .heureDeces("03:15")
            .lieuDeces("Domicile familial, Almamya, Kaloum")
            .causeDeces("Insuffisance cardiaque")
            .typeDeces("NATUREL")
            .situationMatrimoniale("Marié")
            .qualiteDeclarant("Fils")
            .lienDeclarantDefunt("Fils")
            .signatureDeclarant("OUI")
            .dateDeclaration(LocalDate.of(2024, 2, 9))
            .dateDressage(LocalDate.of(2024, 2, 9))
            .heureDressage("10:30")
            .dateInscription(LocalDate.of(2024, 2, 9))
            .actionsFaire(ActionsFaire.A_VALIDER)
            .statut(ValidationStatut.VALIDE)
            .agent(agent)
            .isDeleted(Delete.No)
            .build());

        // ══ 2 — Mariama CAMARA — Matam — Veuve — EN_ATTENTE ══════════
        created += seed(ActeDeces.builder()
            .id("SEED-DEC-002")
            .source(SourceActe.DECLARATION)
            .typeActe(typeDeces)
            .numeroActe("2024-D002")
            .anneeRegistre("2024")
            .feuillet("F-002")
            .commune(matam)
            .defunt(defunt("PER-DEC-005", "Mariama", "CAMARA", "F",
                    LocalDate.of(1958, 9, 3), null, "GIN",
                    "LAB", "LAB01", "Labola",
                    "68", "CKY08", "Taouyah", "Taouyah, Matam"))
            .pere(parentDeces("PER-DEC-006", "Soumah", "CAMARA", "M",
                    LocalDate.of(1920, 3, 5), null, "GIN",
                    "LAB", "LAB01", null,
                    "111", null, null, null))
            .mere(parentDeces("PER-DEC-007", "Fatoumata", "SYLLA", "F",
                    LocalDate.of(1925, 11, 20), null, "GIN",
                    "LAB", "LAB01", null,
                    "111", null, null, null))
            .declarant(declarantDeces("PER-DEC-008", "Oumar", "DIALLO", "M",
                    LocalDate.of(1955, 4, 12), null, "GIN",
                    "29", "622 22 33 44", "CKY08", "CKY08", "Taouyah, Matam"))
            .dateDeces(LocalDate.of(2024, 5, 14))
            .heureDeces("19:00")
            .lieuDeces("Hôpital Donka, Matam")
            .causeDeces("Diabète compliqué")
            .typeDeces("NATUREL")
            .situationMatrimoniale("Veuve")
            .qualiteDeclarant("Époux")
            .lienDeclarantDefunt("Époux")
            .signatureDeclarant("OUI")
            .dateDeclaration(LocalDate.of(2024, 5, 15))
            .dateDressage(LocalDate.of(2024, 5, 15))
            .heureDressage("09:00")
            .dateInscription(LocalDate.of(2024, 5, 15))
            .actionsFaire(ActionsFaire.A_VALIDER)
            .statut(ValidationStatut.EN_ATTENTE)
            .agent(agent)
            .isDeleted(Delete.No)
            .build());

        // ══ 3 — Ousmane TOURE — Ratoma — Marié — EN_ATTENTE ══════════
        created += seed(ActeDeces.builder()
            .id("SEED-DEC-003")
            .source(SourceActe.DECLARATION)
            .typeActe(typeDeces)
            .numeroActe("2025-D001")
            .anneeRegistre("2025")
            .feuillet("F-001")
            .commune(ratoma)
            .defunt(defunt("PER-DEC-009", "Ousmane", "TOURE", "M",
                    LocalDate.of(1972, 12, 28), null, "GIN",
                    "CKY", "CKY10", "Sonfonia",
                    "25", "CKY10", "Sonfonia", "Sonfonia, Ratoma"))
            .pere(parentDeces("PER-DEC-010", "Amadou", "TOURE", "M",
                    LocalDate.of(1940, 7, 7), null, "GIN",
                    "CKY", "CKY10", null,
                    "111", null, null, null))
            .mere(parentDeces("PER-DEC-011", "Kadiatou", "KEITA", "F",
                    LocalDate.of(1945, 2, 14), null, "GIN",
                    "CKY", "CKY10", null,
                    "111", null, null, null))
            .conjoint(personne("PER-DEC-012C", "Fatoumata Binta", "SOW", "F",
                    LocalDate.of(1975, 6, 18), null, "GIN",
                    "CKY", "CKY10", "Sonfonia",
                    "29", "CKY10", "Sonfonia", "Sonfonia, Ratoma"))
            .declarant(declarantDeces("PER-DEC-012", "Fatoumata", "TOURE", "F",
                    LocalDate.of(1975, 6, 3), null, "GIN",
                    "29", "621 33 44 55", "CKY10", "CKY10", "Sonfonia, Ratoma"))
            .dateDeces(LocalDate.of(2025, 1, 10))
            .heureDeces("11:45")
            .lieuDeces("Clinique Pasteur, Ratoma")
            .causeDeces("Accident vasculaire cérébral")
            .typeDeces("NATUREL")
            .situationMatrimoniale("Marié")
            .qualiteDeclarant("Épouse")
            .lienDeclarantDefunt("Épouse")
            .signatureDeclarant("OUI")
            .dateDeclaration(LocalDate.of(2025, 1, 11))
            .dateDressage(LocalDate.of(2025, 1, 11))
            .heureDressage("14:00")
            .dateInscription(LocalDate.of(2025, 1, 11))
            .actionsFaire(ActionsFaire.A_VALIDER)
            .statut(ValidationStatut.EN_ATTENTE)
            .agent(agent)
            .isDeleted(Delete.No)
            .build());

        // ══ 4 — Hadja Aïssatou BARRY — Matoto — TRANSCRIPTION — VALIDE
        created += seed(ActeDeces.builder()
            .id("SEED-DEC-004")
            .source(SourceActe.TRANSCRIPTION)
            .typeActe(typeDeces)
            .numeroActe("2024-D003")
            .anneeRegistre("2024")
            .feuillet("F-003")
            .commune(matoto)
            .defunt(defunt("PER-DEC-013", "Hadja Aïssatou", "BARRY", "F",
                    LocalDate.of(1940, 3, 15), null, "GIN",
                    "LAB", "LAB01", "Labola",
                    "111", "CKY09", "Dar-Es-Salam", "Dar-Es-Salam, Matoto"))
            .pere(parentDeces("PER-DEC-014", "Thierno", "BARRY", "M",
                    LocalDate.of(1905, 1, 1), null, "GIN",
                    "LAB", "LAB01", null,
                    "111", null, null, null))
            .mere(parentDeces("PER-DEC-015", "Mamadou Binta", "SOW", "F",
                    LocalDate.of(1910, 5, 10), null, "GIN",
                    "LAB", "LAB01", null,
                    "111", null, null, null))
            .declarant(declarantDeces("PER-DEC-016", "Saliou", "BARRY", "M",
                    LocalDate.of(1965, 9, 2), null, "GIN",
                    "53", "628 44 55 66", "CKY09", "CKY09", "Dar-Es-Salam, Matoto"))
            .dateDeces(LocalDate.of(2015, 8, 22))
            .heureDeces("22:00")
            .lieuDeces("Domicile familial, Dar-Es-Salam, Matoto")
            .causeDeces("Vieillesse")
            .typeDeces("NATUREL")
            .situationMatrimoniale("Veuve")
            .qualiteDeclarant("Fils")
            .lienDeclarantDefunt("Fils")
            .signatureDeclarant("OUI")
            .dateDeclaration(LocalDate.of(2024, 4, 3))
            .tribunal("Tribunal de Première Instance de Matoto")
            .numeroJugement("2024/JUG/D0028")
            .dateJugement(LocalDate.of(2024, 3, 20))
            .dateDressage(LocalDate.of(2024, 4, 3))
            .heureDressage("10:00")
            .dateInscription(LocalDate.of(2024, 4, 3))
            .actionsFaire(ActionsFaire.A_VALIDER)
            .statut(ValidationStatut.VALIDE)
            .agent(agent)
            .isDeleted(Delete.No)
            .build());

        // ══ 5 — Lansana CONDE — Dixinn — TRANSCRIPTION — EN_ATTENTE ══
        created += seed(ActeDeces.builder()
            .id("SEED-DEC-005")
            .source(SourceActe.TRANSCRIPTION)
            .typeActe(typeDeces)
            .numeroActe("2025-D002")
            .anneeRegistre("2025")
            .feuillet("F-002")
            .commune(dixinn)
            .defunt(defunt("PER-DEC-017", "Lansana", "CONDE", "M",
                    LocalDate.of(1955, 6, 18), null, "GIN",
                    "CKY", "CKY01", "Dixinn Centre",
                    "98", "CKY01", "Dixinn Centre", "Dixinn Centre, Dixinn"))
            .pere(parentDeces("PER-DEC-018", "Bangaly", "CONDE", "M",
                    LocalDate.of(1920, 4, 30), null, "GIN",
                    "NZE", "NZE01", null,
                    "111", null, null, null))
            .mere(parentDeces("PER-DEC-019", "Gbê Mah", "GUILAVOGUI", "F",
                    LocalDate.of(1928, 8, 5), null, "GIN",
                    "NZE", "NZE01", null,
                    "111", null, null, null))
            .conjoint(personne("PER-DEC-020C", "Fanta", "SOUMAH", "F",
                    LocalDate.of(1960, 4, 20), null, "GIN",
                    "CKY", "CKY01", "Dixinn Centre",
                    "29", "CKY01", "Dixinn Centre", "Dixinn Centre, Dixinn"))
            .declarant(declarantDeces("PER-DEC-020", "Ibrahima", "CONDE", "M",
                    LocalDate.of(1980, 11, 14), null, "GIN",
                    "46", "628 55 66 77", "CKY01", "CKY01", "Dixinn Centre, Dixinn"))
            .dateDeces(LocalDate.of(2009, 3, 4))
            .heureDeces("16:30")
            .lieuDeces("Hôpital Ignace Deen, Kaloum")
            .causeDeces("Paludisme grave")
            .typeDeces("NATUREL")
            .situationMatrimoniale("Marié")
            .qualiteDeclarant("Fils")
            .lienDeclarantDefunt("Fils")
            .signatureDeclarant("OUI")
            .dateDeclaration(LocalDate.of(2025, 2, 20))
            .tribunal("Tribunal de Première Instance de Dixinn")
            .numeroJugement("2025/JUG/D0007")
            .dateJugement(LocalDate.of(2025, 2, 5))
            .dateDressage(LocalDate.of(2025, 2, 20))
            .heureDressage("11:00")
            .dateInscription(LocalDate.of(2025, 2, 20))
            .actionsFaire(ActionsFaire.A_VALIDER)
            .statut(ValidationStatut.EN_ATTENTE)
            .agent(agent)
            .isDeleted(Delete.No)
            .build());

        log.info("=== SeedDecesInitializer : {} acte(s) de décès créé(s) ===", created);
    }

    // ─── helpers ──────────────────────────────────────────────────────────────

    private int seed(ActeDeces acte) {
        boolean isNew = !acteDecesRepo.existsById(acte.getId());
        savePersonne(acte.getDefunt());
        savePersonne(acte.getPere());
        savePersonne(acte.getMere());
        savePersonne(acte.getDeclarant());
        savePersonne(acte.getConjoint());
        acteDecesRepo.save(acte);
        log.info("  [{}] acte décès {} — {} {} ({})",
                isNew ? "+" : "~",
                acte.getId(),
                acte.getDefunt() != null ? acte.getDefunt().getPrenom() : "?",
                acte.getDefunt() != null ? acte.getDefunt().getNom()    : "?",
                acte.getSource());
        return isNew ? 1 : 0;
    }

    private void savePersonne(Personne p) {
        if (p != null) personneRepo.save(p);
    }

    /** Défunt : identité + lieu naissance + domicile + profession. */
    private Personne defunt(String id, String prenom, String nom, String sexe,
                             LocalDate dob, String npi, String nat,
                             String prefN, String comN, String quartierN,
                             String profCode, String comD, String quartierD, String adresse) {
        return Personne.builder()
                .id(id).prenom(prenom).nom(nom).sexe(sexe)
                .dateNaissance(dob).npi(npi)
                .nationalite(nat)
                .paysNaissance("GIN")
                .prefectureNaissance(prefN)
                .communeNaissance(comN)
                .quartierNaissance(quartierN)
                .profession(profCode)
                .paysResidence("GIN")
                .communeDomicile(comD)
                .quartierDomicile(quartierD)
                .adresse(adresse)
                .build();
    }

    /** Père/mère du défunt. */
    private Personne parentDeces(String id, String prenom, String nom, String sexe,
                                  LocalDate dob, String npi, String nat,
                                  String prefN, String comN, String quartierN,
                                  String profCode, String comD, String quartierD, String adresse) {
        return Personne.builder()
                .id(id).prenom(prenom).nom(nom).sexe(sexe)
                .dateNaissance(dob).npi(npi)
                .nationalite(nat)
                .paysNaissance("GIN")
                .prefectureNaissance(prefN)
                .communeNaissance(comN)
                .quartierNaissance(quartierN)
                .profession(profCode)
                .paysResidence("GIN")
                .communeDomicile(comD)
                .quartierDomicile(quartierD)
                .adresse(adresse)
                .build();
    }

    /** Conjoint(e) survivant(e). */
    private Personne personne(String id, String prenom, String nom, String sexe,
                               LocalDate dob, String npi, String nat,
                               String prefN, String comN, String quartierN,
                               String profCode, String comD, String quartierD, String adresse) {
        return Personne.builder()
                .id(id).prenom(prenom).nom(nom).sexe(sexe)
                .dateNaissance(dob).npi(npi)
                .nationalite(nat)
                .paysNaissance("GIN")
                .prefectureNaissance(prefN)
                .communeNaissance(comN)
                .quartierNaissance(quartierN)
                .profession(profCode)
                .paysResidence("GIN")
                .communeDomicile(comD)
                .quartierDomicile(quartierD)
                .adresse(adresse)
                .build();
    }

    /** Déclarant : identité + domicile + contact. */
    private Personne declarantDeces(String id, String prenom, String nom, String sexe,
                                     LocalDate dob, String npi, String nat,
                                     String profCode, String tel,
                                     String comN, String comD, String adresse) {
        return Personne.builder()
                .id(id).prenom(prenom).nom(nom).sexe(sexe)
                .dateNaissance(dob).npi(npi)
                .nationalite(nat)
                .paysNaissance("GIN")
                .communeNaissance(comN)
                .profession(profCode)
                .telephone(tel)
                .paysResidence("GIN")
                .communeDomicile(comD)
                .adresse(adresse)
                .build();
    }
}

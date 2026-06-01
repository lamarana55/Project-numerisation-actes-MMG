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
@Order(3)
public class SeedActesInitializer implements CommandLineRunner {

    private static final Logger log = LoggerFactory.getLogger(SeedActesInitializer.class);

    private final ActeNaissanceRepository acteRepo;
    private final PersonneRepository      personneRepo;
    private final CommuneRepository       communeRepo;
    private final UserRepository          userRepo;
    private final TypeActeRepository      typeActeRepo;

    public SeedActesInitializer(ActeNaissanceRepository acteRepo,
                                PersonneRepository personneRepo,
                                CommuneRepository communeRepo,
                                UserRepository userRepo,
                                TypeActeRepository typeActeRepo) {
        this.acteRepo     = acteRepo;
        this.personneRepo = personneRepo;
        this.communeRepo  = communeRepo;
        this.userRepo     = userRepo;
        this.typeActeRepo = typeActeRepo;
    }

    @Override
    @Transactional
    public void run(String... args) {
        log.info("=== SeedActesInitializer : pré-chargement des actes de naissance ===");

        TypeActe typeNaissance = typeActeRepo.findByCode("NAISSANCE").orElse(null);
        Commune  kaloum  = communeRepo.findByCode("CKY04").orElse(null);
        Commune  matam   = communeRepo.findByCode("CKY08").orElse(null);
        Commune  ratoma  = communeRepo.findByCode("CKY10").orElse(null);
        Commune  matoto  = communeRepo.findByCode("CKY09").orElse(null);
        Commune  dixinn  = communeRepo.findByCode("CKY01").orElse(null);

        User agent = userRepo.findByEmail("odec_kaloum@ravec.gov.gn")
                .or(() -> userRepo.findAll().stream()
                        .filter(u -> u.getEmail().startsWith("odec_"))
                        .findFirst())
                .orElse(null);

        int created = 0;

        // ══ 1 — Fatoumata DIALLO — fille — Kaloum — VALIDE ═══════════
        created += seed(ActeNaissance.builder()
            .id("SEED-NAI-001")
            .source(SourceActe.DECLARATION)
            .typeActe(typeNaissance)
            .numeroActe("2024-001")
            .anneeRegistre("2024")
            .feuillet("F-001")
            .commune(kaloum)
            .pointCollecte("CKY04")
            .enfant(enfant("PER-SEED-001", "Fatoumata", "DIALLO", "F",
                    LocalDate.of(2024, 3, 12), null, "GIN",
                    "CKY", "CKY04", "Almamya", null))
            .pere(parent("PER-SEED-002", "Mamadou Saliou", "DIALLO", "M",
                    LocalDate.of(1985, 6, 20), null, "GIN",
                    "CKY", "CKY04", "Almamya",
                    "GIN", "CKY", "CKY04", "Almamya", "Almamya, Kaloum",
                    "46", "628 10 20 30"))
            .mere(parent("PER-SEED-003", "Kadiatou", "BARRY", "F",
                    LocalDate.of(1990, 11, 5), null, "GIN",
                    "CKY", "CKY04", "Almamya",
                    "GIN", "CKY", "CKY04", "Almamya", "Almamya, Kaloum",
                    "29", "622 20 30 40"))
            .declarant(declarant("PER-SEED-004", "Mamadou Saliou", "DIALLO", "M",
                    LocalDate.of(1985, 6, 20), null, "GIN",
                    "46", "628 10 20 30", "CKY04", "CKY04", "Almamya, Kaloum"))
            .qualiteDeclarant("Père")
            .sexeDeclarant("M")
            .signatureDeclarant("OUI")
            .dateDeclaration(LocalDate.of(2024, 3, 14))
            .heureNaissance("06:30")
            .formationSanitaire("Hôpital Ignace Deen")
            .lieuAccouchement("FORMATION_SANITAIRE")
            .rangNaissanceMere(2)
            .rangEnfant(2)
            .pereConnu("Oui")
            .mereConnue("Oui")
            .parentsMaries("Oui")
            .dateMariage(LocalDate.of(2012, 5, 15))
            .communeMariage("CKY04")
            .dateDressage(LocalDate.of(2024, 3, 14))
            .heureDressage("10:00")
            .dateInscription(LocalDate.of(2024, 3, 14))
            .actionsFaire(ActionsFaire.EN_COURS_SAISIE)
            .statut(ValidationStatut.EN_ATTENTE)
            .agent(agent)
            .isDeleted(Delete.No)
            .build());

        // ══ 2 — Ibrahima CAMARA — garçon — Matam — EN_ATTENTE ═══════
        created += seed(ActeNaissance.builder()
            .id("SEED-NAI-002")
            .source(SourceActe.DECLARATION)
            .typeActe(typeNaissance)
            .numeroActe("2024-002")
            .anneeRegistre("2024")
            .feuillet("F-002")
            .commune(matam)
            .pointCollecte("CKY08")
            .enfant(enfant("PER-SEED-005", "Ibrahima", "CAMARA", "M",
                    LocalDate.of(2024, 7, 3), null, "GIN",
                    "CKY", "CKY08", "Taouyah", null))
            .pere(parent("PER-SEED-006", "Oumar", "CAMARA", "M",
                    LocalDate.of(1978, 4, 15), null, "GIN",
                    "CKY", "CKY08", "Taouyah",
                    "GIN", "CKY", "CKY08", "Taouyah", "Taouyah, Matam",
                    "53", "664 30 40 50"))
            .mere(parent("PER-SEED-007", "Mariama", "CONDE", "F",
                    LocalDate.of(1983, 9, 22), null, "GIN",
                    "CKY", "CKY08", "Taouyah",
                    "GIN", "CKY", "CKY08", "Taouyah", "Taouyah, Matam",
                    "68", "621 40 50 60"))
            .declarant(declarant("PER-SEED-008", "Oumar", "CAMARA", "M",
                    LocalDate.of(1978, 4, 15), null, "GIN",
                    "53", "664 30 40 50", "CKY08", "CKY08", "Taouyah, Matam"))
            .qualiteDeclarant("Père")
            .sexeDeclarant("M")
            .signatureDeclarant("OUI")
            .dateDeclaration(LocalDate.of(2024, 7, 5))
            .heureNaissance("14:20")
            .formationSanitaire("Clinique Ambroise Paré")
            .lieuAccouchement("FORMATION_SANITAIRE")
            .rangNaissanceMere(1)
            .rangEnfant(1)
            .pereConnu("Oui")
            .mereConnue("Oui")
            .parentsMaries("Oui")
            .dateMariage(LocalDate.of(2008, 11, 20))
            .communeMariage("CKY08")
            .dateDressage(LocalDate.of(2024, 7, 5))
            .heureDressage("16:00")
            .dateInscription(LocalDate.of(2024, 7, 5))
            .actionsFaire(ActionsFaire.A_VALIDER)
            .statut(ValidationStatut.EN_ATTENTE)
            .agent(agent)
            .isDeleted(Delete.No)
            .build());

        // ══ 3 — Aïssatou BALDE — fille — Ratoma — EN_ATTENTE ════════
        created += seed(ActeNaissance.builder()
            .id("SEED-NAI-003")
            .source(SourceActe.DECLARATION)
            .typeActe(typeNaissance)
            .numeroActe("2025-001")
            .anneeRegistre("2025")
            .feuillet("F-001")
            .commune(ratoma)
            .pointCollecte("CKY10")
            .enfant(enfant("PER-SEED-009", "Aïssatou", "BALDE", "F",
                    LocalDate.of(2025, 1, 18), null, "GIN",
                    "CKY", "CKY10", "Sonfonia", null))
            .pere(parent("PER-SEED-010", "Thierno Mamadou", "BALDE", "M",
                    LocalDate.of(1980, 3, 10), null, "GIN",
                    "CKY", "CKY10", "Sonfonia",
                    "GIN", "CKY", "CKY10", "Sonfonia", "Sonfonia, Ratoma",
                    "76", "628 50 60 70"))
            .mere(parent("PER-SEED-011", "Hadja Aminata", "SOW", "F",
                    LocalDate.of(1985, 7, 30), null, "GIN",
                    "CKY", "CKY10", "Sonfonia",
                    "GIN", "CKY", "CKY10", "Sonfonia", "Sonfonia, Ratoma",
                    "68", "622 60 70 80"))
            .declarant(declarant("PER-SEED-012", "Thierno Mamadou", "BALDE", "M",
                    LocalDate.of(1980, 3, 10), null, "GIN",
                    "76", "628 50 60 70", "CKY10", "CKY10", "Sonfonia, Ratoma"))
            .qualiteDeclarant("Père")
            .sexeDeclarant("M")
            .signatureDeclarant("OUI")
            .dateDeclaration(LocalDate.of(2025, 1, 20))
            .heureNaissance("08:45")
            .formationSanitaire("Centre de Santé de Ratoma")
            .lieuAccouchement("FORMATION_SANITAIRE")
            .rangNaissanceMere(3)
            .rangEnfant(3)
            .pereConnu("Oui")
            .mereConnue("Oui")
            .parentsMaries("Oui")
            .dateMariage(LocalDate.of(2010, 8, 5))
            .communeMariage("CKY10")
            .dateDressage(LocalDate.of(2025, 1, 20))
            .heureDressage("11:30")
            .dateInscription(LocalDate.of(2025, 1, 20))
            .actionsFaire(ActionsFaire.EN_COURS_SAISIE)
            .statut(ValidationStatut.EN_ATTENTE)
            .agent(agent)
            .isDeleted(Delete.No)
            .build());

        // ══ 4 — Sekou TOURE — garçon — Matoto — TRANSCRIPTION — VALIDE
        created += seed(ActeNaissance.builder()
            .id("SEED-NAI-004")
            .source(SourceActe.TRANSCRIPTION)
            .typeActe(typeNaissance)
            .numeroActe("2024-003")
            .anneeRegistre("2024")
            .feuillet("F-003")
            .commune(matoto)
            .pointCollecte("CKY09")
            .enfant(enfant("PER-SEED-013", "Sekou", "TOURE", "M",
                    LocalDate.of(2010, 5, 22), null, "GIN",
                    "CKY", "CKY09", "Dar-Es-Salam", null))
            .pere(parent("PER-SEED-014", "Lansana", "TOURE", "M",
                    LocalDate.of(1970, 8, 14), null, "GIN",
                    "CKY", "CKY09", "Dar-Es-Salam",
                    "GIN", "CKY", "CKY09", "Dar-Es-Salam", "Dar-Es-Salam, Matoto",
                    "25", "625 70 80 90"))
            .mere(parent("PER-SEED-015", "Fatoumata", "SYLLA", "F",
                    LocalDate.of(1975, 2, 28), null, "GIN",
                    "CKY", "CKY09", "Dar-Es-Salam",
                    "GIN", "CKY", "CKY09", "Dar-Es-Salam", "Dar-Es-Salam, Matoto",
                    "29", "621 80 90 01"))
            .declarant(declarant("PER-SEED-016", "Lansana", "TOURE", "M",
                    LocalDate.of(1970, 8, 14), null, "GIN",
                    "25", "625 70 80 90", "CKY09", "CKY09", "Dar-Es-Salam, Matoto"))
            .qualiteDeclarant("Père")
            .sexeDeclarant("M")
            .signatureDeclarant("OUI")
            .dateDeclaration(LocalDate.of(2024, 2, 10))
            .pereConnu("Oui")
            .mereConnue("Oui")
            .parentsMaries("Oui")
            .dateMariage(LocalDate.of(2005, 3, 18))
            .communeMariage("CKY09")
            .tribunal("Tribunal de Première Instance de Kaloum")
            .numeroJugement("2024/JUG/0045")
            .dateJugement(LocalDate.of(2024, 1, 25))
            .dateDressage(LocalDate.of(2024, 2, 10))
            .heureDressage("09:00")
            .dateInscription(LocalDate.of(2024, 2, 10))
            .actionsFaire(ActionsFaire.EN_COURS_SAISIE)
            .statut(ValidationStatut.EN_ATTENTE)
            .agent(agent)
            .isDeleted(Delete.No)
            .build());

        // ══ 5 — Mariam KOUYATE — fille — Dixinn — TRANSCRIPTION — EN_ATTENTE
        created += seed(ActeNaissance.builder()
            .id("SEED-NAI-005")
            .source(SourceActe.TRANSCRIPTION)
            .typeActe(typeNaissance)
            .numeroActe("2025-002")
            .anneeRegistre("2025")
            .feuillet("F-002")
            .commune(dixinn)
            .pointCollecte("CKY01")
            .enfant(enfant("PER-SEED-017", "Mariam", "KOUYATE", "F",
                    LocalDate.of(2008, 11, 7), null, "GIN",
                    "CKY", "CKY01", "Dixinn Centre", null))
            .pere(parent("PER-SEED-018", "Bakary", "KOUYATE", "M",
                    LocalDate.of(1965, 5, 3), null, "GIN",
                    "CKY", "CKY01", "Dixinn Centre",
                    "GIN", "CKY", "CKY01", "Dixinn Centre", "Dixinn Centre, Dixinn",
                    "203", "628 90 01 12"))
            .mere(parent("PER-SEED-019", "Oumou", "KEITA", "F",
                    LocalDate.of(1972, 9, 18), null, "GIN",
                    "CKY", "CKY01", "Dixinn Centre",
                    "GIN", "CKY", "CKY01", "Dixinn Centre", "Dixinn Centre, Dixinn",
                    "29", "622 90 01 12"))
            .declarant(declarant("PER-SEED-020", "Bakary", "KOUYATE", "M",
                    LocalDate.of(1965, 5, 3), null, "GIN",
                    "203", "628 90 01 12", "CKY01", "CKY01", "Dixinn Centre, Dixinn"))
            .qualiteDeclarant("Père")
            .sexeDeclarant("M")
            .signatureDeclarant("OUI")
            .dateDeclaration(LocalDate.of(2025, 3, 5))
            .pereConnu("Oui")
            .mereConnue("Oui")
            .parentsMaries("Oui")
            .dateMariage(LocalDate.of(1999, 2, 10))
            .communeMariage("CKY01")
            .tribunal("Tribunal de Première Instance de Dixinn")
            .numeroJugement("2025/JUG/0012")
            .dateJugement(LocalDate.of(2025, 2, 18))
            .dateDressage(LocalDate.of(2025, 3, 5))
            .heureDressage("14:00")
            .dateInscription(LocalDate.of(2025, 3, 5))
            .actionsFaire(ActionsFaire.A_VALIDER)
            .statut(ValidationStatut.EN_ATTENTE)
            .agent(agent)
            .isDeleted(Delete.No)
            .build());

        log.info("=== SeedActesInitializer : {} acte(s) créé(s) ===", created);
    }

    // ─── helpers ──────────────────────────────────────────────────────────────

    private int seed(ActeNaissance acte) {
        boolean isNew = !acteRepo.existsById(acte.getId());
        savePersonne(acte.getEnfant());
        savePersonne(acte.getPere());
        savePersonne(acte.getMere());
        savePersonne(acte.getDeclarant());
        acteRepo.save(acte);
        log.info("  [{}] acte {} — {} {} ({})",
                isNew ? "+" : "~",
                acte.getId(),
                acte.getEnfant() != null ? acte.getEnfant().getPrenom() : "?",
                acte.getEnfant() != null ? acte.getEnfant().getNom()    : "?",
                acte.getSource());
        return isNew ? 1 : 0;
    }

    private void savePersonne(Personne p) {
        if (p != null) personneRepo.save(p);
    }

    /** Personne enfant : identité + lieu de naissance + nationalité. */
    private Personne enfant(String id, String prenom, String nom, String sexe,
                             LocalDate dob, String npi, String nat,
                             String prefN, String comN, String quartierN, String villeN) {
        return Personne.builder()
                .id(id).prenom(prenom).nom(nom).sexe(sexe)
                .dateNaissance(dob).npi(npi)
                .nationalite(nat)
                .paysNaissance("GIN")
                .prefectureNaissance(prefN)
                .communeNaissance(comN)
                .quartierNaissance(quartierN)
                .villeNaissance(villeN)
                .build();
    }

    /** Personne père/mère : identité + lieu naissance + domicile + profession. */
    private Personne parent(String id, String prenom, String nom, String sexe,
                             LocalDate dob, String npi, String nat,
                             String prefN, String comN, String quartierN,
                             String paysD, String prefD, String comD, String quartierD, String adresse,
                             String profCode, String tel) {
        return Personne.builder()
                .id(id).prenom(prenom).nom(nom).sexe(sexe)
                .dateNaissance(dob).npi(npi)
                .nationalite(nat)
                .paysNaissance("GIN")
                .prefectureNaissance(prefN)
                .communeNaissance(comN)
                .quartierNaissance(quartierN)
                .paysResidence(paysD)
                .prefectureDomicile(prefD)
                .communeDomicile(comD)
                .quartierDomicile(quartierD)
                .adresse(adresse)
                .profession(profCode)
                .telephone(tel)
                .build();
    }

    /** Personne déclarant : identité complète + domicile + contact. */
    private Personne declarant(String id, String prenom, String nom, String sexe,
                                LocalDate dob, String npi, String nat,
                                String profCode, String tel,
                                String comN, String comD, String adresse) {
        return Personne.builder()
                .id(id).prenom(prenom).nom(nom).sexe(sexe)
                .dateNaissance(dob).npi(npi)
                .nationalite(nat)
                .paysNaissance("GIN")
                .communeNaissance(comN)
                .paysResidence("GIN")
                .communeDomicile(comD)
                .adresse(adresse)
                .profession(profCode)
                .telephone(tel)
                .build();
    }
}

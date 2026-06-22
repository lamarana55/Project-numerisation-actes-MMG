import '../../../../../core/utils/date_formatter.dart';
import '../../domain/entities/declaration_deces.dart';

extension on bool {
  String get ouiNon => this ? 'OUI' : 'NON';
}

/// Transforme [DeclarationDeces] en payload JSON plat conforme à
/// `ActeDecesRequest` (clés = noms de champs Java, camelCase).
extension DeclarationDecesRequestMapper on DeclarationDeces {
  Map<String, dynamic> toRequestJson() {
    final map = <String, dynamic>{};
    void put(String key, dynamic value) {
      if (value != null && !(value is String && value.trim().isEmpty)) {
        map[key] = value;
      }
    }

    // ── Type ──────────────────────────────────────────────
    put('typeCreation', type.value);

    // ── Défunt ────────────────────────────────────────────
    put('prenomDefunt', defunt.prenom);
    put('nomDefunt', defunt.nom);
    put('sexeDefunt', defunt.sexe?.value);
    put('dateNaissanceDefunt', DateFormatter.toIsoDate(defunt.dateNaissance));
    put('nationaliteDefunt', defunt.nationalite);
    put('professionDefunt', defunt.profession);
    put('situationMatrimoniale', defunt.situationMatrimoniale);
    put('paysNaissanceDefunt', defunt.lieuNaissance.pays);
    put('regionNaissanceDefunt', defunt.lieuNaissance.region);
    put('prefectureNaissanceDefunt', defunt.lieuNaissance.prefecture);
    put('communeNaissanceDefunt', defunt.lieuNaissance.commune);

    // ── Décès ─────────────────────────────────────────────
    put('dateDeces', DateFormatter.toIsoDate(deces.dateDeces));
    put('heureDeces', deces.heureDeces);
    put('lieuDeces', deces.lieuDeces);
    put('causeDeces', deces.causeDeces);
    put('typeDeces', deces.typeDeces);

    // ── Conjoint(e) ───────────────────────────────────────
    put('conjointConnu', conjoint.connu.ouiNon);
    put('prenomConjoint', conjoint.prenom);
    put('nomConjoint', conjoint.nom);
    put('sexeConjoint', conjoint.sexe?.value);
    put('nationaliteConjoint', conjoint.nationalite);
    put('professionConjoint', conjoint.profession);

    // ── Père du défunt ────────────────────────────────────
    put('prenomPere', pere.prenom);
    put('nomPere', pere.nom);
    put('dateNaissancePere', DateFormatter.toIsoDate(pere.dateNaissance));
    put('nationalitePere', pere.nationalite);
    put('professionPere', pere.profession);

    // ── Mère du défunt ────────────────────────────────────
    put('prenomMere', mere.prenom);
    put('nomMere', mere.nom);
    put('dateNaissanceMere', DateFormatter.toIsoDate(mere.dateNaissance));
    put('nationaliteMere', mere.nationalite);
    put('professionMere', mere.profession);

    // ── Déclarant ─────────────────────────────────────────
    put('qualiteDeclarant', declarant.qualite);
    put('prenomDeclarant', declarant.prenom);
    put('nomDeclarant', declarant.nom);
    put('sexeDeclarant', declarant.sexe?.value);
    put('telephoneDeclarant', declarant.telephone);
    put('lienDeclarantDefunt', declarant.lienAvecDefunt);
    put('dateDeclaration',
        DateFormatter.toIsoDate(declarant.dateDeclaration ?? DateTime.now()));

    return map;
  }
}

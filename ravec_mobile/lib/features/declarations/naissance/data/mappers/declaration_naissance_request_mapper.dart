import '../../../../../core/utils/date_formatter.dart';
import '../../domain/entities/declaration_naissance.dart';

/// Convention backend pour les champs booléens stockés en `String`.
extension on bool {
  String get ouiNon => this ? 'OUI' : 'NON';
}

/// Transforme l'agrégat [DeclarationNaissance] en payload JSON plat
/// conforme à `ActeNaissanceRequest` (clés = noms de champs Java, camelCase).
///
/// Seules les valeurs non nulles sont incluses pour garder un payload propre.
extension DeclarationNaissanceRequestMapper on DeclarationNaissance {
  Map<String, dynamic> toRequestJson() {
    final map = <String, dynamic>{};
    void put(String key, dynamic value) {
      if (value != null && !(value is String && value.trim().isEmpty)) {
        map[key] = value;
      }
    }

    // ── Type ──────────────────────────────────────────────
    put('typeCreation', type.value);

    // ── Nouveau-né ────────────────────────────────────────
    put('prenom', nouveauNe.prenom);
    put('nom', nouveauNe.nom);
    put('sexe', nouveauNe.sexe?.value);
    put('dateNaissance', DateFormatter.toIsoDate(nouveauNe.dateNaissance));
    put('heureNaissance', nouveauNe.heureNaissance);
    put('lieuAccouchement', nouveauNe.lieuAccouchement);
    put('formationSanitaire', nouveauNe.formationSanitaire);
    put('naissanceMultiple', nouveauNe.naissanceMultiple.ouiNon);
    put('typeNaissanceMultiple', nouveauNe.typeNaissanceMultiple);
    put('rangEnfant', nouveauNe.rangEnfant);
    final ln = nouveauNe.lieuNaissance;
    put('paysNaissance', ln.pays);
    put('regionNaissance', ln.region);
    put('prefectureNaissance', ln.prefecture);
    put('communeNaissance', ln.commune);
    put('quartierNaissance', ln.quartier);
    put('villeNaissance', ln.ville);

    // ── Géolocalisation → adresse du lieu ─────────────────
    put('adresseLieu', geolocalisation.adresseLieu);

    // ── Père ──────────────────────────────────────────────
    put('npiPere', pere.npi);
    put('pereConnu', pere.connu.ouiNon);
    put('pereDecede', pere.decede.ouiNon);
    put('prenomPere', pere.prenom);
    put('nomPere', pere.nom);
    put('dateNaissancePere', DateFormatter.toIsoDate(pere.dateNaissance));
    put('nationalitePere', pere.nationalite);
    put('professionPere', pere.profession);
    put('telephonePere', pere.telephone);
    put('situationMatrimPere', pere.situationMatrimoniale);
    put('adressePere', pere.adresse);
    put('regionNaissancePere', pere.lieuNaissance.region);
    put('prefectureNaissancePere', pere.lieuNaissance.prefecture);
    put('communeNaissancePere', pere.lieuNaissance.commune);
    put('paysResidencePere', pere.domicile.pays);
    put('regionDomicilePere', pere.domicile.region);
    put('prefectureDomicilePere', pere.domicile.prefecture);
    put('communeDomicilePere', pere.domicile.commune);
    put('quartierDomicilePere', pere.domicile.quartier);

    // ── Mère ──────────────────────────────────────────────
    put('npiMere', mere.npi);
    put('mereConnue', mere.connu.ouiNon);
    put('mereDecedee', mere.decede.ouiNon);
    put('prenomMere', mere.prenom);
    put('nomMere', mere.nom);
    put('dateNaissanceMere', DateFormatter.toIsoDate(mere.dateNaissance));
    put('nationaliteMere', mere.nationalite);
    put('professionMere', mere.profession);
    put('telephoneMere', mere.telephone);
    put('situationMatrimMere', mere.situationMatrimoniale);
    put('adresseMere', mere.adresse);
    put('regionNaissanceMere', mere.lieuNaissance.region);
    put('prefectureNaissanceMere', mere.lieuNaissance.prefecture);
    put('communeNaissanceMere', mere.lieuNaissance.commune);
    put('paysResidenceMere', mere.domicile.pays);
    put('regionDomicileMere', mere.domicile.region);
    put('prefectureDomicileMere', mere.domicile.prefecture);
    put('communeDomicileMere', mere.domicile.commune);
    put('quartierDomicileMere', mere.domicile.quartier);
    put('parentsMaries', parentsMaries.ouiNon);

    // ── Déclarant ─────────────────────────────────────────
    put('npiDeclarant', declarant.npi);
    put('qualiteDeclarant', declarant.qualite);
    put('prenomDeclarant', declarant.prenom);
    put('nomDeclarant', declarant.nom);
    put('sexeDeclarant', declarant.sexe?.value);
    put('telephoneDeclarant', declarant.telephone);
    put('dateDeclaration',
        DateFormatter.toIsoDate(declarant.dateDeclaration ?? DateTime.now()));

    return map;
  }
}

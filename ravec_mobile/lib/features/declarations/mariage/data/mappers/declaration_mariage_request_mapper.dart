import '../../../../../core/utils/date_formatter.dart';
import '../../domain/entities/declaration_mariage.dart';

/// Transforme [DeclarationMariage] en payload JSON plat conforme à
/// `ActeMariageRequest` (clés = noms de champs Java, camelCase).
extension DeclarationMariageRequestMapper on DeclarationMariage {
  Map<String, dynamic> toRequestJson() {
    final map = <String, dynamic>{};
    void put(String key, dynamic value) {
      if (value != null && !(value is String && value.trim().isEmpty)) {
        map[key] = value;
      }
    }

    // ── Mariage ───────────────────────────────────────────
    put('dateMariage', DateFormatter.toIsoDate(mariage.dateMariage));
    put('heureMariage', mariage.heureMariage);
    put('typeMariage', mariage.typeMariage?.value);
    put('lieuMariage', mariage.lieuMariage);
    put('communeMariage', mariage.communeMariage);
    put('regimeMatrimonial', mariage.regimeMatrimonial);

    // ── Époux ─────────────────────────────────────────────
    put('prenomEpoux', epoux.prenom);
    put('nomEpoux', epoux.nom);
    put('dateNaissanceEpoux', DateFormatter.toIsoDate(epoux.dateNaissance));
    put('communeNaissanceEpoux', epoux.communeNaissance);
    put('nationaliteEpoux', epoux.nationalite);
    put('professionEpoux', epoux.profession);
    put('telephoneEpoux', epoux.telephone);
    put('npiEpoux', epoux.npi);
    put('adresseEpoux', epoux.adresse);
    put('communeDomicileEpoux', epoux.communeDomicile);
    put('quartierDomicileEpoux', epoux.quartierDomicile);
    put('etatCivilAntEpoux', epoux.etatCivilAnterieur);
    put('prenomPereEpoux', epoux.pere.prenom);
    put('nomPereEpoux', epoux.pere.nom);
    put('professionPereEpoux', epoux.pere.profession);
    put('nationalitePereEpoux', epoux.pere.nationalite);
    put('prenomMereEpoux', epoux.mere.prenom);
    put('nomMereEpoux', epoux.mere.nom);
    put('professionMereEpoux', epoux.mere.profession);
    put('nationaliteMereEpoux', epoux.mere.nationalite);

    // ── Épouse ────────────────────────────────────────────
    put('prenomEpouse', epouse.prenom);
    put('nomEpouse', epouse.nom);
    put('dateNaissanceEpouse', DateFormatter.toIsoDate(epouse.dateNaissance));
    put('communeNaissanceEpouse', epouse.communeNaissance);
    put('nationaliteEpouse', epouse.nationalite);
    put('professionEpouse', epouse.profession);
    put('telephoneEpouse', epouse.telephone);
    put('npiEpouse', epouse.npi);
    put('adresseEpouse', epouse.adresse);
    put('communeDomicileEpouse', epouse.communeDomicile);
    put('quartierDomicileEpouse', epouse.quartierDomicile);
    put('etatCivilAntEpouse', epouse.etatCivilAnterieur);
    put('prenomPereEpouse', epouse.pere.prenom);
    put('nomPereEpouse', epouse.pere.nom);
    put('professionPereEpouse', epouse.pere.profession);
    put('nationalitePereEpouse', epouse.pere.nationalite);
    put('prenomMereEpouse', epouse.mere.prenom);
    put('nomMereEpouse', epouse.mere.nom);
    put('professionMereEpouse', epouse.mere.profession);
    put('nationaliteMereEpouse', epouse.mere.nationalite);

    // ── Témoin 1 ──────────────────────────────────────────
    put('prenomTemoin1', temoin1.prenom);
    put('nomTemoin1', temoin1.nom);
    put('sexeTemoin1', temoin1.sexe?.value);
    put('professionTemoin1', temoin1.profession);
    put('telephoneTemoin1', temoin1.telephone);
    put('npiTemoin1', temoin1.npi);
    put('adresseTemoin1', temoin1.adresse);

    // ── Témoin 2 ──────────────────────────────────────────
    put('prenomTemoin2', temoin2.prenom);
    put('nomTemoin2', temoin2.nom);
    put('sexeTemoin2', temoin2.sexe?.value);
    put('professionTemoin2', temoin2.profession);
    put('telephoneTemoin2', temoin2.telephone);
    put('npiTemoin2', temoin2.npi);
    put('adresseTemoin2', temoin2.adresse);

    // ── Déclarant ─────────────────────────────────────────
    put('prenomDeclarant', declarant.prenom);
    put('nomDeclarant', declarant.nom);
    put('qualiteDeclarant', declarant.qualite);
    put('dateDeclaration',
        DateFormatter.toIsoDate(declarant.dateDeclaration ?? DateTime.now()));

    return map;
  }
}

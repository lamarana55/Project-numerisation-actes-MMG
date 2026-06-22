import 'package:freezed_annotation/freezed_annotation.dart';

part 'declaration_mariage.freezed.dart';

/// Sexe (`M` | `F`).
enum Sexe {
  masculin('M'),
  feminin('F');

  const Sexe(this.value);
  final String value;
}

/// Type de création de l'acte.
enum TypeDeclaration {
  declaration('DECLARATION'),
  transcription('TRANSCRIPTION');

  const TypeDeclaration(this.value);
  final String value;
}

/// Type de mariage.
enum TypeMariage {
  civil('CIVIL'),
  religieux('RELIGIEUX'),
  coutumier('COUTUMIER');

  const TypeMariage(this.value);
  final String value;
}

// ════════════════════════════════════════════════════════════
//  Circonstances du mariage
// ════════════════════════════════════════════════════════════
@freezed
class InfosMariage with _$InfosMariage {
  const factory InfosMariage({
    DateTime? dateMariage,
    String? heureMariage,
    TypeMariage? typeMariage,
    String? lieuMariage,
    String? communeMariage,
    String? regimeMatrimonial,
  }) = _InfosMariage;
}

// ════════════════════════════════════════════════════════════
//  Parent d'un époux (père / mère)
// ════════════════════════════════════════════════════════════
@freezed
class ParentMariage with _$ParentMariage {
  const factory ParentMariage({
    String? prenom,
    String? nom,
    String? profession,
    String? nationalite,
  }) = _ParentMariage;
}

// ════════════════════════════════════════════════════════════
//  Conjoint (époux ou épouse) + ses parents
// ════════════════════════════════════════════════════════════
@freezed
class Conjoint with _$Conjoint {
  const factory Conjoint({
    String? prenom,
    String? nom,
    DateTime? dateNaissance,
    String? communeNaissance,
    String? nationalite,
    String? profession,
    String? telephone,
    String? npi,
    String? adresse,
    String? communeDomicile,
    String? quartierDomicile,
    String? etatCivilAnterieur,
    @Default(ParentMariage()) ParentMariage pere,
    @Default(ParentMariage()) ParentMariage mere,
  }) = _Conjoint;
}

// ════════════════════════════════════════════════════════════
//  Témoin
// ════════════════════════════════════════════════════════════
@freezed
class Temoin with _$Temoin {
  const factory Temoin({
    String? prenom,
    String? nom,
    Sexe? sexe,
    String? profession,
    String? telephone,
    String? npi,
    String? adresse,
  }) = _Temoin;
}

// ════════════════════════════════════════════════════════════
//  Déclarant / Officier
// ════════════════════════════════════════════════════════════
@freezed
class DeclarantMariage with _$DeclarantMariage {
  const factory DeclarantMariage({
    String? prenom,
    String? nom,
    String? qualite,
    DateTime? dateDeclaration,
  }) = _DeclarantMariage;
}

// ════════════════════════════════════════════════════════════
//  Agrégat — Déclaration de mariage
// ════════════════════════════════════════════════════════════
@freezed
class DeclarationMariage with _$DeclarationMariage {
  const factory DeclarationMariage({
    /// Clé d'idempotence (anti-doublon synchronisation hors ligne).
    required String idempotencyKey,
    @Default(TypeDeclaration.declaration) TypeDeclaration type,
    @Default(InfosMariage()) InfosMariage mariage,
    @Default(Conjoint()) Conjoint epoux,
    @Default(Conjoint()) Conjoint epouse,
    @Default(Temoin()) Temoin temoin1,
    @Default(Temoin()) Temoin temoin2,
    @Default(DeclarantMariage()) DeclarantMariage declarant,
  }) = _DeclarationMariage;
}

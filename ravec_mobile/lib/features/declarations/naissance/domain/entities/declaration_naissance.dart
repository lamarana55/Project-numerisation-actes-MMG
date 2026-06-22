import 'package:freezed_annotation/freezed_annotation.dart';

part 'declaration_naissance.freezed.dart';

/// Sexe — valeur transmise au backend (`sexe` = "M" | "F").
enum Sexe {
  masculin('M'),
  feminin('F');

  const Sexe(this.value);
  final String value;
}

/// Type de création de l'acte (`typeCreation` côté backend).
enum TypeDeclaration {
  declaration('DECLARATION'),
  transcription('TRANSCRIPTION');

  const TypeDeclaration(this.value);
  final String value;
}

/// Nature d'une pièce jointe.
enum TypePieceJointe {
  certificatAccouchement,
  pieceIdentiteDeclarant,
  jugementSuppletif,
  autre,
}

// ════════════════════════════════════════════════════════════
//  Lieu administratif (cascade région → préfecture → commune…)
// ════════════════════════════════════════════════════════════
@freezed
class LieuAdministratif with _$LieuAdministratif {
  const factory LieuAdministratif({
    String? pays,
    String? region,
    String? prefecture,
    String? commune,
    String? quartier,
    String? ville,
  }) = _LieuAdministratif;
}

// ════════════════════════════════════════════════════════════
//  Géolocalisation du lieu de naissance
// ════════════════════════════════════════════════════════════
@freezed
class Geolocalisation with _$Geolocalisation {
  const factory Geolocalisation({
    double? latitude,
    double? longitude,
    double? precisionMetres,
    DateTime? capturedAt,
    /// Adresse lisible (renseignée ou reverse-géocodée).
    String? adresseLieu,
    /// Sélection administrative associée.
    @Default(LieuAdministratif()) LieuAdministratif lieu,
  }) = _Geolocalisation;
}

// ════════════════════════════════════════════════════════════
//  Nouveau-né (enfant)
// ════════════════════════════════════════════════════════════
@freezed
class NouveauNe with _$NouveauNe {
  const factory NouveauNe({
    String? prenom,
    String? nom,
    Sexe? sexe,
    DateTime? dateNaissance,
    String? heureNaissance,
    String? lieuAccouchement,
    String? formationSanitaire,
    @Default(false) bool naissanceMultiple,
    String? typeNaissanceMultiple,
    int? rangEnfant,
    @Default(LieuAdministratif()) LieuAdministratif lieuNaissance,
  }) = _NouveauNe;
}

// ════════════════════════════════════════════════════════════
//  Parent (père ou mère)
// ════════════════════════════════════════════════════════════
@freezed
class Parent with _$Parent {
  const factory Parent({
    String? npi,
    @Default(true) bool connu,
    @Default(false) bool decede,
    String? prenom,
    String? nom,
    DateTime? dateNaissance,
    String? nationalite,
    String? profession,
    String? telephone,
    String? situationMatrimoniale,
    String? adresse,
    @Default(LieuAdministratif()) LieuAdministratif lieuNaissance,
    @Default(LieuAdministratif()) LieuAdministratif domicile,
  }) = _Parent;
}

// ════════════════════════════════════════════════════════════
//  Déclarant (agent de santé / sage-femme / médecin…)
// ════════════════════════════════════════════════════════════
@freezed
class Declarant with _$Declarant {
  const factory Declarant({
    String? npi,
    String? qualite,
    String? prenom,
    String? nom,
    Sexe? sexe,
    String? telephone,
    DateTime? dateDeclaration,
  }) = _Declarant;
}

// ════════════════════════════════════════════════════════════
//  Pièce jointe (capturée localement, à téléverser)
// ════════════════════════════════════════════════════════════
@freezed
class PieceJointe with _$PieceJointe {
  const factory PieceJointe({
    required String id,
    required String nomFichier,
    required String cheminLocal,
    required TypePieceJointe type,
    int? tailleOctets,
  }) = _PieceJointe;
}

// ════════════════════════════════════════════════════════════
//  Agrégat — Déclaration de naissance
// ════════════════════════════════════════════════════════════
@freezed
class DeclarationNaissance with _$DeclarationNaissance {
  const factory DeclarationNaissance({
    /// Clé d'idempotence (anti-doublon lors de la synchronisation hors ligne).
    required String idempotencyKey,
    @Default(TypeDeclaration.declaration) TypeDeclaration type,
    @Default(NouveauNe()) NouveauNe nouveauNe,
    @Default(Parent()) Parent pere,
    @Default(Parent()) Parent mere,
    @Default(Declarant()) Declarant declarant,
    @Default(Geolocalisation()) Geolocalisation geolocalisation,
    @Default(<PieceJointe>[]) List<PieceJointe> pieces,
    @Default(false) bool parentsMaries,
  }) = _DeclarationNaissance;
}

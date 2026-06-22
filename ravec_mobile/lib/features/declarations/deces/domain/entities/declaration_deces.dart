import 'package:freezed_annotation/freezed_annotation.dart';

part 'declaration_deces.freezed.dart';

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

/// Lieu administratif (cascade).
@freezed
class LieuAdministratif with _$LieuAdministratif {
  const factory LieuAdministratif({
    String? pays,
    String? region,
    String? prefecture,
    String? commune,
  }) = _LieuAdministratif;
}

// ════════════════════════════════════════════════════════════
//  Défunt
// ════════════════════════════════════════════════════════════
@freezed
class Defunt with _$Defunt {
  const factory Defunt({
    String? prenom,
    String? nom,
    Sexe? sexe,
    DateTime? dateNaissance,
    String? nationalite,
    String? profession,
    String? situationMatrimoniale,
    @Default(LieuAdministratif()) LieuAdministratif lieuNaissance,
  }) = _Defunt;
}

// ════════════════════════════════════════════════════════════
//  Circonstances du décès
// ════════════════════════════════════════════════════════════
@freezed
class InformationsDeces with _$InformationsDeces {
  const factory InformationsDeces({
    DateTime? dateDeces,
    String? heureDeces,
    String? lieuDeces,
    String? causeDeces,
    String? typeDeces,
  }) = _InformationsDeces;
}

// ════════════════════════════════════════════════════════════
//  Conjoint(e) du défunt
// ════════════════════════════════════════════════════════════
@freezed
class Conjoint with _$Conjoint {
  const factory Conjoint({
    @Default(false) bool connu,
    String? prenom,
    String? nom,
    Sexe? sexe,
    String? nationalite,
    String? profession,
  }) = _Conjoint;
}

// ════════════════════════════════════════════════════════════
//  Parent du défunt (père / mère)
// ════════════════════════════════════════════════════════════
@freezed
class ParentDefunt with _$ParentDefunt {
  const factory ParentDefunt({
    String? prenom,
    String? nom,
    DateTime? dateNaissance,
    String? nationalite,
    String? profession,
  }) = _ParentDefunt;
}

// ════════════════════════════════════════════════════════════
//  Déclarant
// ════════════════════════════════════════════════════════════
@freezed
class DeclarantDeces with _$DeclarantDeces {
  const factory DeclarantDeces({
    String? qualite,
    String? prenom,
    String? nom,
    Sexe? sexe,
    String? telephone,
    String? lienAvecDefunt,
    DateTime? dateDeclaration,
  }) = _DeclarantDeces;
}

// ════════════════════════════════════════════════════════════
//  Agrégat — Déclaration de décès
// ════════════════════════════════════════════════════════════
@freezed
class DeclarationDeces with _$DeclarationDeces {
  const factory DeclarationDeces({
    /// Clé d'idempotence (anti-doublon synchronisation hors ligne).
    required String idempotencyKey,
    @Default(TypeDeclaration.declaration) TypeDeclaration type,
    @Default(Defunt()) Defunt defunt,
    @Default(InformationsDeces()) InformationsDeces deces,
    @Default(Conjoint()) Conjoint conjoint,
    @Default(ParentDefunt()) ParentDefunt pere,
    @Default(ParentDefunt()) ParentDefunt mere,
    @Default(DeclarantDeces()) DeclarantDeces declarant,
  }) = _DeclarationDeces;
}

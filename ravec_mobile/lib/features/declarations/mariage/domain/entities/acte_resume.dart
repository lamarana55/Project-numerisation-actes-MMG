import 'package:freezed_annotation/freezed_annotation.dart';

part 'acte_resume.freezed.dart';

/// Résumé d'acte renvoyé après création (miroir de `ActeSummaryDTO`).
@freezed
class ActeResume with _$ActeResume {
  const factory ActeResume({
    required String id,
    String? typeCreation,
    String? statut,
    String? actionsFaire,
    String? numeroActe,
    String? prenom,
    String? nom,
    String? commune,
    String? createdAt,
  }) = _ActeResume;
}

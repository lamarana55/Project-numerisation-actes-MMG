import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/acte_resume.dart';

part 'acte_summary_model.freezed.dart';
part 'acte_summary_model.g.dart';

/// Modèle de réponse miroir de `ActeSummaryDTO` (JSON backend).
@freezed
class ActeSummaryModel with _$ActeSummaryModel {
  const ActeSummaryModel._();

  const factory ActeSummaryModel({
    required String id,
    String? typeCreation,
    String? source,
    String? typeActe,
    String? prenom,
    String? nom,
    String? statut,
    String? actionsFaire,
    String? numeroActe,
    String? commune,
    String? createdAt,
    String? npi,
  }) = _ActeSummaryModel;

  factory ActeSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$ActeSummaryModelFromJson(json);

  ActeResume toEntity() => ActeResume(
        id: id,
        typeCreation: typeCreation,
        statut: statut,
        actionsFaire: actionsFaire,
        numeroActe: numeroActe,
        prenom: prenom,
        nom: nom,
        commune: commune,
        createdAt: createdAt,
      );
}

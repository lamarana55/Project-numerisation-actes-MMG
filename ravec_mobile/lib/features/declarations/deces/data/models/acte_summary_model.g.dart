// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'acte_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActeSummaryModelImpl _$$ActeSummaryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ActeSummaryModelImpl(
      id: json['id'] as String,
      typeCreation: json['typeCreation'] as String?,
      source: json['source'] as String?,
      typeActe: json['typeActe'] as String?,
      prenom: json['prenom'] as String?,
      nom: json['nom'] as String?,
      sexe: json['sexe'] as String?,
      statut: json['statut'] as String?,
      actionsFaire: json['actionsFaire'] as String?,
      numeroActe: json['numeroActe'] as String?,
      commune: json['commune'] as String?,
      createdAt: json['createdAt'] as String?,
      npi: json['npi'] as String?,
    );

Map<String, dynamic> _$$ActeSummaryModelImplToJson(
        _$ActeSummaryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'typeCreation': instance.typeCreation,
      'source': instance.source,
      'typeActe': instance.typeActe,
      'prenom': instance.prenom,
      'nom': instance.nom,
      'sexe': instance.sexe,
      'statut': instance.statut,
      'actionsFaire': instance.actionsFaire,
      'numeroActe': instance.numeroActe,
      'commune': instance.commune,
      'createdAt': instance.createdAt,
      'npi': instance.npi,
    };

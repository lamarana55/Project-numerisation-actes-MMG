// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionModelImpl _$$SessionModelImplFromJson(Map<String, dynamic> json) =>
    _$SessionModelImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      telephone: json['telephone'] as String?,
      profil: json['profil'] as String?,
      profilLibelle: json['profilLibelle'] as String?,
      niveauAdministratif: json['niveauAdministratif'] as String?,
      authorities: json['authorities'] == null
          ? const <String>[]
          : _authoritiesFromJson(json['authorities']),
      mustChangePassword: json['mustChangePassword'] as bool? ?? false,
    );

Map<String, dynamic> _$$SessionModelImplToJson(_$SessionModelImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'name': instance.name,
      'username': instance.username,
      'telephone': instance.telephone,
      'profil': instance.profil,
      'profilLibelle': instance.profilLibelle,
      'niveauAdministratif': instance.niveauAdministratif,
      'authorities': instance.authorities,
      'mustChangePassword': instance.mustChangePassword,
    };

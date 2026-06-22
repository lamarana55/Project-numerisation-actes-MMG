import 'package:freezed_annotation/freezed_annotation.dart';

part 'utilisateur.freezed.dart';

/// Utilisateur authentifié (issu du JWT / profil backend).
@freezed
class Utilisateur with _$Utilisateur {
  const Utilisateur._();

  const factory Utilisateur({
    String? id,
    String? nom,
    String? prenom,
    String? telephone,
    String? username,
    String? profil,
    String? profilLibelle,
    String? niveauAdministratif,
    @Default(<String>[]) List<String> authorities,
    @Default(false) bool mustChangePassword,
  }) = _Utilisateur;

  String get nomComplet => [prenom, nom].where((e) => (e ?? '').isNotEmpty).join(' ').trim();

  bool aPermission(String permission) => authorities.contains(permission);
}

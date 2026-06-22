import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/session.dart';
import '../../domain/entities/utilisateur.dart';

part 'session_model.freezed.dart';
part 'session_model.g.dart';

/// Convertit les `authorities` qu'elles arrivent en chaînes ("PERM")
/// ou en objets `{ "authority": "PERM" }` (forme GrantedAuthority de Spring).
List<String> _authoritiesFromJson(dynamic value) {
  if (value is! List) return const [];
  return value
      .map((e) => e is Map ? (e['authority']?.toString() ?? '') : e.toString())
      .where((e) => e.isNotEmpty)
      .toList();
}

/// Modèle de session, compatible avec `JwtResponse` du backend
/// (et avec la future réponse de `/auth/otp/verify`).
@freezed
class SessionModel with _$SessionModel {
  const SessionModel._();

  const factory SessionModel({
    required String accessToken,
    String? refreshToken,
    String? name,
    String? username,
    String? telephone,
    String? profil,
    String? profilLibelle,
    String? niveauAdministratif,
    @JsonKey(fromJson: _authoritiesFromJson) @Default(<String>[]) List<String> authorities,
    @Default(false) bool mustChangePassword,
  }) = _SessionModel;

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);

  Session toEntity() => Session(
        accessToken: accessToken,
        refreshToken: refreshToken,
        utilisateur: Utilisateur(
          nom: name,
          telephone: telephone,
          username: username,
          profil: profil,
          profilLibelle: profilLibelle,
          niveauAdministratif: niveauAdministratif,
          authorities: authorities,
          mustChangePassword: mustChangePassword,
        ),
      );
}

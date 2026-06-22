import 'package:freezed_annotation/freezed_annotation.dart';

import 'utilisateur.dart';

part 'session.freezed.dart';

/// Session authentifiée : jeton(s) + profil de l'utilisateur.
@freezed
class Session with _$Session {
  const factory Session({
    required String accessToken,
    String? refreshToken,
    required Utilisateur utilisateur,
  }) = _Session;
}

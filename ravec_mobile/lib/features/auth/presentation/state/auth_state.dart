import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/session.dart';

part 'auth_state.freezed.dart';

/// Étape du parcours d'authentification.
enum AuthPhase { saisieTelephone, otpEnvoye, authentifie }

/// Statut transitoire (chargement / erreur).
enum AuthStatut { pret, chargement, erreur }

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState({
    @Default(AuthPhase.saisieTelephone) AuthPhase phase,
    @Default(AuthStatut.pret) AuthStatut statut,
    @Default('') String telephone,
    Session? session,
    String? message,
  }) = _AuthState;

  bool get enChargement => statut == AuthStatut.chargement;
  bool get estAuthentifie => phase == AuthPhase.authentifie;
}

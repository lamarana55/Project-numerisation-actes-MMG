import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_providers.dart';
import '../state/auth_state.dart';

/// Contrôleur du parcours d'authentification (téléphone → OTP → session).
class AuthController extends Notifier<AuthState> {
  @override
  AuthState build() => const AuthState();

  /// Au démarrage : restaure la session si un jeton est déjà présent.
  Future<void> amorcer() async {
    final dejaConnecte = await ref.read(authRepositoryProvider).estAuthentifie();
    if (dejaConnecte) {
      state = state.copyWith(phase: AuthPhase.authentifie);
    }
  }

  Future<void> demanderOtp(String telephone) async {
    state = state.copyWith(statut: AuthStatut.chargement, message: null);
    final res = await ref.read(demanderOtpProvider)(telephone);
    res.fold(
      (f) => state = state.copyWith(statut: AuthStatut.erreur, message: f.message),
      (_) => state = state.copyWith(
        statut: AuthStatut.pret,
        phase: AuthPhase.otpEnvoye,
        telephone: telephone.trim(),
      ),
    );
  }

  Future<void> verifierOtp(String code) async {
    state = state.copyWith(statut: AuthStatut.chargement, message: null);
    final res = await ref.read(verifierOtpProvider)(
      telephone: state.telephone,
      code: code,
    );
    res.fold(
      (f) => state = state.copyWith(statut: AuthStatut.erreur, message: f.message),
      (session) => state = state.copyWith(
        statut: AuthStatut.pret,
        phase: AuthPhase.authentifie,
        session: session,
      ),
    );
  }

  /// Revenir à la saisie du numéro (corriger le téléphone).
  void changerTelephone() => state = state.copyWith(
        phase: AuthPhase.saisieTelephone,
        statut: AuthStatut.pret,
        message: null,
      );

  Future<void> deconnecter() async {
    await ref.read(authRepositoryProvider).seDeconnecter();
    state = const AuthState();
  }
}

final authControllerProvider =
    NotifierProvider<AuthController, AuthState>(AuthController.new);

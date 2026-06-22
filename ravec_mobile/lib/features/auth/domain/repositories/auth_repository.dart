import '../../../../core/error/result.dart';
import '../entities/session.dart';

/// Contrat d'authentification par téléphone + OTP.
abstract interface class AuthRepository {
  /// Demande l'envoi d'un code OTP au numéro de téléphone.
  Future<Result<void>> demanderOtp(String telephone);

  /// Vérifie le code OTP ; en cas de succès, ouvre et persiste la session.
  Future<Result<Session>> verifierOtp({
    required String telephone,
    required String code,
  });

  /// Indique si une session valide est déjà enregistrée (cold start).
  Future<bool> estAuthentifie();

  /// Termine la session (efface les jetons).
  Future<void> seDeconnecter();
}

/// Configuration de l'accès à l'API backend PN-RAVEC.
///
/// La base URL est injectée au build via `--dart-define=API_BASE_URL=...`
/// afin de ne jamais coder en dur l'environnement.
///
/// Exemple :
///   flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8091/api/v1
class ApiConfig {
  const ApiConfig._();

  /// URL de base de l'API (contexte `/api/v1` côté backend Spring Boot).
  /// 10.0.2.2 = hôte local vu depuis l'émulateur Android.
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://10.0.2.2:8091/api/v1',
  );

  /// Délais réseau.
  static const Duration connectTimeout = Duration(seconds: 20);
  static const Duration receiveTimeout = Duration(seconds: 30);

  /// Active le fournisseur OTP simulé (mock). Le backend expose désormais les
  /// endpoints réels `/auth/otp/*` (OTP + SMS NimbaSMS), donc le défaut est le
  /// mode RÉEL. Pour repasser en démo (code de test, aucun SMS) :
  ///   --dart-define=USE_MOCK_AUTH=true
  static const bool useMockAuth =
      bool.fromEnvironment('USE_MOCK_AUTH', defaultValue: false);

  /// Code de démonstration accepté par le mock OTP.
  static const String mockOtpCode = '123456';
}

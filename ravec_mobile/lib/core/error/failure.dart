/// Représentation d'une erreur métier remontée vers la couche présentation.
///
/// On ne propage jamais une [Exception] technique jusqu'à l'UI : les
/// datasources lèvent des exceptions, les repositories les convertissent en
/// [Failure] portées par un [Result].
sealed class Failure {
  const Failure(this.message);

  /// Message lisible (déjà en français) destiné à l'utilisateur.
  final String message;

  @override
  String toString() => '$runtimeType($message)';
}

/// Erreur réseau (pas de connexion, timeout, hôte injoignable).
class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Connexion indisponible. Réessayez plus tard.']);
}

/// Erreur d'authentification / session expirée (HTTP 401/403).
class AuthFailure extends Failure {
  const AuthFailure([super.message = 'Session expirée. Veuillez vous reconnecter.']);
}

/// Erreur de validation côté serveur (HTTP 400/422) avec détails éventuels.
class ValidationFailure extends Failure {
  const ValidationFailure(super.message, {this.fieldErrors = const {}});

  /// Erreurs par champ : { 'dateNaissance': 'Date invalide', ... }
  final Map<String, String> fieldErrors;
}

/// Erreur serveur (HTTP 5xx) ou inattendue.
class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Une erreur est survenue. Réessayez plus tard.']);
}

/// Erreur locale (stockage, sérialisation…).
class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Erreur de stockage local.']);
}

import 'failure.dart';

/// Type de retour fonctionnel pour les opérations susceptibles d'échouer,
/// sans recourir à une bibliothèque externe (style Either).
///
/// Utilisation :
///   final res = await repo.soumettre(...);
///   switch (res) {
///     case Success(:final value): ...
///     case Error(:final failure): ...
///   }
sealed class Result<T> {
  const Result();

  bool get isSuccess => this is Success<T>;
  bool get isError => this is Err<T>;

  /// Valeur si succès, sinon null.
  T? get valueOrNull => switch (this) {
        Success(:final value) => value,
        Err() => null,
      };

  R fold<R>(R Function(Failure failure) onError, R Function(T value) onSuccess) {
    return switch (this) {
      Success(:final value) => onSuccess(value),
      Err(:final failure) => onError(failure),
    };
  }
}

class Success<T> extends Result<T> {
  const Success(this.value);
  final T value;
}

/// Cas d'échec (nommé `Err` pour éviter la collision avec `dart:core.Error`).
class Err<T> extends Result<T> {
  const Err(this.failure);
  final Failure failure;
}

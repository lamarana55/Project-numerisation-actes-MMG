import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../entities/session.dart';
import '../repositories/auth_repository.dart';

/// Use case : vérifier le code OTP et ouvrir la session.
class VerifierOtp {
  const VerifierOtp(this._repository);

  final AuthRepository _repository;

  Future<Result<Session>> call({
    required String telephone,
    required String code,
  }) {
    final c = code.trim();
    if (c.length < 4) {
      return Future.value(
        const Err(ValidationFailure('Le code reçu par SMS est incomplet.')),
      );
    }
    return _repository.verifierOtp(telephone: telephone.trim(), code: c);
  }
}

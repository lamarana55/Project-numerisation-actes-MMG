import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../repositories/auth_repository.dart';

/// Use case : demander l'envoi d'un code OTP.
class DemanderOtp {
  const DemanderOtp(this._repository);

  final AuthRepository _repository;

  Future<Result<void>> call(String telephone) {
    final tel = telephone.trim();
    if (tel.isEmpty || tel.replaceAll(RegExp(r'[^0-9]'), '').length < 8) {
      return Future.value(
        const Err(ValidationFailure('Numéro de téléphone invalide.')),
      );
    }
    return _repository.demanderOtp(tel);
  }
}

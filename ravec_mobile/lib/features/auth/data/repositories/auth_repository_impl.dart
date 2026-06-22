import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/security/token_storage.dart';
import '../../domain/entities/session.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remote, this._tokenStorage);

  final AuthRemoteDataSource _remote;
  final TokenStorage _tokenStorage;

  @override
  Future<Result<void>> demanderOtp(String telephone) async {
    try {
      await _remote.demanderOtp(telephone);
      return const Success(null);
    } on ApiException catch (e) {
      return Err(_toFailure(e));
    } catch (_) {
      return const Err(ServerFailure());
    }
  }

  @override
  Future<Result<Session>> verifierOtp({
    required String telephone,
    required String code,
  }) async {
    try {
      final model = await _remote.verifierOtp(telephone: telephone, code: code);
      await _tokenStorage.saveTokens(
        accessToken: model.accessToken,
        refreshToken: model.refreshToken,
      );
      return Success(model.toEntity());
    } on ApiException catch (e) {
      return Err(_toFailure(e));
    } catch (_) {
      return const Err(ServerFailure());
    }
  }

  @override
  Future<bool> estAuthentifie() async {
    final token = await _tokenStorage.readAccessToken();
    return token != null && token.isNotEmpty;
  }

  @override
  Future<void> seDeconnecter() => _tokenStorage.clear();

  Failure _toFailure(ApiException e) {
    if (e.isNetwork) return const NetworkFailure();
    return switch (e.statusCode ?? 0) {
      400 || 422 => ValidationFailure(e.message),
      401 || 403 => AuthFailure(e.message),
      >= 500 => const ServerFailure(),
      _ => ServerFailure(e.message),
    };
  }
}

import '../../../../../core/error/failure.dart';
import '../../../../../core/error/result.dart';
import '../../../../../core/network/api_exception.dart';
import '../../domain/entities/acte_resume.dart';
import '../../domain/entities/declaration_mariage.dart';
import '../../domain/repositories/declaration_mariage_repository.dart';
import '../datasources/declaration_mariage_remote_datasource.dart';
import '../mappers/declaration_mariage_request_mapper.dart';

class DeclarationMariageRepositoryImpl implements DeclarationMariageRepository {
  DeclarationMariageRepositoryImpl(this._remote);

  final DeclarationMariageRemoteDataSource _remote;

  @override
  Future<Result<ActeResume>> soumettre(DeclarationMariage declaration) async {
    try {
      final model = await _remote.creerDeclaration(
        declaration.toRequestJson(),
        idempotencyKey: declaration.idempotencyKey,
      );
      return Success(model.toEntity());
    } on ApiException catch (e) {
      return Err(_toFailure(e));
    } catch (_) {
      return const Err(ServerFailure());
    }
  }

  Failure _toFailure(ApiException e) {
    if (e.isNetwork) {
      // TODO(offline): brancher l'outbox/SyncEngine pour mise en file locale.
      return const NetworkFailure();
    }
    return switch (e.statusCode ?? 0) {
      400 || 422 => ValidationFailure(e.message, fieldErrors: e.fieldErrors),
      401 || 403 => const AuthFailure(),
      >= 500 => const ServerFailure(),
      _ => ServerFailure(e.message),
    };
  }
}

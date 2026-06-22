import '../../../../../core/error/failure.dart';
import '../../../../../core/error/result.dart';
import '../../../../../core/network/api_exception.dart';
import '../../domain/entities/acte_resume.dart';
import '../../domain/entities/declaration_deces.dart';
import '../../domain/repositories/declaration_deces_repository.dart';
import '../datasources/declaration_deces_remote_datasource.dart';
import '../mappers/declaration_deces_request_mapper.dart';

class DeclarationDecesRepositoryImpl implements DeclarationDecesRepository {
  DeclarationDecesRepositoryImpl(this._remote);

  final DeclarationDecesRemoteDataSource _remote;

  @override
  Future<Result<ActeResume>> soumettre(DeclarationDeces declaration) async {
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

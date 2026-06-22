import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/network/dio_provider.dart';
import '../../data/datasources/declaration_deces_remote_datasource.dart';
import '../../data/repositories/declaration_deces_repository_impl.dart';
import '../../domain/repositories/declaration_deces_repository.dart';
import '../../domain/usecases/soumettre_declaration_deces.dart';

/// Câblage de la couche données (DI via Riverpod).

final _remoteDataSourceProvider =
    Provider<DeclarationDecesRemoteDataSource>((ref) {
  return DeclarationDecesRemoteDataSourceImpl(ref.watch(dioProvider));
});

final declarationDecesRepositoryProvider =
    Provider<DeclarationDecesRepository>((ref) {
  return DeclarationDecesRepositoryImpl(ref.watch(_remoteDataSourceProvider));
});

final soumettreDeclarationDecesProvider =
    Provider<SoumettreDeclarationDeces>((ref) {
  return SoumettreDeclarationDeces(ref.watch(declarationDecesRepositoryProvider));
});

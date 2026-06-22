import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/network/dio_provider.dart';
import '../../data/datasources/declaration_mariage_remote_datasource.dart';
import '../../data/repositories/declaration_mariage_repository_impl.dart';
import '../../domain/repositories/declaration_mariage_repository.dart';
import '../../domain/usecases/soumettre_declaration_mariage.dart';

/// Câblage de la couche données (DI via Riverpod).

final _remoteDataSourceProvider =
    Provider<DeclarationMariageRemoteDataSource>((ref) {
  return DeclarationMariageRemoteDataSourceImpl(ref.watch(dioProvider));
});

final declarationMariageRepositoryProvider =
    Provider<DeclarationMariageRepository>((ref) {
  return DeclarationMariageRepositoryImpl(ref.watch(_remoteDataSourceProvider));
});

final soumettreDeclarationMariageProvider =
    Provider<SoumettreDeclarationMariage>((ref) {
  return SoumettreDeclarationMariage(ref.watch(declarationMariageRepositoryProvider));
});

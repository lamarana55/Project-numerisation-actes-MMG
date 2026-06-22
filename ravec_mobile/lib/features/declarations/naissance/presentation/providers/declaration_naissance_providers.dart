import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/network/dio_provider.dart';
import '../../data/datasources/declaration_naissance_remote_datasource.dart';
import '../../data/repositories/declaration_naissance_repository_impl.dart';
import '../../domain/repositories/declaration_naissance_repository.dart';
import '../../domain/usecases/soumettre_declaration_naissance.dart';

/// Câblage de la couche données (DI via Riverpod).

final _remoteDataSourceProvider =
    Provider<DeclarationNaissanceRemoteDataSource>((ref) {
  return DeclarationNaissanceRemoteDataSourceImpl(ref.watch(dioProvider));
});

final declarationNaissanceRepositoryProvider =
    Provider<DeclarationNaissanceRepository>((ref) {
  return DeclarationNaissanceRepositoryImpl(ref.watch(_remoteDataSourceProvider));
});

final soumettreDeclarationNaissanceProvider =
    Provider<SoumettreDeclarationNaissance>((ref) {
  return SoumettreDeclarationNaissance(
    ref.watch(declarationNaissanceRepositoryProvider),
  );
});

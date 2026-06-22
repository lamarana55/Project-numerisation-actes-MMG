import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/api_config.dart';
import '../../../../core/network/dio_provider.dart';
import '../../../../core/security/token_storage.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/demander_otp.dart';
import '../../domain/usecases/verifier_otp.dart';

/// Source distante : mock tant que le backend n'expose pas `/auth/otp/*`.
final _authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  if (ApiConfig.useMockAuth) {
    return AuthMockDataSource();
  }
  return AuthRemoteDataSourceImpl(ref.watch(dioProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    ref.watch(_authRemoteDataSourceProvider),
    ref.watch(tokenStorageProvider),
  );
});

final demanderOtpProvider = Provider<DemanderOtp>((ref) {
  return DemanderOtp(ref.watch(authRepositoryProvider));
});

final verifierOtpProvider = Provider<VerifierOtp>((ref) {
  return VerifierOtp(ref.watch(authRepositoryProvider));
});

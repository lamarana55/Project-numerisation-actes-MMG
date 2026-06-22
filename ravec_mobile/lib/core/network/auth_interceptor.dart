import 'package:dio/dio.dart';

import '../security/token_storage.dart';

/// Injecte le header `Authorization: Bearer <accessToken>` sur chaque requête.
///
/// La logique de refresh (rejouer sur 401) sera ajoutée avec le module
/// d'authentification ; ce squelette se contente d'attacher le token courant.
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._tokenStorage);

  final TokenStorage _tokenStorage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenStorage.readAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}

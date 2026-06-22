import 'package:dio/dio.dart';

import '../../../../../core/config/api_endpoints.dart';
import '../../../../../core/network/api_exception.dart';
import '../models/acte_summary_model.dart';

/// Accès distant à l'API des actes de naissance.
abstract interface class DeclarationNaissanceRemoteDataSource {
  Future<ActeSummaryModel> creerDeclaration(
    Map<String, dynamic> payload, {
    required String idempotencyKey,
  });
}

class DeclarationNaissanceRemoteDataSourceImpl
    implements DeclarationNaissanceRemoteDataSource {
  DeclarationNaissanceRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<ActeSummaryModel> creerDeclaration(
    Map<String, dynamic> payload, {
    required String idempotencyKey,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.declarationNaissance,
        data: payload,
        options: Options(
          // En-tête d'idempotence : anti-doublon lors d'une re-soumission
          // (réseau instable / synchronisation hors ligne).
          headers: {'Idempotency-Key': idempotencyKey},
        ),
      );
      return ActeSummaryModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  ApiException _mapDioError(DioException e) {
    // Pannes réseau (pas de réponse serveur).
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.connectionError) {
      return ApiException(message: 'Connexion indisponible.', isNetwork: true);
    }

    final status = e.response?.statusCode;
    final data = e.response?.data;
    final serverMessage = (data is Map && data['message'] is String)
        ? data['message'] as String
        : 'Erreur lors de l\'envoi de la déclaration.';

    return ApiException(message: serverMessage, statusCode: status);
  }
}

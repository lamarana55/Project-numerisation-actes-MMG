import 'package:dio/dio.dart';

import '../../../../core/config/api_config.dart';
import '../../../../core/config/api_endpoints.dart';
import '../../../../core/network/api_exception.dart';
import '../models/session_model.dart';

/// Source distante d'authentification par téléphone + OTP.
abstract interface class AuthRemoteDataSource {
  Future<void> demanderOtp(String telephone);
  Future<SessionModel> verifierOtp({required String telephone, required String code});
}

/// Implémentation réelle (appellera les endpoints backend `/auth/otp/*`).
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<void> demanderOtp(String telephone) async {
    try {
      await _dio.post(ApiEndpoints.otpRequest, data: {'telephone': telephone});
    } on DioException catch (e) {
      throw _map(e);
    }
  }

  @override
  Future<SessionModel> verifierOtp({required String telephone, required String code}) async {
    try {
      final res = await _dio.post(
        ApiEndpoints.otpVerify,
        data: {'telephone': telephone, 'code': code},
      );
      return SessionModel.fromJson(res.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _map(e);
    }
  }

  ApiException _map(DioException e) {
    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return ApiException(message: 'Connexion indisponible.', isNetwork: true);
    }
    final status = e.response?.statusCode;
    final data = e.response?.data;
    // Le backend place le message lisible tantôt dans "message", tantôt dans
    // "status" (selon le constructeur de Response). On lit les deux.
    String? serverMsg;
    if (data is Map) {
      if (data['message'] is String && (data['message'] as String).isNotEmpty) {
        serverMsg = data['message'] as String;
      } else if (data['status'] is String && (data['status'] as String).isNotEmpty) {
        serverMsg = data['status'] as String;
      }
    }
    return ApiException(
      message: serverMsg ?? 'Échec de l\'authentification.',
      statusCode: status,
    );
  }
}

/// Fournisseur OTP SIMULÉ — tant que le backend n'expose pas `/auth/otp/*`.
/// Accepte le code [ApiConfig.mockOtpCode] (par défaut « 123456 »).
class AuthMockDataSource implements AuthRemoteDataSource {
  @override
  Future<void> demanderOtp(String telephone) async {
    await Future<void>.delayed(const Duration(milliseconds: 700));
    // Le « SMS » est simulé : aucun envoi réel.
  }

  @override
  Future<SessionModel> verifierOtp({required String telephone, required String code}) async {
    await Future<void>.delayed(const Duration(milliseconds: 700));
    if (code.trim() != ApiConfig.mockOtpCode) {
      throw ApiException(message: 'Code OTP incorrect.', statusCode: 401);
    }
    // Session de démonstration (profil agent de santé / déclarant).
    return SessionModel(
      accessToken: 'mock-token-${DateTime.now().millisecondsSinceEpoch}',
      name: 'Utilisateur Démo',
      telephone: telephone,
      username: telephone,
      profil: 'DECLARANT_SANITAIRE',
      profilLibelle: 'Agent de santé (démo)',
      niveauAdministratif: 'COMMUNAL',
      authorities: const [
        'CAN_DECLARE_BIRTH',
        'CAN_DECLARE_DEATH',
        'CAN_VIEW_OWN_DECLARATIONS',
        'CAN_VIEW_PROFILE',
      ],
    );
  }
}

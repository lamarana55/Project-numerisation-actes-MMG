/// Exception technique levée par les datasources distants.
/// Convertie en [Failure] par la couche repository.
class ApiException implements Exception {
  ApiException({
    required this.message,
    this.statusCode,
    this.fieldErrors = const {},
    this.isNetwork = false,
  });

  final String message;
  final int? statusCode;
  final Map<String, String> fieldErrors;
  final bool isNetwork;

  @override
  String toString() => 'ApiException($statusCode, $message)';
}

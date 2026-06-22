import '../../../../../core/error/result.dart';
import '../entities/acte_resume.dart';
import '../entities/declaration_mariage.dart';

/// Contrat de la couche données pour la déclaration de mariage.
abstract interface class DeclarationMariageRepository {
  /// Soumet une déclaration de mariage (POST `/actes/mariage`).
  Future<Result<ActeResume>> soumettre(DeclarationMariage declaration);
}

import '../../../../../core/error/result.dart';
import '../entities/acte_resume.dart';
import '../entities/declaration_deces.dart';

/// Contrat de la couche données pour la déclaration de décès.
abstract interface class DeclarationDecesRepository {
  /// Soumet une déclaration de décès (POST `/actes/deces`).
  Future<Result<ActeResume>> soumettre(DeclarationDeces declaration);
}

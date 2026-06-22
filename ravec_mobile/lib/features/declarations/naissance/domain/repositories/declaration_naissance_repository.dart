import '../../../../../core/error/result.dart';
import '../entities/acte_resume.dart';
import '../entities/declaration_naissance.dart';

/// Contrat de la couche données pour la déclaration de naissance.
/// L'implémentation (data) décide en ligne / hors ligne (outbox).
abstract interface class DeclarationNaissanceRepository {
  /// Soumet une déclaration de naissance.
  ///
  /// En ligne : POST `/actes/naissance` → renvoie le résumé créé.
  /// Hors ligne : mise en file locale (à brancher avec le SyncEngine).
  Future<Result<ActeResume>> soumettre(DeclarationNaissance declaration);
}

import '../../../../../core/error/failure.dart';
import '../../../../../core/error/result.dart';
import '../entities/acte_resume.dart';
import '../entities/declaration_mariage.dart';
import '../repositories/declaration_mariage_repository.dart';

/// Use case : soumettre une déclaration de mariage.
///
/// Aucun champ n'est obligatoire ; seule une cohérence de base est vérifiée
/// lorsqu'une valeur est fournie (date de mariage non future).
class SoumettreDeclarationMariage {
  const SoumettreDeclarationMariage(this._repository);

  final DeclarationMariageRepository _repository;

  Future<Result<ActeResume>> call(DeclarationMariage declaration) {
    final erreurs = _valider(declaration);
    if (erreurs.isNotEmpty) {
      return Future.value(
        Err(ValidationFailure('Formulaire invalide.', fieldErrors: erreurs)),
      );
    }
    return _repository.soumettre(declaration);
  }

  Map<String, String> _valider(DeclarationMariage d) {
    final e = <String, String>{};
    final dm = d.mariage.dateMariage;
    if (dm != null && dm.isAfter(DateTime.now())) {
      e['dateMariage'] = 'La date de mariage ne peut pas être dans le futur.';
    }
    return e;
  }
}

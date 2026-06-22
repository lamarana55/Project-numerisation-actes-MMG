import '../../../../../core/error/failure.dart';
import '../../../../../core/error/result.dart';
import '../entities/acte_resume.dart';
import '../entities/declaration_naissance.dart';
import '../repositories/declaration_naissance_repository.dart';

/// Use case : valider puis soumettre une déclaration de naissance.
///
/// Porte les règles métier minimales avant l'appel réseau (le backend
/// reste l'autorité finale via ses validations).
class SoumettreDeclarationNaissance {
  const SoumettreDeclarationNaissance(this._repository);

  final DeclarationNaissanceRepository _repository;

  Future<Result<ActeResume>> call(DeclarationNaissance declaration) {
    final erreurs = _valider(declaration);
    if (erreurs.isNotEmpty) {
      return Future.value(
        Err(ValidationFailure('Formulaire incomplet.', fieldErrors: erreurs)),
      );
    }
    return _repository.soumettre(declaration);
  }

  /// Validation locale : aucun champ n'est obligatoire.
  /// Seule une cohérence de base est vérifiée lorsqu'une valeur est fournie.
  Map<String, String> _valider(DeclarationNaissance d) {
    final e = <String, String>{};

    final dn = d.nouveauNe.dateNaissance;
    if (dn != null && dn.isAfter(DateTime.now())) {
      e['dateNaissance'] = 'La date de naissance ne peut pas être dans le futur.';
    }

    return e;
  }
}

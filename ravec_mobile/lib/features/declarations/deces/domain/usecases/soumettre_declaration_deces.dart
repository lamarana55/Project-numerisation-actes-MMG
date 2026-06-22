import '../../../../../core/error/failure.dart';
import '../../../../../core/error/result.dart';
import '../entities/acte_resume.dart';
import '../entities/declaration_deces.dart';
import '../repositories/declaration_deces_repository.dart';

/// Use case : valider puis soumettre une déclaration de décès.
class SoumettreDeclarationDeces {
  const SoumettreDeclarationDeces(this._repository);

  final DeclarationDecesRepository _repository;

  Future<Result<ActeResume>> call(DeclarationDeces declaration) {
    final erreurs = _valider(declaration);
    if (erreurs.isNotEmpty) {
      return Future.value(
        Err(ValidationFailure('Formulaire incomplet.', fieldErrors: erreurs)),
      );
    }
    return _repository.soumettre(declaration);
  }

  Map<String, String> _valider(DeclarationDeces d) {
    final e = <String, String>{};

    if ((d.defunt.prenom ?? '').trim().isEmpty) {
      e['prenomDefunt'] = 'Le prénom du défunt est obligatoire.';
    }
    if ((d.defunt.nom ?? '').trim().isEmpty) {
      e['nomDefunt'] = 'Le nom du défunt est obligatoire.';
    }
    if (d.defunt.sexe == null) {
      e['sexeDefunt'] = 'Le sexe du défunt est obligatoire.';
    }
    if (d.deces.dateDeces == null) {
      e['dateDeces'] = 'La date de décès est obligatoire.';
    } else if (d.deces.dateDeces!.isAfter(DateTime.now())) {
      e['dateDeces'] = 'La date de décès ne peut pas être dans le futur.';
    }
    // Cohérence naissance / décès.
    final dn = d.defunt.dateNaissance;
    final dd = d.deces.dateDeces;
    if (dn != null && dd != null && dn.isAfter(dd)) {
      e['dateDeces'] = 'La date de décès est antérieure à la naissance.';
    }

    return e;
  }
}

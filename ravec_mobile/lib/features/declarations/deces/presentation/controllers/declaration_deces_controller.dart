import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/error/failure.dart';
import '../../domain/entities/declaration_deces.dart';
import '../providers/declaration_deces_providers.dart';
import '../state/declaration_deces_state.dart';

/// Contrôleur de l'assistant de déclaration de décès.
class DeclarationDecesController extends Notifier<DeclarationDecesState> {
  static const _uuid = Uuid();

  @override
  DeclarationDecesState build() {
    return DeclarationDecesState(
      declaration: DeclarationDeces(idempotencyKey: _uuid.v4()),
    );
  }

  // ── Mises à jour de formulaire ────────────────────────────
  void majDefunt(Defunt defunt) =>
      state = state.copyWith(declaration: state.declaration.copyWith(defunt: defunt));

  void majDeces(InformationsDeces deces) =>
      state = state.copyWith(declaration: state.declaration.copyWith(deces: deces));

  void majConjoint(Conjoint conjoint) =>
      state = state.copyWith(declaration: state.declaration.copyWith(conjoint: conjoint));

  void majPere(ParentDefunt pere) =>
      state = state.copyWith(declaration: state.declaration.copyWith(pere: pere));

  void majMere(ParentDefunt mere) =>
      state = state.copyWith(declaration: state.declaration.copyWith(mere: mere));

  void majDeclarant(DeclarantDeces declarant) =>
      state = state.copyWith(declaration: state.declaration.copyWith(declarant: declarant));

  // ── Navigation entre étapes ───────────────────────────────
  void etapeSuivante() {
    final i = state.etape.index;
    if (i < EtapeDeces.values.length - 1) {
      state = state.copyWith(etape: EtapeDeces.values[i + 1]);
    }
  }

  void etapePrecedente() {
    final i = state.etape.index;
    if (i > 0) {
      state = state.copyWith(etape: EtapeDeces.values[i - 1]);
    }
  }

  void allerAEtape(EtapeDeces etape) => state = state.copyWith(etape: etape);

  // ── Soumission ────────────────────────────────────────────
  Future<void> soumettre() async {
    state = state.copyWith(statut: StatutEnvoi.envoiEnCours, echec: null, erreurs: {});
    final usecase = ref.read(soumettreDeclarationDecesProvider);
    final res = await usecase(state.declaration);
    res.fold(
      (failure) {
        final erreurs =
            failure is ValidationFailure ? failure.fieldErrors : <String, String>{};
        state = state.copyWith(statut: StatutEnvoi.echec, echec: failure, erreurs: erreurs);
      },
      (resume) => state = state.copyWith(statut: StatutEnvoi.succes, resultat: resume),
    );
  }

  void reinitialiser() => state = build();
}

final declarationDecesControllerProvider =
    NotifierProvider<DeclarationDecesController, DeclarationDecesState>(
  DeclarationDecesController.new,
);

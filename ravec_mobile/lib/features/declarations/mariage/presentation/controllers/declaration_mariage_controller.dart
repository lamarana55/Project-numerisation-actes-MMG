import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/error/failure.dart';
import '../../domain/entities/declaration_mariage.dart';
import '../providers/declaration_mariage_providers.dart';
import '../state/declaration_mariage_state.dart';

/// Contrôleur de l'assistant de déclaration de mariage.
class DeclarationMariageController extends Notifier<DeclarationMariageState> {
  static const _uuid = Uuid();

  @override
  DeclarationMariageState build() {
    return DeclarationMariageState(
      declaration: DeclarationMariage(idempotencyKey: _uuid.v4()),
    );
  }

  // ── Mises à jour de formulaire ────────────────────────────
  void majMariage(InfosMariage mariage) =>
      state = state.copyWith(declaration: state.declaration.copyWith(mariage: mariage));

  void majEpoux(Conjoint epoux) =>
      state = state.copyWith(declaration: state.declaration.copyWith(epoux: epoux));

  void majEpouse(Conjoint epouse) =>
      state = state.copyWith(declaration: state.declaration.copyWith(epouse: epouse));

  void majTemoin1(Temoin temoin) =>
      state = state.copyWith(declaration: state.declaration.copyWith(temoin1: temoin));

  void majTemoin2(Temoin temoin) =>
      state = state.copyWith(declaration: state.declaration.copyWith(temoin2: temoin));

  void majDeclarant(DeclarantMariage declarant) =>
      state = state.copyWith(declaration: state.declaration.copyWith(declarant: declarant));

  // ── Navigation entre étapes ───────────────────────────────
  void etapeSuivante() {
    final i = state.etape.index;
    if (i < EtapeMariage.values.length - 1) {
      state = state.copyWith(etape: EtapeMariage.values[i + 1]);
    }
  }

  void etapePrecedente() {
    final i = state.etape.index;
    if (i > 0) {
      state = state.copyWith(etape: EtapeMariage.values[i - 1]);
    }
  }

  void allerAEtape(EtapeMariage etape) => state = state.copyWith(etape: etape);

  // ── Soumission ────────────────────────────────────────────
  Future<void> soumettre() async {
    state = state.copyWith(statut: StatutEnvoi.envoiEnCours, echec: null, erreurs: {});
    final usecase = ref.read(soumettreDeclarationMariageProvider);
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

final declarationMariageControllerProvider =
    NotifierProvider<DeclarationMariageController, DeclarationMariageState>(
  DeclarationMariageController.new,
);

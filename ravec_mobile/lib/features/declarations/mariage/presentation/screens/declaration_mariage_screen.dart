import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/widgets/armoiries_background.dart';
import '../controllers/declaration_mariage_controller.dart';
import '../state/declaration_mariage_state.dart';
import 'steps/step_epouse.dart';
import 'steps/step_epoux.dart';
import 'steps/step_mariage.dart';
import 'steps/step_parents_mariage.dart';
import 'steps/step_recapitulatif_mariage.dart';
import 'steps/step_temoins.dart';

/// Assistant de déclaration de mariage (6 étapes).
class DeclarationMariageScreen extends ConsumerWidget {
  const DeclarationMariageScreen({super.key});

  static const routeName = 'declaration-mariage';
  static const routePath = '/declarations/mariage';

  static const _titres = {
    EtapeMariage.mariage: 'Mariage',
    EtapeMariage.epoux: 'Époux',
    EtapeMariage.epouse: 'Épouse',
    EtapeMariage.parents: 'Parents',
    EtapeMariage.temoins: 'Témoins',
    EtapeMariage.recapitulatif: 'Récapitulatif',
  };

  Widget _corps(EtapeMariage etape) => switch (etape) {
        EtapeMariage.mariage => const StepMariage(),
        EtapeMariage.epoux => const StepEpoux(),
        EtapeMariage.epouse => const StepEpouse(),
        EtapeMariage.parents => const StepParentsMariage(),
        EtapeMariage.temoins => const StepTemoins(),
        EtapeMariage.recapitulatif => const StepRecapitulatifMariage(),
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(declarationMariageControllerProvider);
    final ctrl = ref.read(declarationMariageControllerProvider.notifier);

    ref.listen(declarationMariageControllerProvider, (prev, next) {
      if (next.statut == StatutEnvoi.succes && prev?.statut != StatutEnvoi.succes) {
        _afficherSucces(context, ctrl, next);
      } else if (next.statut == StatutEnvoi.echec && next.echec != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.echec!.message)),
        );
      }
    });

    final etapes = EtapeMariage.values;
    final indexCourant = state.etape.index;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Déclaration de mariage'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(value: (indexCourant + 1) / etapes.length),
        ),
      ),
      body: ArmoiriesBackground(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Étape ${indexCourant + 1}/${etapes.length} — ${_titres[state.etape]}',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            Expanded(child: _corps(state.etape)),
          ],
        ),
      ),
      bottomNavigationBar: _BarreNavigation(state: state, ctrl: ctrl),
    );
  }

  void _afficherSucces(
    BuildContext context,
    DeclarationMariageController ctrl,
    DeclarationMariageState state,
  ) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        icon: const Icon(Icons.check_circle, color: Colors.green, size: 48),
        title: const Text('Déclaration enregistrée'),
        content: Text(
          'La déclaration de mariage a été soumise et est en attente de validation.\n'
          'Référence : ${state.resultat?.id ?? '—'}',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              ctrl.reinitialiser();
            },
            child: const Text('Nouvelle déclaration'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              Navigator.of(context).maybePop();
            },
            child: const Text('Terminer'),
          ),
        ],
      ),
    );
  }
}

class _BarreNavigation extends StatelessWidget {
  const _BarreNavigation({required this.state, required this.ctrl});

  final DeclarationMariageState state;
  final DeclarationMariageController ctrl;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            if (!state.estPremiereEtape)
              Expanded(
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Précédent'),
                  onPressed: state.enChargement ? null : ctrl.etapePrecedente,
                ),
              ),
            if (!state.estPremiereEtape) const SizedBox(width: 12),
            Expanded(
              child: state.estDerniereEtape
                  ? FilledButton.icon(
                      icon: state.enChargement
                          ? const SizedBox(
                              width: 18, height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2))
                          : const Icon(Icons.send),
                      label: const Text('Soumettre'),
                      onPressed: state.enChargement ? null : ctrl.soumettre,
                    )
                  : FilledButton.icon(
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('Suivant'),
                      onPressed: ctrl.etapeSuivante,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/widgets/armoiries_background.dart';
import '../controllers/declaration_deces_controller.dart';
import '../state/declaration_deces_state.dart';
import 'steps/step_circonstances.dart';
import 'steps/step_declarant.dart';
import 'steps/step_defunt.dart';
import 'steps/step_filiation.dart';
import 'steps/step_recapitulatif_deces.dart';

/// Assistant de déclaration de décès (5 étapes).
class DeclarationDecesScreen extends ConsumerWidget {
  const DeclarationDecesScreen({super.key});

  static const routeName = 'declaration-deces';
  static const routePath = '/declarations/deces';

  static const _titres = {
    EtapeDeces.defunt: 'Défunt',
    EtapeDeces.circonstances: 'Décès',
    EtapeDeces.filiation: 'Filiation',
    EtapeDeces.declarant: 'Déclarant',
    EtapeDeces.recapitulatif: 'Récapitulatif',
  };

  Widget _corps(EtapeDeces etape) => switch (etape) {
        EtapeDeces.defunt => const StepDefunt(),
        EtapeDeces.circonstances => const StepCirconstances(),
        EtapeDeces.filiation => const StepFiliation(),
        EtapeDeces.declarant => const StepDeclarant(),
        EtapeDeces.recapitulatif => const StepRecapitulatifDeces(),
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(declarationDecesControllerProvider);
    final ctrl = ref.read(declarationDecesControllerProvider.notifier);

    ref.listen(declarationDecesControllerProvider, (prev, next) {
      if (next.statut == StatutEnvoi.succes && prev?.statut != StatutEnvoi.succes) {
        _afficherSucces(context, ctrl, next);
      } else if (next.statut == StatutEnvoi.echec && next.echec != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.echec!.message)),
        );
      }
    });

    final etapes = EtapeDeces.values;
    final indexCourant = state.etape.index;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Déclaration de décès'),
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
    DeclarationDecesController ctrl,
    DeclarationDecesState state,
  ) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        icon: const Icon(Icons.check_circle, color: Colors.green, size: 48),
        title: const Text('Déclaration enregistrée'),
        content: Text(
          'La déclaration de décès a été soumise et est en attente de validation.\n'
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

  final DeclarationDecesState state;
  final DeclarationDecesController ctrl;

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

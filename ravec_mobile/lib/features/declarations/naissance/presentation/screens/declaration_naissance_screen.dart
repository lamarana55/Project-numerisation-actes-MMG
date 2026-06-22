import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/widgets/armoiries_background.dart';
import '../controllers/declaration_naissance_controller.dart';
import '../state/declaration_naissance_state.dart';
import 'steps/step_geolocalisation.dart';
import 'steps/step_nouveau_ne.dart';
import 'steps/step_parents.dart';
import 'steps/step_pieces_jointes.dart';
import 'steps/step_recapitulatif.dart';

/// Assistant de déclaration de naissance (5 étapes).
class DeclarationNaissanceScreen extends ConsumerWidget {
  const DeclarationNaissanceScreen({super.key});

  static const routeName = 'declaration-naissance';
  static const routePath = '/declarations/naissance';

  static const _titres = {
    EtapeDeclaration.nouveauNe: 'Nouveau-né',
    EtapeDeclaration.parents: 'Parents',
    EtapeDeclaration.piecesJointes: 'Pièces jointes',
    EtapeDeclaration.geolocalisation: 'Géolocalisation',
    EtapeDeclaration.recapitulatif: 'Récapitulatif',
  };

  Widget _corps(EtapeDeclaration etape) => switch (etape) {
        EtapeDeclaration.nouveauNe => const StepNouveauNe(),
        EtapeDeclaration.parents => const StepParents(),
        EtapeDeclaration.piecesJointes => const StepPiecesJointes(),
        EtapeDeclaration.geolocalisation => const StepGeolocalisation(),
        EtapeDeclaration.recapitulatif => const StepRecapitulatif(),
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(declarationNaissanceControllerProvider);
    final ctrl = ref.read(declarationNaissanceControllerProvider.notifier);

    // Réactions aux transitions de statut (succès / échec).
    ref.listen(declarationNaissanceControllerProvider, (prev, next) {
      if (next.statut == StatutEnvoi.succes && prev?.statut != StatutEnvoi.succes) {
        _afficherSucces(context, ctrl, next);
      } else if (next.statut == StatutEnvoi.echec && next.echec != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.echec!.message)),
        );
      }
    });

    final etapes = EtapeDeclaration.values;
    final indexCourant = state.etape.index;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Déclaration de naissance'),
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
    DeclarationNaissanceController ctrl,
    DeclarationNaissanceState state,
  ) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        icon: const Icon(Icons.check_circle, color: Colors.green, size: 48),
        title: const Text('Déclaration enregistrée'),
        content: Text(
          'La déclaration a été soumise et est en attente de validation.\n'
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

  final DeclarationNaissanceState state;
  final DeclarationNaissanceController ctrl;

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

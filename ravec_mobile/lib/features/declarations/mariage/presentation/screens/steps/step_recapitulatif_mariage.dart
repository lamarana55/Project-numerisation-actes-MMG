import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/utils/date_formatter.dart';
import '../../controllers/declaration_mariage_controller.dart';

/// Étape 6 — Récapitulatif avant envoi.
class StepRecapitulatifMariage extends ConsumerWidget {
  const StepRecapitulatifMariage({super.key});

  String _nomComplet(String? prenom, String? nom) {
    final s = '${prenom ?? ''} ${nom ?? ''}'.trim();
    return s.isEmpty ? '—' : s;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final d = ref.watch(declarationMariageControllerProvider).declaration;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _Section(titre: 'Mariage', lignes: {
          'Date': DateFormatter.toAffichage(d.mariage.dateMariage),
          'Type': d.mariage.typeMariage?.value ?? '—',
          'Lieu': d.mariage.lieuMariage ?? '—',
          'Commune': d.mariage.communeMariage ?? '—',
        }),
        _Section(titre: 'Époux', lignes: {
          'Nom': _nomComplet(d.epoux.prenom, d.epoux.nom),
          'NPI': d.epoux.npi ?? '—',
          'Profession': d.epoux.profession ?? '—',
        }),
        _Section(titre: 'Épouse', lignes: {
          'Nom': _nomComplet(d.epouse.prenom, d.epouse.nom),
          'NPI': d.epouse.npi ?? '—',
          'Profession': d.epouse.profession ?? '—',
        }),
        _Section(titre: 'Témoins', lignes: {
          'Témoin 1': _nomComplet(d.temoin1.prenom, d.temoin1.nom),
          'Témoin 2': _nomComplet(d.temoin2.prenom, d.temoin2.nom),
        }),
      ],
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.titre, required this.lignes});

  final String titre;
  final Map<String, String> lignes;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titre, style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            ...lignes.entries.map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 120, child: Text(e.key, style: const TextStyle(color: Colors.grey))),
                    Expanded(child: Text(e.value)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

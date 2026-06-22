import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/utils/date_formatter.dart';
import '../../controllers/declaration_naissance_controller.dart';

/// Étape 5 — Récapitulatif avant envoi.
class StepRecapitulatif extends ConsumerWidget {
  const StepRecapitulatif({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final d = ref.watch(declarationNaissanceControllerProvider).declaration;
    final ne = d.nouveauNe;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _Section(titre: 'Nouveau-né', lignes: {
          'Prénom': ne.prenom ?? '—',
          'Nom': ne.nom ?? '—',
          'Sexe': ne.sexe?.value ?? '—',
          'Date de naissance': DateFormatter.toAffichage(ne.dateNaissance),
          'Lieu d\'accouchement': ne.lieuAccouchement ?? '—',
        }),
        _Section(titre: 'Mère', lignes: {
          'Prénom': d.mere.prenom ?? '—',
          'Nom': d.mere.nom ?? '—',
          'NPI': d.mere.npi ?? '—',
        }),
        _Section(titre: 'Père', lignes: {
          'Prénom': d.pere.prenom ?? '—',
          'Nom': d.pere.nom ?? '—',
          'NPI': d.pere.npi ?? '—',
        }),
        _Section(titre: 'Pièces jointes', lignes: {
          'Nombre': '${d.pieces.length}',
        }),
        _Section(titre: 'Géolocalisation', lignes: {
          'Adresse': d.geolocalisation.adresseLieu ?? '—',
          'GPS': d.geolocalisation.latitude == null
              ? 'Non capturé'
              : '${d.geolocalisation.latitude!.toStringAsFixed(5)}, '
                  '${d.geolocalisation.longitude!.toStringAsFixed(5)}',
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
                    SizedBox(width: 160, child: Text(e.key, style: const TextStyle(color: Colors.grey))),
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/utils/date_formatter.dart';
import '../../controllers/declaration_deces_controller.dart';

/// Étape 5 — Récapitulatif avant envoi.
class StepRecapitulatifDeces extends ConsumerWidget {
  const StepRecapitulatifDeces({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final d = ref.watch(declarationDecesControllerProvider).declaration;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _Section(titre: 'Défunt', lignes: {
          'Prénom': d.defunt.prenom ?? '—',
          'Nom': d.defunt.nom ?? '—',
          'Sexe': d.defunt.sexe?.value ?? '—',
          'Date de naissance': DateFormatter.toAffichage(d.defunt.dateNaissance),
        }),
        _Section(titre: 'Décès', lignes: {
          'Date': DateFormatter.toAffichage(d.deces.dateDeces),
          'Heure': d.deces.heureDeces ?? '—',
          'Lieu': d.deces.lieuDeces ?? '—',
          'Cause': d.deces.causeDeces ?? '—',
        }),
        _Section(titre: 'Filiation', lignes: {
          'Père': '${d.pere.prenom ?? ''} ${d.pere.nom ?? ''}'.trim().isEmpty ? '—' : '${d.pere.prenom ?? ''} ${d.pere.nom ?? ''}',
          'Mère': '${d.mere.prenom ?? ''} ${d.mere.nom ?? ''}'.trim().isEmpty ? '—' : '${d.mere.prenom ?? ''} ${d.mere.nom ?? ''}',
          'Conjoint': d.conjoint.connu ? '${d.conjoint.prenom ?? ''} ${d.conjoint.nom ?? ''}' : 'Non',
        }),
        _Section(titre: 'Déclarant', lignes: {
          'Nom': '${d.declarant.prenom ?? ''} ${d.declarant.nom ?? ''}',
          'Qualité': d.declarant.qualite ?? '—',
          'Lien': d.declarant.lienAvecDefunt ?? '—',
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
                    SizedBox(width: 140, child: Text(e.key, style: const TextStyle(color: Colors.grey))),
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

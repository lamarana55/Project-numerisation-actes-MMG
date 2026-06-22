import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/utils/date_formatter.dart';
import '../../../domain/entities/declaration_naissance.dart';
import '../../controllers/declaration_naissance_controller.dart';
import '../../widgets/ravec_text_field.dart';

/// Étape 1 — Informations du nouveau-né.
class StepNouveauNe extends ConsumerStatefulWidget {
  const StepNouveauNe({super.key});

  @override
  ConsumerState<StepNouveauNe> createState() => _StepNouveauNeState();
}

class _StepNouveauNeState extends ConsumerState<StepNouveauNe> {
  late final TextEditingController _prenom;
  late final TextEditingController _nom;
  late final TextEditingController _heure;
  late final TextEditingController _lieu;
  late final TextEditingController _formation;
  late final TextEditingController _rang;

  @override
  void initState() {
    super.initState();
    final n = ref.read(declarationNaissanceControllerProvider).declaration.nouveauNe;
    _prenom = TextEditingController(text: n.prenom);
    _nom = TextEditingController(text: n.nom);
    _heure = TextEditingController(text: n.heureNaissance);
    _lieu = TextEditingController(text: n.lieuAccouchement);
    _formation = TextEditingController(text: n.formationSanitaire);
    _rang = TextEditingController(text: n.rangEnfant?.toString());
  }

  @override
  void dispose() {
    for (final c in [_prenom, _nom, _heure, _lieu, _formation, _rang]) {
      c.dispose();
    }
    super.dispose();
  }

  DeclarationNaissanceController get _ctrl =>
      ref.read(declarationNaissanceControllerProvider.notifier);
  NouveauNe get _ne => ref.read(declarationNaissanceControllerProvider).declaration.nouveauNe;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(declarationNaissanceControllerProvider);
    final ne = state.declaration.nouveauNe;
    final err = state.erreurs;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Informations du nouveau-né', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        RavecTextField(
          label: 'Prénom',
          controller: _prenom,
          errorText: err['prenom'],
          onChanged: (v) => _ctrl.majNouveauNe(_ne.copyWith(prenom: v)),
        ),
        RavecTextField(
          label: 'Nom',
          controller: _nom,
          errorText: err['nom'],
          onChanged: (v) => _ctrl.majNouveauNe(_ne.copyWith(nom: v)),
        ),
        const SizedBox(height: 8),
        Text('Sexe', style: Theme.of(context).textTheme.labelLarge),
        SegmentedButton<Sexe>(
          segments: const [
            ButtonSegment(value: Sexe.masculin, label: Text('Masculin')),
            ButtonSegment(value: Sexe.feminin, label: Text('Féminin')),
          ],
          selected: ne.sexe == null ? <Sexe>{} : {ne.sexe!},
          emptySelectionAllowed: true,
          onSelectionChanged: (s) =>
              _ctrl.majNouveauNe(_ne.copyWith(sexe: s.isEmpty ? null : s.first)),
        ),
        if (err['sexe'] != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(err['sexe']!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ),
        const SizedBox(height: 12),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Date de naissance'),
          subtitle: Text(DateFormatter.toAffichage(ne.dateNaissance)),
          trailing: const Icon(Icons.calendar_today),
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: ne.dateNaissance ?? DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (date != null) _ctrl.majNouveauNe(_ne.copyWith(dateNaissance: date));
          },
        ),
        if (err['dateNaissance'] != null)
          Text(err['dateNaissance']!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
        RavecTextField(
          label: 'Heure de naissance',
          controller: _heure,
          hint: 'ex: 14:30',
          onChanged: (v) => _ctrl.majNouveauNe(_ne.copyWith(heureNaissance: v)),
        ),
        RavecTextField(
          label: 'Lieu d\'accouchement',
          controller: _lieu,
          onChanged: (v) => _ctrl.majNouveauNe(_ne.copyWith(lieuAccouchement: v)),
        ),
        RavecTextField(
          label: 'Formation sanitaire',
          controller: _formation,
          onChanged: (v) => _ctrl.majNouveauNe(_ne.copyWith(formationSanitaire: v)),
        ),
        RavecTextField(
          label: 'Rang de l\'enfant',
          controller: _rang,
          keyboardType: TextInputType.number,
          onChanged: (v) => _ctrl.majNouveauNe(_ne.copyWith(rangEnfant: int.tryParse(v))),
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Naissance multiple'),
          value: ne.naissanceMultiple,
          onChanged: (v) => _ctrl.majNouveauNe(_ne.copyWith(naissanceMultiple: v)),
        ),
      ],
    );
  }
}

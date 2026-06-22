import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/utils/date_formatter.dart';
import '../../../../../../shared/widgets/ravec_text_field.dart';
import '../../../domain/entities/declaration_deces.dart';
import '../../controllers/declaration_deces_controller.dart';

/// Étape 1 — Informations du défunt.
class StepDefunt extends ConsumerStatefulWidget {
  const StepDefunt({super.key});

  @override
  ConsumerState<StepDefunt> createState() => _StepDefuntState();
}

class _StepDefuntState extends ConsumerState<StepDefunt> {
  late final TextEditingController _prenom;
  late final TextEditingController _nom;
  late final TextEditingController _nationalite;
  late final TextEditingController _profession;

  @override
  void initState() {
    super.initState();
    final d = ref.read(declarationDecesControllerProvider).declaration.defunt;
    _prenom = TextEditingController(text: d.prenom);
    _nom = TextEditingController(text: d.nom);
    _nationalite = TextEditingController(text: d.nationalite);
    _profession = TextEditingController(text: d.profession);
  }

  @override
  void dispose() {
    for (final c in [_prenom, _nom, _nationalite, _profession]) {
      c.dispose();
    }
    super.dispose();
  }

  DeclarationDecesController get _ctrl =>
      ref.read(declarationDecesControllerProvider.notifier);
  Defunt get _d => ref.read(declarationDecesControllerProvider).declaration.defunt;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(declarationDecesControllerProvider);
    final d = state.declaration.defunt;
    final err = state.erreurs;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Informations du défunt', style: Theme.of(context).textTheme.titleMedium),
        RavecTextField(
          label: 'Prénom *',
          controller: _prenom,
          errorText: err['prenomDefunt'],
          onChanged: (v) => _ctrl.majDefunt(_d.copyWith(prenom: v)),
        ),
        RavecTextField(
          label: 'Nom *',
          controller: _nom,
          errorText: err['nomDefunt'],
          onChanged: (v) => _ctrl.majDefunt(_d.copyWith(nom: v)),
        ),
        const SizedBox(height: 8),
        Text('Sexe *', style: Theme.of(context).textTheme.labelLarge),
        SegmentedButton<Sexe>(
          segments: const [
            ButtonSegment(value: Sexe.masculin, label: Text('Masculin')),
            ButtonSegment(value: Sexe.feminin, label: Text('Féminin')),
          ],
          selected: d.sexe == null ? <Sexe>{} : {d.sexe!},
          emptySelectionAllowed: true,
          onSelectionChanged: (s) =>
              _ctrl.majDefunt(_d.copyWith(sexe: s.isEmpty ? null : s.first)),
        ),
        if (err['sexeDefunt'] != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(err['sexeDefunt']!,
                style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Date de naissance'),
          subtitle: Text(DateFormatter.toAffichage(d.dateNaissance)),
          trailing: const Icon(Icons.calendar_today),
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: d.dateNaissance ?? DateTime(1980),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (date != null) _ctrl.majDefunt(_d.copyWith(dateNaissance: date));
          },
        ),
        RavecTextField(
          label: 'Nationalité',
          controller: _nationalite,
          onChanged: (v) => _ctrl.majDefunt(_d.copyWith(nationalite: v)),
        ),
        RavecTextField(
          label: 'Profession',
          controller: _profession,
          onChanged: (v) => _ctrl.majDefunt(_d.copyWith(profession: v)),
        ),
      ],
    );
  }
}

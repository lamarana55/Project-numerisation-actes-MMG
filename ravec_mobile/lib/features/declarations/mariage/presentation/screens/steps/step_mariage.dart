import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/utils/date_formatter.dart';
import '../../../../../../shared/widgets/ravec_text_field.dart';
import '../../../domain/entities/declaration_mariage.dart';
import '../../controllers/declaration_mariage_controller.dart';

/// Étape 1 — Informations du mariage.
class StepMariage extends ConsumerStatefulWidget {
  const StepMariage({super.key});

  @override
  ConsumerState<StepMariage> createState() => _StepMariageState();
}

class _StepMariageState extends ConsumerState<StepMariage> {
  late final TextEditingController _heure;
  late final TextEditingController _lieu;
  late final TextEditingController _commune;
  late final TextEditingController _regime;

  @override
  void initState() {
    super.initState();
    final m = ref.read(declarationMariageControllerProvider).declaration.mariage;
    _heure = TextEditingController(text: m.heureMariage);
    _lieu = TextEditingController(text: m.lieuMariage);
    _commune = TextEditingController(text: m.communeMariage);
    _regime = TextEditingController(text: m.regimeMatrimonial);
  }

  @override
  void dispose() {
    for (final c in [_heure, _lieu, _commune, _regime]) {
      c.dispose();
    }
    super.dispose();
  }

  DeclarationMariageController get _ctrl =>
      ref.read(declarationMariageControllerProvider.notifier);
  InfosMariage get _m =>
      ref.read(declarationMariageControllerProvider).declaration.mariage;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(declarationMariageControllerProvider);
    final m = state.declaration.mariage;
    final err = state.erreurs;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Informations du mariage', style: Theme.of(context).textTheme.titleMedium),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Date du mariage'),
          subtitle: Text(DateFormatter.toAffichage(m.dateMariage)),
          trailing: const Icon(Icons.calendar_today),
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: m.dateMariage ?? DateTime.now(),
              firstDate: DateTime(1950),
              lastDate: DateTime.now(),
            );
            if (date != null) _ctrl.majMariage(_m.copyWith(dateMariage: date));
          },
        ),
        if (err['dateMariage'] != null)
          Text(err['dateMariage']!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
        RavecTextField(label: 'Heure du mariage', controller: _heure, hint: 'ex: 11:00', onChanged: (v) => _ctrl.majMariage(_m.copyWith(heureMariage: v))),
        const SizedBox(height: 8),
        Text('Type de mariage', style: Theme.of(context).textTheme.labelLarge),
        SegmentedButton<TypeMariage>(
          segments: const [
            ButtonSegment(value: TypeMariage.civil, label: Text('Civil')),
            ButtonSegment(value: TypeMariage.religieux, label: Text('Religieux')),
            ButtonSegment(value: TypeMariage.coutumier, label: Text('Coutumier')),
          ],
          selected: m.typeMariage == null ? <TypeMariage>{} : {m.typeMariage!},
          emptySelectionAllowed: true,
          onSelectionChanged: (s) => _ctrl.majMariage(_m.copyWith(typeMariage: s.isEmpty ? null : s.first)),
        ),
        RavecTextField(label: 'Lieu du mariage', controller: _lieu, onChanged: (v) => _ctrl.majMariage(_m.copyWith(lieuMariage: v))),
        RavecTextField(label: 'Commune du mariage', controller: _commune, onChanged: (v) => _ctrl.majMariage(_m.copyWith(communeMariage: v))),
        RavecTextField(label: 'Régime matrimonial', controller: _regime, hint: 'monogamie, polygamie…', onChanged: (v) => _ctrl.majMariage(_m.copyWith(regimeMatrimonial: v))),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/utils/date_formatter.dart';
import '../../../../../../shared/widgets/ravec_text_field.dart';
import '../../../domain/entities/declaration_deces.dart';
import '../../controllers/declaration_deces_controller.dart';

/// Étape 2 — Circonstances du décès.
class StepCirconstances extends ConsumerStatefulWidget {
  const StepCirconstances({super.key});

  @override
  ConsumerState<StepCirconstances> createState() => _StepCirconstancesState();
}

class _StepCirconstancesState extends ConsumerState<StepCirconstances> {
  late final TextEditingController _heure;
  late final TextEditingController _lieu;
  late final TextEditingController _cause;
  late final TextEditingController _type;

  @override
  void initState() {
    super.initState();
    final d = ref.read(declarationDecesControllerProvider).declaration.deces;
    _heure = TextEditingController(text: d.heureDeces);
    _lieu = TextEditingController(text: d.lieuDeces);
    _cause = TextEditingController(text: d.causeDeces);
    _type = TextEditingController(text: d.typeDeces);
  }

  @override
  void dispose() {
    for (final c in [_heure, _lieu, _cause, _type]) {
      c.dispose();
    }
    super.dispose();
  }

  DeclarationDecesController get _ctrl =>
      ref.read(declarationDecesControllerProvider.notifier);
  InformationsDeces get _d =>
      ref.read(declarationDecesControllerProvider).declaration.deces;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(declarationDecesControllerProvider);
    final d = state.declaration.deces;
    final err = state.erreurs;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Circonstances du décès', style: Theme.of(context).textTheme.titleMedium),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Date de décès *'),
          subtitle: Text(DateFormatter.toAffichage(d.dateDeces)),
          trailing: const Icon(Icons.calendar_today),
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: d.dateDeces ?? DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (date != null) _ctrl.majDeces(_d.copyWith(dateDeces: date));
          },
        ),
        if (err['dateDeces'] != null)
          Text(err['dateDeces']!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
        RavecTextField(
          label: 'Heure de décès',
          controller: _heure,
          hint: 'ex: 06:15',
          onChanged: (v) => _ctrl.majDeces(_d.copyWith(heureDeces: v)),
        ),
        RavecTextField(
          label: 'Lieu de décès',
          controller: _lieu,
          onChanged: (v) => _ctrl.majDeces(_d.copyWith(lieuDeces: v)),
        ),
        RavecTextField(
          label: 'Cause du décès',
          controller: _cause,
          hint: 'Réf. /causes-deces (saisie libre pour l\'instant)',
          onChanged: (v) => _ctrl.majDeces(_d.copyWith(causeDeces: v)),
        ),
        RavecTextField(
          label: 'Type de décès',
          controller: _type,
          hint: 'ex: naturel, accidentel…',
          onChanged: (v) => _ctrl.majDeces(_d.copyWith(typeDeces: v)),
        ),
      ],
    );
  }
}

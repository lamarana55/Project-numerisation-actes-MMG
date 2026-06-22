import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show FilteringTextInputFormatter;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../shared/widgets/ravec_text_field.dart';
import '../../../domain/entities/declaration_deces.dart';
import '../../controllers/declaration_deces_controller.dart';

/// Étape 4 — Déclarant.
class StepDeclarant extends ConsumerStatefulWidget {
  const StepDeclarant({super.key});

  @override
  ConsumerState<StepDeclarant> createState() => _StepDeclarantState();
}

class _StepDeclarantState extends ConsumerState<StepDeclarant> {
  late final TextEditingController _qualite;
  late final TextEditingController _prenom;
  late final TextEditingController _nom;
  late final TextEditingController _telephone;
  late final TextEditingController _lien;

  @override
  void initState() {
    super.initState();
    final d = ref.read(declarationDecesControllerProvider).declaration.declarant;
    _qualite = TextEditingController(text: d.qualite);
    _prenom = TextEditingController(text: d.prenom);
    _nom = TextEditingController(text: d.nom);
    _telephone = TextEditingController(text: d.telephone);
    _lien = TextEditingController(text: d.lienAvecDefunt);
  }

  @override
  void dispose() {
    for (final c in [_qualite, _prenom, _nom, _telephone, _lien]) {
      c.dispose();
    }
    super.dispose();
  }

  DeclarationDecesController get _ctrl =>
      ref.read(declarationDecesControllerProvider.notifier);
  DeclarantDeces get _d =>
      ref.read(declarationDecesControllerProvider).declaration.declarant;

  @override
  Widget build(BuildContext context) {
    final d = ref.watch(declarationDecesControllerProvider).declaration.declarant;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Déclarant', style: Theme.of(context).textTheme.titleMedium),
        RavecTextField(
          label: 'Qualité',
          controller: _qualite,
          hint: 'ex: agent de santé, parent…',
          onChanged: (v) => _ctrl.majDeclarant(_d.copyWith(qualite: v)),
        ),
        RavecTextField(label: 'Prénom', controller: _prenom, onChanged: (v) => _ctrl.majDeclarant(_d.copyWith(prenom: v))),
        RavecTextField(label: 'Nom', controller: _nom, onChanged: (v) => _ctrl.majDeclarant(_d.copyWith(nom: v))),
        RavecTextField(
          label: 'Téléphone',
          controller: _telephone,
          keyboardType: TextInputType.phone,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (v) => _ctrl.majDeclarant(_d.copyWith(telephone: v)),
        ),
        RavecTextField(
          label: 'Lien avec le défunt',
          controller: _lien,
          hint: 'ex: fils, épouse, voisin…',
          onChanged: (v) => _ctrl.majDeclarant(_d.copyWith(lienAvecDefunt: v)),
        ),
        const SizedBox(height: 8),
        Text('Sexe du déclarant', style: Theme.of(context).textTheme.labelLarge),
        SegmentedButton<Sexe>(
          segments: const [
            ButtonSegment(value: Sexe.masculin, label: Text('Masculin')),
            ButtonSegment(value: Sexe.feminin, label: Text('Féminin')),
          ],
          selected: d.sexe == null ? <Sexe>{} : {d.sexe!},
          emptySelectionAllowed: true,
          onSelectionChanged: (s) =>
              _ctrl.majDeclarant(_d.copyWith(sexe: s.isEmpty ? null : s.first)),
        ),
      ],
    );
  }
}

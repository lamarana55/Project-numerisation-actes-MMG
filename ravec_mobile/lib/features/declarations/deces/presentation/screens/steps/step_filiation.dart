import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../shared/widgets/ravec_text_field.dart';
import '../../../domain/entities/declaration_deces.dart';
import '../../controllers/declaration_deces_controller.dart';

/// Étape 3 — Filiation (père, mère) et conjoint(e) du défunt.
class StepFiliation extends ConsumerWidget {
  const StepFiliation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(declarationDecesControllerProvider);
    final ctrl = ref.read(declarationDecesControllerProvider.notifier);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _ParentSection(titre: 'Père du défunt', initial: state.declaration.pere, onChanged: ctrl.majPere),
        const Divider(height: 32),
        _ParentSection(titre: 'Mère du défunt', initial: state.declaration.mere, onChanged: ctrl.majMere),
        const Divider(height: 32),
        _ConjointSection(initial: state.declaration.conjoint, onChanged: ctrl.majConjoint),
      ],
    );
  }
}

class _ParentSection extends StatefulWidget {
  const _ParentSection({required this.titre, required this.initial, required this.onChanged});

  final String titre;
  final ParentDefunt initial;
  final ValueChanged<ParentDefunt> onChanged;

  @override
  State<_ParentSection> createState() => _ParentSectionState();
}

class _ParentSectionState extends State<_ParentSection> {
  late ParentDefunt _p;
  late final TextEditingController _prenom;
  late final TextEditingController _nom;
  late final TextEditingController _nationalite;
  late final TextEditingController _profession;

  @override
  void initState() {
    super.initState();
    _p = widget.initial;
    _prenom = TextEditingController(text: _p.prenom);
    _nom = TextEditingController(text: _p.nom);
    _nationalite = TextEditingController(text: _p.nationalite);
    _profession = TextEditingController(text: _p.profession);
  }

  @override
  void dispose() {
    for (final c in [_prenom, _nom, _nationalite, _profession]) {
      c.dispose();
    }
    super.dispose();
  }

  void _maj(ParentDefunt p) {
    setState(() => _p = p);
    widget.onChanged(p);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.titre, style: Theme.of(context).textTheme.titleMedium),
        RavecTextField(label: 'Prénom', controller: _prenom, onChanged: (v) => _maj(_p.copyWith(prenom: v))),
        RavecTextField(label: 'Nom', controller: _nom, onChanged: (v) => _maj(_p.copyWith(nom: v))),
        RavecTextField(label: 'Nationalité', controller: _nationalite, onChanged: (v) => _maj(_p.copyWith(nationalite: v))),
        RavecTextField(label: 'Profession', controller: _profession, onChanged: (v) => _maj(_p.copyWith(profession: v))),
      ],
    );
  }
}

class _ConjointSection extends StatefulWidget {
  const _ConjointSection({required this.initial, required this.onChanged});

  final Conjoint initial;
  final ValueChanged<Conjoint> onChanged;

  @override
  State<_ConjointSection> createState() => _ConjointSectionState();
}

class _ConjointSectionState extends State<_ConjointSection> {
  late Conjoint _c;
  late final TextEditingController _prenom;
  late final TextEditingController _nom;
  late final TextEditingController _nationalite;
  late final TextEditingController _profession;

  @override
  void initState() {
    super.initState();
    _c = widget.initial;
    _prenom = TextEditingController(text: _c.prenom);
    _nom = TextEditingController(text: _c.nom);
    _nationalite = TextEditingController(text: _c.nationalite);
    _profession = TextEditingController(text: _c.profession);
  }

  @override
  void dispose() {
    for (final c in [_prenom, _nom, _nationalite, _profession]) {
      c.dispose();
    }
    super.dispose();
  }

  void _maj(Conjoint c) {
    setState(() => _c = c);
    widget.onChanged(c);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Conjoint(e)', style: Theme.of(context).textTheme.titleMedium),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Conjoint connu'),
          value: _c.connu,
          onChanged: (v) => _maj(_c.copyWith(connu: v)),
        ),
        if (_c.connu) ...[
          RavecTextField(label: 'Prénom', controller: _prenom, onChanged: (v) => _maj(_c.copyWith(prenom: v))),
          RavecTextField(label: 'Nom', controller: _nom, onChanged: (v) => _maj(_c.copyWith(nom: v))),
          RavecTextField(label: 'Nationalité', controller: _nationalite, onChanged: (v) => _maj(_c.copyWith(nationalite: v))),
          RavecTextField(label: 'Profession', controller: _profession, onChanged: (v) => _maj(_c.copyWith(profession: v))),
        ],
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../shared/widgets/ravec_text_field.dart';
import '../../domain/entities/declaration_mariage.dart';

/// Section de saisie d'un parent (père/mère d'un époux).
class ParentMariageSection extends StatefulWidget {
  const ParentMariageSection({
    super.key,
    required this.titre,
    required this.initial,
    required this.onChanged,
  });

  final String titre;
  final ParentMariage initial;
  final ValueChanged<ParentMariage> onChanged;

  @override
  State<ParentMariageSection> createState() => _ParentMariageSectionState();
}

class _ParentMariageSectionState extends State<ParentMariageSection> {
  late ParentMariage _p;
  late final TextEditingController _prenom;
  late final TextEditingController _nom;
  late final TextEditingController _profession;
  late final TextEditingController _nationalite;

  @override
  void initState() {
    super.initState();
    _p = widget.initial;
    _prenom = TextEditingController(text: _p.prenom);
    _nom = TextEditingController(text: _p.nom);
    _profession = TextEditingController(text: _p.profession);
    _nationalite = TextEditingController(text: _p.nationalite);
  }

  @override
  void dispose() {
    for (final c in [_prenom, _nom, _profession, _nationalite]) {
      c.dispose();
    }
    super.dispose();
  }

  void _maj(ParentMariage p) {
    setState(() => _p = p);
    widget.onChanged(p);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.titre, style: Theme.of(context).textTheme.titleSmall),
        RavecTextField(label: 'Prénom', controller: _prenom, onChanged: (v) => _maj(_p.copyWith(prenom: v))),
        RavecTextField(label: 'Nom', controller: _nom, onChanged: (v) => _maj(_p.copyWith(nom: v))),
        RavecTextField(label: 'Profession', controller: _profession, onChanged: (v) => _maj(_p.copyWith(profession: v))),
        RavecTextField(label: 'Nationalité', controller: _nationalite, onChanged: (v) => _maj(_p.copyWith(nationalite: v))),
      ],
    );
  }
}

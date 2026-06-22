import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show FilteringTextInputFormatter;

import '../../../../../shared/widgets/ravec_text_field.dart';
import '../../domain/entities/declaration_mariage.dart';

/// Section de saisie d'un témoin.
class TemoinForm extends StatefulWidget {
  const TemoinForm({
    super.key,
    required this.titre,
    required this.initial,
    required this.onChanged,
  });

  final String titre;
  final Temoin initial;
  final ValueChanged<Temoin> onChanged;

  @override
  State<TemoinForm> createState() => _TemoinFormState();
}

class _TemoinFormState extends State<TemoinForm> {
  late Temoin _t;
  late final TextEditingController _prenom;
  late final TextEditingController _nom;
  late final TextEditingController _profession;
  late final TextEditingController _telephone;
  late final TextEditingController _npi;
  late final TextEditingController _adresse;

  @override
  void initState() {
    super.initState();
    _t = widget.initial;
    _prenom = TextEditingController(text: _t.prenom);
    _nom = TextEditingController(text: _t.nom);
    _profession = TextEditingController(text: _t.profession);
    _telephone = TextEditingController(text: _t.telephone);
    _npi = TextEditingController(text: _t.npi);
    _adresse = TextEditingController(text: _t.adresse);
  }

  @override
  void dispose() {
    for (final c in [_prenom, _nom, _profession, _telephone, _npi, _adresse]) {
      c.dispose();
    }
    super.dispose();
  }

  void _maj(Temoin t) {
    setState(() => _t = t);
    widget.onChanged(t);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.titre, style: Theme.of(context).textTheme.titleMedium),
        RavecTextField(label: 'Prénom', controller: _prenom, onChanged: (v) => _maj(_t.copyWith(prenom: v))),
        RavecTextField(label: 'Nom', controller: _nom, onChanged: (v) => _maj(_t.copyWith(nom: v))),
        const SizedBox(height: 8),
        Text('Sexe', style: Theme.of(context).textTheme.labelLarge),
        SegmentedButton<Sexe>(
          segments: const [
            ButtonSegment(value: Sexe.masculin, label: Text('Masculin')),
            ButtonSegment(value: Sexe.feminin, label: Text('Féminin')),
          ],
          selected: _t.sexe == null ? <Sexe>{} : {_t.sexe!},
          emptySelectionAllowed: true,
          onSelectionChanged: (s) => _maj(_t.copyWith(sexe: s.isEmpty ? null : s.first)),
        ),
        RavecTextField(label: 'Profession', controller: _profession, onChanged: (v) => _maj(_t.copyWith(profession: v))),
        RavecTextField(label: 'Téléphone', controller: _telephone, keyboardType: TextInputType.phone, inputFormatters: [FilteringTextInputFormatter.digitsOnly], onChanged: (v) => _maj(_t.copyWith(telephone: v))),
        RavecTextField(label: 'NPI', controller: _npi, onChanged: (v) => _maj(_t.copyWith(npi: v))),
        RavecTextField(label: 'Adresse', controller: _adresse, onChanged: (v) => _maj(_t.copyWith(adresse: v))),
      ],
    );
  }
}

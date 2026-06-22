import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show FilteringTextInputFormatter;

import '../../../../../core/utils/date_formatter.dart';
import '../../../../../shared/widgets/ravec_text_field.dart';
import '../../domain/entities/declaration_mariage.dart';

/// Formulaire d'identité d'un conjoint (époux ou épouse).
/// Préserve les parents (pere/mere) via copyWith.
class ConjointForm extends StatefulWidget {
  const ConjointForm({
    super.key,
    required this.titre,
    required this.initial,
    required this.onChanged,
  });

  final String titre;
  final Conjoint initial;
  final ValueChanged<Conjoint> onChanged;

  @override
  State<ConjointForm> createState() => _ConjointFormState();
}

class _ConjointFormState extends State<ConjointForm> {
  late Conjoint _c;
  late final Map<String, TextEditingController> _ctl;

  @override
  void initState() {
    super.initState();
    _c = widget.initial;
    _ctl = {
      'prenom': TextEditingController(text: _c.prenom),
      'nom': TextEditingController(text: _c.nom),
      'communeNaissance': TextEditingController(text: _c.communeNaissance),
      'nationalite': TextEditingController(text: _c.nationalite),
      'profession': TextEditingController(text: _c.profession),
      'telephone': TextEditingController(text: _c.telephone),
      'npi': TextEditingController(text: _c.npi),
      'adresse': TextEditingController(text: _c.adresse),
      'communeDomicile': TextEditingController(text: _c.communeDomicile),
      'quartierDomicile': TextEditingController(text: _c.quartierDomicile),
      'etatCivil': TextEditingController(text: _c.etatCivilAnterieur),
    };
  }

  @override
  void dispose() {
    for (final c in _ctl.values) {
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
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(widget.titre, style: Theme.of(context).textTheme.titleMedium),
        RavecTextField(label: 'NPI (si connu)', controller: _ctl['npi']!, onChanged: (v) => _maj(_c.copyWith(npi: v))),
        RavecTextField(label: 'Prénom', controller: _ctl['prenom']!, onChanged: (v) => _maj(_c.copyWith(prenom: v))),
        RavecTextField(label: 'Nom', controller: _ctl['nom']!, onChanged: (v) => _maj(_c.copyWith(nom: v))),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Date de naissance'),
          subtitle: Text(DateFormatter.toAffichage(_c.dateNaissance)),
          trailing: const Icon(Icons.calendar_today),
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: _c.dateNaissance ?? DateTime(1990),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (date != null) _maj(_c.copyWith(dateNaissance: date));
          },
        ),
        RavecTextField(label: 'Commune de naissance', controller: _ctl['communeNaissance']!, onChanged: (v) => _maj(_c.copyWith(communeNaissance: v))),
        RavecTextField(label: 'Nationalité', controller: _ctl['nationalite']!, onChanged: (v) => _maj(_c.copyWith(nationalite: v))),
        RavecTextField(label: 'Profession', controller: _ctl['profession']!, onChanged: (v) => _maj(_c.copyWith(profession: v))),
        RavecTextField(label: 'Téléphone', controller: _ctl['telephone']!, keyboardType: TextInputType.phone, inputFormatters: [FilteringTextInputFormatter.digitsOnly], onChanged: (v) => _maj(_c.copyWith(telephone: v))),
        RavecTextField(label: 'Adresse', controller: _ctl['adresse']!, onChanged: (v) => _maj(_c.copyWith(adresse: v))),
        RavecTextField(label: 'Commune de domicile', controller: _ctl['communeDomicile']!, onChanged: (v) => _maj(_c.copyWith(communeDomicile: v))),
        RavecTextField(label: 'Quartier de domicile', controller: _ctl['quartierDomicile']!, onChanged: (v) => _maj(_c.copyWith(quartierDomicile: v))),
        RavecTextField(label: 'État civil antérieur', controller: _ctl['etatCivil']!, hint: 'célibataire, divorcé(e), veuf(ve)…', onChanged: (v) => _maj(_c.copyWith(etatCivilAnterieur: v))),
      ],
    );
  }
}

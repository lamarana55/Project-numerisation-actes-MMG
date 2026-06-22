import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show FilteringTextInputFormatter;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../domain/entities/declaration_naissance.dart';
import '../../controllers/declaration_naissance_controller.dart';
import '../../widgets/ravec_text_field.dart';

/// Étape 2 — Informations des parents (mère & père).
class StepParents extends ConsumerWidget {
  const StepParents({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(declarationNaissanceControllerProvider);
    final ctrl = ref.read(declarationNaissanceControllerProvider.notifier);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (state.erreurs['parents'] != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(state.erreurs['parents']!,
                style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ),
        _ParentSection(
          titre: 'Mère',
          initial: state.declaration.mere,
          onChanged: ctrl.majMere,
        ),
        const Divider(height: 32),
        _ParentSection(
          titre: 'Père',
          initial: state.declaration.pere,
          onChanged: ctrl.majPere,
        ),
        const Divider(height: 32),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Parents mariés'),
          value: state.declaration.parentsMaries,
          onChanged: ctrl.majParentsMaries,
        ),
      ],
    );
  }
}

/// Section de saisie d'un parent (réutilisée pour mère et père).
class _ParentSection extends StatefulWidget {
  const _ParentSection({
    required this.titre,
    required this.initial,
    required this.onChanged,
  });

  final String titre;
  final Parent initial;
  final ValueChanged<Parent> onChanged;

  @override
  State<_ParentSection> createState() => _ParentSectionState();
}

class _ParentSectionState extends State<_ParentSection> {
  late Parent _parent;
  late final TextEditingController _prenom;
  late final TextEditingController _nom;
  late final TextEditingController _npi;
  late final TextEditingController _nationalite;
  late final TextEditingController _profession;

  @override
  void initState() {
    super.initState();
    _parent = widget.initial;
    _prenom = TextEditingController(text: _parent.prenom);
    _nom = TextEditingController(text: _parent.nom);
    _npi = TextEditingController(text: _parent.npi);
    _nationalite = TextEditingController(text: _parent.nationalite);
    _profession = TextEditingController(text: _parent.profession);
  }

  @override
  void dispose() {
    for (final c in [_prenom, _nom, _npi, _nationalite, _profession]) {
      c.dispose();
    }
    super.dispose();
  }

  void _maj(Parent p) {
    setState(() => _parent = p);
    widget.onChanged(p);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.titre, style: Theme.of(context).textTheme.titleMedium),
        RavecTextField(
          label: 'NPI (si connu)',
          controller: _npi,
          onChanged: (v) => _maj(_parent.copyWith(npi: v)),
        ),
        RavecTextField(
          label: 'Prénom',
          controller: _prenom,
          onChanged: (v) => _maj(_parent.copyWith(prenom: v)),
        ),
        RavecTextField(
          label: 'Nom',
          controller: _nom,
          onChanged: (v) => _maj(_parent.copyWith(nom: v)),
        ),
        RavecTextField(
          label: 'Nationalité',
          controller: _nationalite,
          onChanged: (v) => _maj(_parent.copyWith(nationalite: v)),
        ),
        RavecTextField(
          label: 'Profession',
          controller: _profession,
          onChanged: (v) => _maj(_parent.copyWith(profession: v)),
        ),
        IntlPhoneField(
          decoration: const InputDecoration(
            labelText: 'Téléphone',
            border: OutlineInputBorder(),
          ),
          languageCode: 'fr',
          initialCountryCode: 'GN',
          initialValue: _parent.telephone,
          // Saisie restreinte aux chiffres (pas de lettres).
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          // Champ optionnel : pas d'erreur de longueur.
          disableLengthCheck: true,
          onChanged: (phone) => _maj(_parent.copyWith(
            telephone: phone.number.trim().isEmpty ? null : phone.completeNumber,
          )),
        ),
        Row(
          children: [
            Expanded(
              child: SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Connu'),
                value: _parent.connu,
                onChanged: (v) => _maj(_parent.copyWith(connu: v)),
              ),
            ),
            Expanded(
              child: SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Décédé(e)'),
                value: _parent.decede,
                onChanged: (v) => _maj(_parent.copyWith(decede: v)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

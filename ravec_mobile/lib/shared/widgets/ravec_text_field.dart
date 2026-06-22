import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show TextInputFormatter;

/// Champ texte réutilisable (libellé + erreur optionnelle).
/// Composant partagé entre les modules de déclaration.
class RavecTextField extends StatelessWidget {
  const RavecTextField({
    super.key,
    required this.label,
    required this.controller,
    this.onChanged,
    this.keyboardType,
    this.errorText,
    this.hint,
    this.maxLines = 1,
    this.inputFormatters,
  });

  final String label;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final String? errorText;
  final String? hint;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: keyboardType,
        maxLines: maxLines,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          errorText: errorText,
          border: const OutlineInputBorder(),
          isDense: true,
        ),
      ),
    );
  }
}

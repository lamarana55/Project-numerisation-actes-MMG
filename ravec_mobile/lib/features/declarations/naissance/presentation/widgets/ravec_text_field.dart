import 'package:flutter/material.dart';

/// Champ texte réutilisable avec libellé et message d'erreur optionnel.
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
  });

  final String label;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final String? errorText;
  final String? hint;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: keyboardType,
        maxLines: maxLines,
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

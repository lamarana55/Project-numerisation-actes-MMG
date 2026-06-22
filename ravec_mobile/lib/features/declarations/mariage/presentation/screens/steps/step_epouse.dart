import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/declaration_mariage_controller.dart';
import '../../widgets/conjoint_form.dart';

/// Étape 3 — Épouse.
class StepEpouse extends ConsumerWidget {
  const StepEpouse({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final epouse = ref.watch(declarationMariageControllerProvider).declaration.epouse;
    final ctrl = ref.read(declarationMariageControllerProvider.notifier);
    return ConjointForm(titre: 'Épouse', initial: epouse, onChanged: ctrl.majEpouse);
  }
}

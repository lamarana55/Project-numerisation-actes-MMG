import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/declaration_mariage_controller.dart';
import '../../widgets/conjoint_form.dart';

/// Étape 2 — Époux.
class StepEpoux extends ConsumerWidget {
  const StepEpoux({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final epoux = ref.watch(declarationMariageControllerProvider).declaration.epoux;
    final ctrl = ref.read(declarationMariageControllerProvider.notifier);
    return ConjointForm(titre: 'Époux', initial: epoux, onChanged: ctrl.majEpoux);
  }
}

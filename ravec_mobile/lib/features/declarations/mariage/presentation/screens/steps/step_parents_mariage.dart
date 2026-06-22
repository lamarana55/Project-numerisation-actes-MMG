import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/declaration_mariage.dart';
import '../../controllers/declaration_mariage_controller.dart';
import '../../widgets/parent_mariage_section.dart';

/// Étape 4 — Parents de l'époux et de l'épouse.
class StepParentsMariage extends ConsumerWidget {
  const StepParentsMariage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final d = ref.watch(declarationMariageControllerProvider).declaration;
    final ctrl = ref.read(declarationMariageControllerProvider.notifier);

    Conjoint epoux() => ref.read(declarationMariageControllerProvider).declaration.epoux;
    Conjoint epouse() => ref.read(declarationMariageControllerProvider).declaration.epouse;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Parents de l\'époux', style: Theme.of(context).textTheme.titleMedium),
        ParentMariageSection(
          titre: 'Père de l\'époux',
          initial: d.epoux.pere,
          onChanged: (p) => ctrl.majEpoux(epoux().copyWith(pere: p)),
        ),
        const SizedBox(height: 12),
        ParentMariageSection(
          titre: 'Mère de l\'époux',
          initial: d.epoux.mere,
          onChanged: (m) => ctrl.majEpoux(epoux().copyWith(mere: m)),
        ),
        const Divider(height: 32),
        Text('Parents de l\'épouse', style: Theme.of(context).textTheme.titleMedium),
        ParentMariageSection(
          titre: 'Père de l\'épouse',
          initial: d.epouse.pere,
          onChanged: (p) => ctrl.majEpouse(epouse().copyWith(pere: p)),
        ),
        const SizedBox(height: 12),
        ParentMariageSection(
          titre: 'Mère de l\'épouse',
          initial: d.epouse.mere,
          onChanged: (m) => ctrl.majEpouse(epouse().copyWith(mere: m)),
        ),
      ],
    );
  }
}

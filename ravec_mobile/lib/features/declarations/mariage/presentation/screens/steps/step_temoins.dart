import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/declaration_mariage_controller.dart';
import '../../widgets/temoin_form.dart';

/// Étape 5 — Témoins.
class StepTemoins extends ConsumerWidget {
  const StepTemoins({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final d = ref.watch(declarationMariageControllerProvider).declaration;
    final ctrl = ref.read(declarationMariageControllerProvider.notifier);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        TemoinForm(titre: 'Témoin 1', initial: d.temoin1, onChanged: ctrl.majTemoin1),
        const Divider(height: 32),
        TemoinForm(titre: 'Témoin 2', initial: d.temoin2, onChanged: ctrl.majTemoin2),
      ],
    );
  }
}

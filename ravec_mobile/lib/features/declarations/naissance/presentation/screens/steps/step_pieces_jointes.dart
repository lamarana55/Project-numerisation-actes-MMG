import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/declaration_naissance.dart';
import '../../controllers/declaration_naissance_controller.dart';

/// Étape 3 — Pièces jointes (certificat d'accouchement, pièces d'identité…).
class StepPiecesJointes extends ConsumerWidget {
  const StepPiecesJointes({super.key});

  String _libelleType(TypePieceJointe t) => switch (t) {
        TypePieceJointe.certificatAccouchement => 'Certificat d\'accouchement',
        TypePieceJointe.pieceIdentiteDeclarant => 'Pièce d\'identité du déclarant',
        TypePieceJointe.jugementSuppletif => 'Jugement supplétif',
        TypePieceJointe.autre => 'Autre',
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pieces = ref.watch(declarationNaissanceControllerProvider).declaration.pieces;
    final ctrl = ref.read(declarationNaissanceControllerProvider.notifier);

    return Column(
      children: [
        Expanded(
          child: pieces.isEmpty
              ? const Center(child: Text('Aucune pièce jointe.'))
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: pieces.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (_, i) {
                    final p = pieces[i];
                    final ko = ((p.tailleOctets ?? 0) / 1024).round();
                    return ListTile(
                      leading: const Icon(Icons.insert_drive_file),
                      title: Text(_libelleType(p.type)),
                      subtitle: Text('${p.nomFichier} • $ko Ko'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () => ctrl.supprimerPiece(p.id),
                      ),
                    );
                  },
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: FilledButton.icon(
            icon: const Icon(Icons.add_a_photo),
            label: const Text('Ajouter une pièce'),
            onPressed: () => _ouvrirAjout(context, ctrl),
          ),
        ),
      ],
    );
  }

  void _ouvrirAjout(BuildContext context, DeclarationNaissanceController ctrl) {
    showModalBottomSheet<void>(
      context: context,
      builder: (sheetContext) => SafeArea(
        child: Wrap(
          children: TypePieceJointe.values.map((type) {
            return ListTile(
              title: Text(_libelleType(type)),
              trailing: Wrap(
                spacing: 8,
                children: [
                  IconButton(
                    icon: const Icon(Icons.camera_alt),
                    tooltip: 'Caméra',
                    onPressed: () async {
                      Navigator.pop(sheetContext);
                      final err = await ctrl.ajouterPiece(depuisCamera: true, type: type);
                      if (err != null && context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err)));
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.photo_library),
                    tooltip: 'Galerie',
                    onPressed: () async {
                      Navigator.pop(sheetContext);
                      final err = await ctrl.ajouterPiece(depuisCamera: false, type: type);
                      if (err != null && context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err)));
                      }
                    },
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

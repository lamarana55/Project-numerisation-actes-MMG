import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/device/location_service.dart';
import '../../../../../core/device/media_service.dart';
import '../../../../../core/error/failure.dart';
import '../../domain/entities/declaration_naissance.dart';
import '../providers/declaration_naissance_providers.dart';
import '../state/declaration_naissance_state.dart';

/// Contrôleur de l'assistant de déclaration de naissance.
class DeclarationNaissanceController extends Notifier<DeclarationNaissanceState> {
  static const _uuid = Uuid();

  @override
  DeclarationNaissanceState build() {
    return DeclarationNaissanceState(
      declaration: DeclarationNaissance(idempotencyKey: _uuid.v4()),
    );
  }

  // ── Mises à jour de formulaire ────────────────────────────
  void majNouveauNe(NouveauNe nouveauNe) =>
      state = state.copyWith(declaration: state.declaration.copyWith(nouveauNe: nouveauNe));

  void majPere(Parent pere) =>
      state = state.copyWith(declaration: state.declaration.copyWith(pere: pere));

  void majMere(Parent mere) =>
      state = state.copyWith(declaration: state.declaration.copyWith(mere: mere));

  void majDeclarant(Declarant declarant) =>
      state = state.copyWith(declaration: state.declaration.copyWith(declarant: declarant));

  void majParentsMaries(bool maries) =>
      state = state.copyWith(declaration: state.declaration.copyWith(parentsMaries: maries));

  void majAdresseLieu(String adresse) {
    final geo = state.declaration.geolocalisation.copyWith(adresseLieu: adresse);
    state = state.copyWith(declaration: state.declaration.copyWith(geolocalisation: geo));
  }

  // ── Géolocalisation ───────────────────────────────────────
  Future<String?> capturerPosition() async {
    try {
      final pos = await ref.read(locationServiceProvider).capturerPosition();
      final geo = state.declaration.geolocalisation.copyWith(
        latitude: pos.latitude,
        longitude: pos.longitude,
        precisionMetres: pos.precisionMetres,
        capturedAt: DateTime.now(),
      );
      state = state.copyWith(declaration: state.declaration.copyWith(geolocalisation: geo));
      return null;
    } catch (e) {
      return e.toString().replaceFirst('Exception: ', '');
    }
  }

  // ── Pièces jointes ────────────────────────────────────────
  Future<String?> ajouterPiece({
    required bool depuisCamera,
    required TypePieceJointe type,
  }) async {
    try {
      final fichier = await ref.read(mediaServiceProvider).capturer(depuisCamera: depuisCamera);
      if (fichier == null) return null; // annulé par l'utilisateur
      final piece = PieceJointe(
        id: _uuid.v4(),
        nomFichier: fichier.nom,
        cheminLocal: fichier.chemin,
        type: type,
        tailleOctets: fichier.tailleOctets,
      );
      final pieces = [...state.declaration.pieces, piece];
      state = state.copyWith(declaration: state.declaration.copyWith(pieces: pieces));
      return null;
    } catch (e) {
      return 'Échec de la capture de la pièce.';
    }
  }

  void supprimerPiece(String id) {
    final pieces = state.declaration.pieces.where((p) => p.id != id).toList();
    state = state.copyWith(declaration: state.declaration.copyWith(pieces: pieces));
  }

  // ── Navigation entre étapes ───────────────────────────────
  void etapeSuivante() {
    final i = state.etape.index;
    if (i < EtapeDeclaration.values.length - 1) {
      state = state.copyWith(etape: EtapeDeclaration.values[i + 1]);
    }
  }

  void etapePrecedente() {
    final i = state.etape.index;
    if (i > 0) {
      state = state.copyWith(etape: EtapeDeclaration.values[i - 1]);
    }
  }

  void allerAEtape(EtapeDeclaration etape) => state = state.copyWith(etape: etape);

  // ── Soumission ────────────────────────────────────────────
  Future<void> soumettre() async {
    state = state.copyWith(statut: StatutEnvoi.envoiEnCours, echec: null, erreurs: {});
    final usecase = ref.read(soumettreDeclarationNaissanceProvider);
    final res = await usecase(state.declaration);
    res.fold(
      (failure) {
        final erreurs =
            failure is ValidationFailure ? failure.fieldErrors : <String, String>{};
        state = state.copyWith(statut: StatutEnvoi.echec, echec: failure, erreurs: erreurs);
      },
      (resume) => state = state.copyWith(statut: StatutEnvoi.succes, resultat: resume),
    );
  }

  void reinitialiser() => state = build();
}

final declarationNaissanceControllerProvider =
    NotifierProvider<DeclarationNaissanceController, DeclarationNaissanceState>(
  DeclarationNaissanceController.new,
);

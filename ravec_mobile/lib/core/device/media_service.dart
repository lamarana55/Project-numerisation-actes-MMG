import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Fichier média prêt à être joint (capturé + compressé).
class MediaFichier {
  const MediaFichier({
    required this.chemin,
    required this.nom,
    required this.tailleOctets,
  });

  final String chemin;
  final String nom;
  final int tailleOctets;
}

/// Capture (caméra/galerie) et compression des pièces jointes,
/// pour rester sous la limite d'upload backend (10 Mo).
class MediaService {
  MediaService(this._picker);

  final ImagePicker _picker;

  Future<MediaFichier?> capturer({required bool depuisCamera}) async {
    final picked = await _picker.pickImage(
      source: depuisCamera ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 80,
      maxWidth: 2000,
    );
    if (picked == null) return null;

    final compresse = await _compresser(File(picked.path));
    final taille = await compresse.length();
    return MediaFichier(
      chemin: compresse.path,
      nom: p.basename(compresse.path),
      tailleOctets: taille,
    );
  }

  Future<File> _compresser(File source) async {
    final dir = await getTemporaryDirectory();
    final cible = p.join(
      dir.path,
      'piece_${DateTime.now().millisecondsSinceEpoch}.jpg',
    );
    final result = await FlutterImageCompress.compressAndGetFile(
      source.absolute.path,
      cible,
      quality: 70,
      minWidth: 1280,
      minHeight: 1280,
    );
    return result == null ? source : File(result.path);
  }
}

final mediaServiceProvider = Provider<MediaService>((ref) => MediaService(ImagePicker()));

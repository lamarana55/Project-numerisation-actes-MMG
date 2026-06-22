import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

/// Position géographique capturée.
class PositionGps {
  const PositionGps({
    required this.latitude,
    required this.longitude,
    required this.precisionMetres,
  });

  final double latitude;
  final double longitude;
  final double precisionMetres;
}

/// Capture de la position GPS (lieu de naissance).
class LocationService {
  /// Renvoie la position courante, ou lève une [Exception] explicite
  /// si le service est désactivé ou la permission refusée.
  Future<PositionGps> capturerPosition() async {
    final serviceActif = await Geolocator.isLocationServiceEnabled();
    if (!serviceActif) {
      throw Exception('La localisation est désactivée sur l\'appareil.');
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      throw Exception('Permission de localisation refusée.');
    }

    final pos = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );
    return PositionGps(
      latitude: pos.latitude,
      longitude: pos.longitude,
      precisionMetres: pos.accuracy,
    );
  }
}

final locationServiceProvider = Provider<LocationService>((ref) => LocationService());

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/declaration_naissance_controller.dart';
import '../../widgets/ravec_text_field.dart';

/// Étape 4 — Géolocalisation du lieu de naissance.
class StepGeolocalisation extends ConsumerStatefulWidget {
  const StepGeolocalisation({super.key});

  @override
  ConsumerState<StepGeolocalisation> createState() => _StepGeolocalisationState();
}

class _StepGeolocalisationState extends ConsumerState<StepGeolocalisation> {
  late final TextEditingController _adresse;
  bool _capture = false;

  @override
  void initState() {
    super.initState();
    final geo = ref.read(declarationNaissanceControllerProvider).declaration.geolocalisation;
    _adresse = TextEditingController(text: geo.adresseLieu);
  }

  @override
  void dispose() {
    _adresse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final geo = ref.watch(declarationNaissanceControllerProvider).declaration.geolocalisation;
    final ctrl = ref.read(declarationNaissanceControllerProvider.notifier);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Lieu de naissance', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        RavecTextField(
          label: 'Adresse du lieu',
          controller: _adresse,
          maxLines: 2,
          onChanged: ctrl.majAdresseLieu,
        ),
        const SizedBox(height: 16),
        Card(
          child: ListTile(
            leading: const Icon(Icons.my_location),
            title: const Text('Coordonnées GPS'),
            subtitle: Text(
              geo.latitude == null
                  ? 'Non capturées'
                  : 'Lat ${geo.latitude!.toStringAsFixed(5)}, '
                      'Lng ${geo.longitude!.toStringAsFixed(5)}\n'
                      'Précision ≈ ${geo.precisionMetres?.toStringAsFixed(0) ?? '—'} m',
            ),
            isThreeLine: geo.latitude != null,
          ),
        ),
        const SizedBox(height: 12),
        FilledButton.icon(
          icon: _capture
              ? const SizedBox(
                  width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))
              : const Icon(Icons.gps_fixed),
          label: Text(_capture ? 'Capture en cours…' : 'Capturer ma position'),
          onPressed: _capture
              ? null
              : () async {
                  final messenger = ScaffoldMessenger.of(context);
                  setState(() => _capture = true);
                  final err = await ctrl.capturerPosition();
                  if (mounted) {
                    setState(() => _capture = false);
                    if (err != null) {
                      messenger.showSnackBar(SnackBar(content: Text(err)));
                    }
                  }
                },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show FilteringTextInputFormatter;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/config/app_assets.dart';
import '../../../../shared/widgets/armoiries_background.dart';
import '../controllers/auth_controller.dart';
import '../state/auth_state.dart';

/// Écran 1 — saisie du numéro de téléphone (avec sélecteur d'indicatif pays).
class PhoneLoginScreen extends ConsumerStatefulWidget {
  const PhoneLoginScreen({super.key});

  @override
  ConsumerState<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends ConsumerState<PhoneLoginScreen> {
  final _formKey = GlobalKey<FormState>();

  /// Numéro complet au format international (ex: +224620000000).
  String _completeNumber = '';

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider);
    final ctrl = ref.read(authControllerProvider.notifier);

    ref.listen(authControllerProvider, (prev, next) {
      if (next.statut == AuthStatut.erreur && next.message != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(next.message!)));
      }
    });

    return Scaffold(
      body: ArmoiriesBackground(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.logoRavec, height: 130),
                  const SizedBox(height: 8),
                  Image.asset(AppAssets.guinee, height: 40),
                  const SizedBox(height: 20),
                  Text(
                    'Connectez-vous avec votre numéro de téléphone',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 32),
                  Form(
                    key: _formKey,
                    child: IntlPhoneField(
                      decoration: const InputDecoration(
                        labelText: 'Numéro de téléphone',
                        border: OutlineInputBorder(),
                      ),
                      languageCode: 'fr',
                      initialCountryCode: 'GN', // Guinée par défaut
                      invalidNumberMessage: 'Numéro de téléphone invalide',
                      // Saisie restreinte aux chiffres (pas de lettres).
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      // L'erreur ne s'affiche PAS pendant la frappe : la validation
                      // (longueur par pays) est déclenchée à la soumission.
                      autovalidateMode: AutovalidateMode.disabled,
                      onChanged: (phone) => _completeNumber = phone.completeNumber,
                    ),
                  ),
                  const SizedBox(height: 24),
                  FilledButton.icon(
                    icon: state.enChargement
                        ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))
                        : const Icon(Icons.login),
                    label: const Text('Connexion'),
                    onPressed: state.enChargement
                        ? null
                        : () {
                            // Valide à la soumission ; affiche l'erreur seulement ici.
                            if (_formKey.currentState?.validate() ?? false) {
                              ctrl.demanderOtp(_completeNumber);
                            }
                          },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

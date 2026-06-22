import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/api_config.dart';
import '../controllers/auth_controller.dart';
import '../state/auth_state.dart';

/// Écran 2 — saisie du code OTP reçu par SMS.
class OtpVerificationScreen extends ConsumerStatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  ConsumerState<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends ConsumerState<OtpVerificationScreen> {
  final _code = TextEditingController();

  @override
  void dispose() {
    _code.dispose();
    super.dispose();
  }

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
      appBar: AppBar(
        leading: BackButton(onPressed: ctrl.changerTelephone),
        title: const Text('Vérification'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline,
                        color: Theme.of(context).colorScheme.onSecondaryContainer),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text('Nous avons envoyé un message avec le code.'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text('Saisissez le code', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text('Un code à 6 chiffres a été envoyé au ${state.telephone}.',
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 24),
              TextField(
                controller: _code,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 6,
                style: const TextStyle(fontSize: 28, letterSpacing: 12, fontWeight: FontWeight.bold),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(counterText: '', hintText: '••••••'),
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                icon: state.enChargement
                    ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Icon(Icons.check),
                label: const Text('Vérifier'),
                onPressed: state.enChargement ? null : () => ctrl.verifierOtp(_code.text),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: state.enChargement ? null : ctrl.changerTelephone,
                child: const Text('Modifier le numéro'),
              ),
              if (ApiConfig.useMockAuth)
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Card(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Mode démo : aucun SMS réel n\'est envoyé. '
                        'Code de test : ${ApiConfig.mockOtpCode}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

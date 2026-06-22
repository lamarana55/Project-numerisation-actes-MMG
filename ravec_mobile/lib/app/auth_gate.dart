import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/auth/presentation/controllers/auth_controller.dart';
import '../features/auth/presentation/screens/otp_verification_screen.dart';
import '../features/auth/presentation/screens/phone_login_screen.dart';
import '../features/auth/presentation/state/auth_state.dart';
import '../features/dashboard/presentation/home_screen.dart';

/// Aiguille la navigation selon l'état d'authentification :
///   non connecté → saisie téléphone → OTP → accueil.
class AuthGate extends ConsumerStatefulWidget {
  const AuthGate({super.key});

  @override
  ConsumerState<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends ConsumerState<AuthGate> {
  @override
  void initState() {
    super.initState();
    // Restaure une éventuelle session existante après le premier rendu.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authControllerProvider.notifier).amorcer();
    });
  }

  @override
  Widget build(BuildContext context) {
    final phase = ref.watch(authControllerProvider.select((s) => s.phase));

    return switch (phase) {
      AuthPhase.authentifie => const HomeScreen(),
      AuthPhase.otpEnvoye => const OtpVerificationScreen(),
      AuthPhase.saisieTelephone => const PhoneLoginScreen(),
    };
  }
}

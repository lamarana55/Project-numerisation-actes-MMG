import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/config/app_assets.dart';
import '../../../shared/widgets/armoiries_background.dart';
import '../../auth/presentation/controllers/auth_controller.dart';
import '../../declarations/deces/presentation/screens/declaration_deces_screen.dart';
import '../../declarations/mariage/presentation/screens/declaration_mariage_screen.dart';
import '../../declarations/naissance/presentation/screens/declaration_naissance_screen.dart';

/// Accueil après authentification — accès aux modules de déclaration.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(authControllerProvider).session;
    final nom = session?.utilisateur.nom ?? 'Utilisateur';
    final profil = session?.utilisateur.profilLibelle;

    return Scaffold(
      appBar: AppBar(
        title: const Text('RAVEC Mobile'),
        actions: [
          IconButton(
            tooltip: 'Se déconnecter',
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authControllerProvider.notifier).deconnecter(),
          ),
        ],
      ),
      body: ArmoiriesBackground(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.logoRavec, height: 100),
                const SizedBox(height: 20),
                Text('Bonjour, $nom', style: Theme.of(context).textTheme.titleLarge),
                if (profil != null)
                  Text(profil, style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 32),
                FilledButton.icon(
                  icon: const Icon(Icons.child_care),
                  label: const Text('Déclaration de naissance'),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const DeclarationNaissanceScreen()),
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  icon: const Icon(Icons.sentiment_very_dissatisfied),
                  label: const Text('Déclaration de décès'),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const DeclarationDecesScreen()),
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  icon: const Icon(Icons.favorite),
                  label: const Text('Déclaration de mariage'),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const DeclarationMariageScreen()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

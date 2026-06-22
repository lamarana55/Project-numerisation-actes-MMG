import 'package:flutter/material.dart';

import '../../core/config/app_assets.dart';

/// Fond d'écran filigrané affichant discrètement les armoiries de la Guinée
/// derrière le contenu fourni.
class ArmoiriesBackground extends StatelessWidget {
  const ArmoiriesBackground({
    super.key,
    required this.child,
    this.opacity = 0.06,
  });

  final Widget child;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Center(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Opacity(
                opacity: opacity,
                child: Image.asset(AppAssets.armoiries, fit: BoxFit.contain),
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}

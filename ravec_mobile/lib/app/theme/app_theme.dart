import 'package:flutter/material.dart';

/// Thème de l'application RAVEC Mobile.
/// Couleur principale alignée sur le front : vert #4a8a4e.
class AppTheme {
  const AppTheme._();

  /// Couleur de marque (identique au frontend Angular).
  static const Color seed = Color(0xFF4A8A4E);

  static ThemeData light() {
    final scheme = ColorScheme.fromSeed(seedColor: seed);
    return ThemeData(
      colorScheme: scheme,
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.primaryContainer,
        foregroundColor: scheme.onPrimaryContainer,
        centerTitle: true,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        isDense: true,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/auth_gate.dart';
import 'app/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: RavecMobileApp()));
}

class RavecMobileApp extends StatelessWidget {
  const RavecMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RAVEC Mobile',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const AuthGate(),
    );
  }
}

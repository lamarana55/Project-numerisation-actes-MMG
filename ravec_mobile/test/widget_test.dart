import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ravec_mobile/main.dart';

void main() {
  testWidgets('L\'app démarre sur l\'écran de connexion par téléphone', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: RavecMobileApp()));
    await tester.pump();

    expect(find.text('Connexion'), findsOneWidget);
    expect(find.text('Connectez-vous avec votre numéro de téléphone'), findsOneWidget);
  });
}

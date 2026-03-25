import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fish_chips/Screens/login_screen.dart';

void main() {
  testWidgets('App shows LoginScreen', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);
  });
}

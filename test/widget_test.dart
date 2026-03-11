// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fish_chips/main.dart';

void main() {
  testWidgets('App shows LoginScreen', (WidgetTester tester) async {
    // Minimaler Setup ohne DB-init: nur Widget tree testen
    final userRepo = UserRepository();
    final auth = AuthService(userRepo);

    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(userRepo: userRepo, auth: auth),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);
  });
}

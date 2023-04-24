// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:module_10/views/login_view.dart';

void main() {
  group('Login view tests', () {
    testWidgets("Login test", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: LoginView(),
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
      ));

      expect(find.byKey(const Key('loginEmail')), findsOneWidget);
      expect(find.byKey(const Key('loginPhone')), findsOneWidget);
      expect(find.byKey(const Key('loginSubmit')), findsOneWidget);

      // Register Form
      expect(find.byKey(const Key('registerFirstName')), findsNothing);

      expect(find.byKey(const Key('switchRegister')), findsOneWidget);
    });
  });
}

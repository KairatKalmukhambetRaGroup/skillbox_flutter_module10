import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:module_10/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Login form test', () {
    final Finder loginEmailFinder = find.byKey(const Key('loginEmail'));
    final Finder loginEmailEmpty = find.text('Введите email');
    final Finder loginEmailInvalid =
        find.text('Поле email заполнено не корректно');
    final Finder loginEmailValidValue = find.text('test@test.com');
    final Finder loginEmailInvalidValue = find.text('test@test');

    final Finder loginPhoneFinder = find.byKey(const Key('loginPhone'));
    final Finder loginPhoneEmpty = find.text('Введите телефон');
    final Finder loginPhoneValidValue = find.text('87771234567');

    final Finder loginSubmitFinder = find.byKey(const Key('loginSubmit'));
    final Finder loginSuccessFinder = find.text('Добро пожаловать');
    testWidgets('on empty submit', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(loginSubmitFinder, findsOneWidget);

      await tester.tap(loginSubmitFinder);
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      expect(loginEmailEmpty, findsOneWidget);
      expect(loginPhoneEmpty, findsOneWidget);
    });

    testWidgets('phone validation and invalid email', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // phone
      expect(loginPhoneFinder, findsOneWidget);

      await tester.tap(loginPhoneFinder);
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      await tester.enterText(loginPhoneFinder, '8w777w123w4567');
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(loginPhoneValidValue, findsOneWidget);

      // email
      expect(loginEmailFinder, findsOneWidget);
      await tester.tap(loginEmailFinder);
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      await tester.enterText(loginEmailFinder, 'test@test');
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(loginEmailInvalidValue, findsOneWidget);

      // submit
      expect(loginSubmitFinder, findsOneWidget);
      await tester.tap(loginSubmitFinder);
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      expect(loginEmailInvalid, findsOneWidget);
    });

    testWidgets('successful submit', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // phone
      expect(loginPhoneFinder, findsOneWidget);

      await tester.tap(loginPhoneFinder);
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      await tester.enterText(loginPhoneFinder, '8w777w123w4567');
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(loginPhoneValidValue, findsOneWidget);

      // email
      expect(loginEmailFinder, findsOneWidget);
      await tester.tap(loginEmailFinder);
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      await tester.enterText(loginEmailFinder, 'test@test.com');
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(loginEmailValidValue, findsOneWidget);

      // submit
      expect(loginSubmitFinder, findsOneWidget);
      await tester.tap(loginSubmitFinder);
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      expect(loginSuccessFinder, findsOneWidget);
    });
  });

  group('Register form test', () {
    final Finder switchToRegister = find.byKey(const Key('switchRegister'));
    final Finder switchToLogin = find.byKey(const Key('switchLogin'));

    final Finder registerFirstNameFinder =
        find.byKey(const Key('registerFirstName'));
    final Finder registerFirstNameEmpty = find.text('Введите имя');
    final Finder registerFirstNameValidValue = find.text('Kairat');

    final Finder registerLastNameFinder =
        find.byKey(const Key('registerLastName'));
    final Finder registerLastNameEmpty = find.text('Введите фамилию');
    final Finder registerLastNameValidValue = find.text('Kalmukhambet');

    final Finder registerPhoneFinder = find.byKey(const Key('registerPhone'));
    final Finder registerPhoneEmpty = find.text('Заполните поле телефон');
    final Finder registerPhoneValidValue = find.text('87771234567');

    final Finder registerEmailFinder = find.byKey(const Key('registerEmail'));
    final Finder registerEmailEmpty = find.text('Заполните поле email');
    final Finder registerEmailInvalid = find.text('Емейл не корректный');
    final Finder registerEmailValidValue = find.text('test@test.com');
    final Finder registerEmailInvalidValue = find.text('test@test');

    final Finder registerSubmitFinder = find.byKey(const Key('registerSubmit'));
    final Finder registerSuccessFinder =
        find.text('Вы успешно зарегистрировались');

    testWidgets('switch to register and empty submit', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(switchToRegister, findsOneWidget);

      await tester.tap(switchToRegister);
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      expect(registerEmailFinder, findsOneWidget);
      expect(registerPhoneFinder, findsOneWidget);
      expect(registerFirstNameFinder, findsOneWidget);
      expect(registerLastNameFinder, findsOneWidget);
      expect(registerSubmitFinder, findsOneWidget);

      await tester.tap(registerSubmitFinder);
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      expect(registerEmailEmpty, findsOneWidget);
      expect(registerPhoneEmpty, findsOneWidget);
      expect(registerFirstNameEmpty, findsOneWidget);
      expect(registerLastNameEmpty, findsOneWidget);
    });

    testWidgets('phone validation and invalid email', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(switchToRegister, findsOneWidget);

      await tester.tap(switchToRegister);
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      // first name
      expect(registerFirstNameFinder, findsOneWidget);
      await tester.tap(registerFirstNameFinder);
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      await tester.enterText(registerFirstNameFinder, 'Kairat');
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(registerFirstNameValidValue, findsOneWidget);

      // last name
      expect(registerLastNameFinder, findsOneWidget);
      await tester.tap(registerLastNameFinder);
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      await tester.enterText(registerLastNameFinder, 'Kalmukhambet');
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(registerLastNameValidValue, findsOneWidget);

      // phone
      expect(registerPhoneFinder, findsOneWidget);
      await tester.tap(registerPhoneFinder);
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      await tester.enterText(registerPhoneFinder, '8w777w123w4567');
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(registerPhoneValidValue, findsOneWidget);

      // email
      expect(registerEmailFinder, findsOneWidget);
      await tester.tap(registerEmailFinder);
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      await tester.enterText(registerEmailFinder, 'test@test');
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(registerEmailInvalidValue, findsOneWidget);

      // submit
      expect(registerSubmitFinder, findsOneWidget);
      await tester.tap(registerSubmitFinder);
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      expect(registerEmailInvalidValue, findsOneWidget);
      expect(registerEmailInvalid, findsOneWidget);
    });

    testWidgets('successful submit', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(switchToRegister, findsOneWidget);

      await tester.tap(switchToRegister);
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      // first name
      expect(registerFirstNameFinder, findsOneWidget);
      await tester.tap(registerFirstNameFinder);
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      await tester.enterText(registerFirstNameFinder, 'Kairat');
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(registerFirstNameValidValue, findsOneWidget);

      // last name
      expect(registerLastNameFinder, findsOneWidget);
      await tester.tap(registerLastNameFinder);
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      await tester.enterText(registerLastNameFinder, 'Kalmukhambet');
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(registerLastNameValidValue, findsOneWidget);

      // phone
      expect(registerPhoneFinder, findsOneWidget);
      await tester.tap(registerPhoneFinder);
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      await tester.enterText(registerPhoneFinder, '8w777w123w4567');
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(registerPhoneValidValue, findsOneWidget);

      // email
      expect(registerEmailFinder, findsOneWidget);
      await tester.tap(registerEmailFinder);
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      await tester.enterText(registerEmailFinder, 'test@test.com');
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(registerEmailValidValue, findsOneWidget);

      // submit
      expect(registerSubmitFinder, findsOneWidget);
      await tester.tap(registerSubmitFinder);
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      expect(registerSuccessFinder, findsOneWidget);
    });
  });
}

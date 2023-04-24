// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login form tests', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });

    final loginEmailFinder = find.byValueKey('loginEmail');
    final loginEmailEmpty = find.text('Введите email');
    final loginEmailInvalid = find.text('Поле email заполнено не корректно');

    final loginPhoneFinder = find.byValueKey('loginPhone');
    final loginPhoneEmpty = find.text('Введите телефон');

    final loginSubmitFinder = find.byValueKey('loginSubmit');
    final loginSuccessFinder = find.text('Добро пожаловать');

    test('Test submit empty btn', () async {
      await driver!.tap(loginSubmitFinder);
    });

    test('Test empty errors', () async {
      expect(await driver!.getText(loginEmailEmpty), 'Введите email');
      expect(await driver!.getText(loginPhoneEmpty), 'Введите телефон');
    });

    test('Test Phone field', () async {
      await driver!.tap(loginPhoneFinder);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('8w777w123w45w67');
      await driver!.waitFor(find.text('87771234567'));
    });

    test('Test invalid Email field', () async {
      await driver!.tap(loginEmailFinder);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('test@test');
      await driver!.waitFor(find.text('test@test'));
    });

    test('Test submit btn', () async {
      await driver!.tap(loginSubmitFinder);
    });

    test('Test invalid email error', () async {
      expect(await driver!.getText(loginEmailInvalid),
          'Поле email заполнено не корректно');
    });

    test('Test Email field', () async {
      await driver!.tap(loginEmailFinder);
      await driver!.waitFor(find.text('test@test'));
      await driver!.enterText('test@test.com');
      await driver!.waitFor(find.text('test@test.com'));
    });

    test('Test submit btn', () async {
      await driver!.tap(loginSubmitFinder);
    });

    test('Test success', () async {
      expect(await driver!.getText(loginSuccessFinder), 'Добро пожаловать');
    });
  });

  group('Rigister form tests', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });

    final switchToRegister = find.byValueKey('switchRegister');
    final switchToLogin = find.byValueKey('switchLogin');

    final registerFirstNameFinder = find.byValueKey('registerFirstName');
    final registerFirstNameEmpty = find.text('Введите имя');

    final registerLastNameFinder = find.byValueKey('registerLastName');
    final registerLastNameEmpty = find.text('Введите фамилию');

    final registerPhoneFinder = find.byValueKey('registerPhone');
    final registerPhoneEmpty = find.text('Заполните поле телефон');

    final registerEmailFinder = find.byValueKey('registerEmail');
    final registerEmailEmpty = find.text('Заполните поле email');
    final registerEmailInvalid = find.text('Емейл не корректный');

    final registerSubmitFinder = find.byValueKey('registerSubmit');
    final registerSuccessFinder = find.text('Вы успешно зарегистрировались');

    test('Test switch to register', () async {
      await driver!.tap(switchToRegister);
    });

    test('Test submit empty btn', () async {
      await driver!.tap(registerSubmitFinder);
    });

    test('Test empty errors', () async {
      expect(await driver!.getText(registerFirstNameEmpty), 'Введите имя');
      expect(await driver!.getText(registerLastNameEmpty), 'Введите фамилию');
      expect(
          await driver!.getText(registerPhoneEmpty), 'Заполните поле телефон');
      expect(await driver!.getText(registerEmailEmpty), 'Заполните поле email');
    });

    test('Test firstname field', () async {
      await driver!.tap(registerFirstNameFinder);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('Kairat');
      await driver!.waitFor(find.text('Kairat'));
    });

    test('Test lastname field', () async {
      await driver!.tap(registerLastNameFinder);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('Kalmukhambet');
      await driver!.waitFor(find.text('Kalmukhambet'));
    });

    test('Test Phone field', () async {
      await driver!.tap(registerPhoneFinder);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('8w777w123w45w67');
      await driver!.waitFor(find.text('87771234567'));
    });

    test('Test invalid Email field', () async {
      await driver!.tap(registerEmailFinder);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('test@test');
      await driver!.waitFor(find.text('test@test'));
    });

    test('Test submit btn', () async {
      await driver!.tap(registerSubmitFinder);
    });

    test('Test invalid email error', () async {
      expect(
          await driver!.getText(registerEmailInvalid), 'Емейл не корректный');
    });

    test('Test Email field', () async {
      await driver!.tap(registerEmailFinder);
      await driver!.waitFor(find.text('test@test'));
      await driver!.enterText('test@test.com');
      await driver!.waitFor(find.text('test@test.com'));
    });

    test('Test submit btn', () async {
      await driver!.tap(registerSubmitFinder);
    });

    test('Test success', () async {
      expect(await driver!.getText(registerSuccessFinder),
          'Вы успешно зарегистрировались');
    });

    test('Test switch to login', () async {
      await driver!.tap(switchToLogin);
    });
  });
}

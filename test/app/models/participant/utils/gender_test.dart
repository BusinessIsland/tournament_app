import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/participant/utils/gender.dart';

void main() {
  group("Gender.resolveGenderFromString", () {
    test("resolving female gender from correct string throws no errors", () {
      final inputs = ["ж", "Ж"];

      for (String input in inputs) {
        final got = Gender.withValidation(input);
        expect(got, equals(Gender.female));
      }
    });

    test("resolving male gender from correct string throws no errors", () {
      final inputs = ["м", "М"];

      for (String input in inputs) {
        final got = Gender.withValidation(input);
        expect(got, equals(Gender.male));
      }
    });

    test("resolving gender from incorrect string throws FormatException", () {
      final input = "Я";

      expect(
        () => Gender.withValidation(input),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            "неудалось получить пол участника в: '$input'. возможные значения: 'м, М, ж, Ж'",
          ),
        ),
      );
    });
  });
}

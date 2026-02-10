import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/gateways/ui/validators/types/string_validators/contains_symbols_validator.dart';
import 'package:tournament_app/app/gateways/ui/validators/validator.dart';

void main() {
  final fieldName = "фамилия";
  final mustHaveSymbols = <String>{"a", ",", "!", "."};
  final atLeastCount = 2;

  final alphabet =
      "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

  String generateStringWithNoMustHaveSymbols() {
    final random = Random();
    final buffer = StringBuffer();

    for (int i = 0; i < 10; i++) {
      int nextIndex = random.nextInt(alphabet.length);
      String nextChar = alphabet[nextIndex];

      if (mustHaveSymbols.contains(nextChar)) {
        i--;
        continue;
      }
      buffer.write(nextChar);
    }

    return buffer.toString();
  }

  String generateStringWithLessThanAtLeastMustHaveSymbols() {
    final random = Random();

    int getNextIndex() => random.nextInt(alphabet.length);

    final buffer = StringBuffer();

    for (int i = 0; i < 10; i++) {
      String nextChar = alphabet[getNextIndex()];
      if (mustHaveSymbols.contains(nextChar)) {
        i--;
        continue;
      }

      buffer.write(nextChar);
    }

    final targetCount = atLeastCount == 0 ? 0 : atLeastCount - 1;

    for (int i = 0; i < targetCount; i++) {
      buffer.write(mustHaveSymbols.elementAt(i));
    }

    return buffer.toString();
  }

  String generateStringWithAtLeastMustHaveSymbols() {
    final random = Random();

    int getNextIndex() => random.nextInt(alphabet.length);

    final buffer = StringBuffer();

    for (int i = 0; i < 10; i++) {
      String nextChar = alphabet[getNextIndex()];
      if (mustHaveSymbols.contains(nextChar)) {
        i--;
        continue;
      }

      buffer.write(nextChar);
    }

    for (int i = 0; i < atLeastCount; i++) {
      buffer.write(mustHaveSymbols.elementAt(i));
    }

    return buffer.toString();
  }

  group("ContainsSymbolsValidator.Fail", () {
    group("at least", () {
      final errorMessage =
          "поле '$fieldName' должно содержать хотя бы '$atLeastCount' символа(ов) среди '${mustHaveSymbols.toString()}'";

      late Validator<String> validator;

      setUp(() {
        validator = ContainsSymbolsValidator(
          mustHaveSymbols: mustHaveSymbols,
          fieldName: fieldName,
          atLeastCount: atLeastCount,
        );
      });

      test(
        "value doesn't contain at least $atLeastCount 'must have' symbols",
        () {
          final value = generateStringWithLessThanAtLeastMustHaveSymbols();

          expect(validator.validate(value), errorMessage);
        },
      );
    });

    group("all", () {
      final errorMessage =
          "поле '$fieldName' должно содержать все символы среди '${mustHaveSymbols.toString()}'";

      late Validator<String> validator;

      setUp(() {
        validator = ContainsSymbolsValidator(
          mustHaveSymbols: mustHaveSymbols,
          fieldName: fieldName,
        );
      });

      test("value doesn't contain all 'must have' symbols", () {
        final value = generateStringWithNoMustHaveSymbols();

        expect(validator.validate(value), errorMessage);
      });
    });
  });

  group("ContainsSymbolsValidator.Success", () {
    group("at least", () {
      late Validator<String> validator;

      setUp(() {
        validator = ContainsSymbolsValidator(
          mustHaveSymbols: mustHaveSymbols,
          fieldName: fieldName,
          atLeastCount: atLeastCount,
        );
      });

      test("value contains at least $atLeastCount 'must have' symbols", () {
        final value = generateStringWithAtLeastMustHaveSymbols();

        expect(validator.validate(value), isNull);
      });
    });

    group("all", () {
      late Validator<String> validator;

      setUp(() {
        validator = ContainsSymbolsValidator(
          mustHaveSymbols: mustHaveSymbols,
          fieldName: fieldName,
        );
      });

      test("value contains all 'must have' symbols", () {
        final value = mustHaveSymbols.toString();

        expect(validator.validate(value), isNull);
      });
    });
  });
}

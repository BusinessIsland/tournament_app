import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/gateways/ui/validators/types/string_validators/forbidden_symbols_validator.dart';
import 'package:tournament_app/app/gateways/ui/validators/validator.dart';

void main() {
  late Validator<String> validator;
  final fieldName = "фамилия";
  final forbiddenSymbols = <String>{",", ".", " "};

  final alphabet =
      "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

  setUp(() {
    validator = ForbiddenSymbolsValidator(
      forbiddenSymbols: forbiddenSymbols,
      fieldName: fieldName,
    );
  });

  String generateStringWithAllForbiddenSymbols() {
    final random = Random();
    final buffer = StringBuffer();

    int getNextIndex() => random.nextInt(alphabet.length);

    for (int i = 0; i < 10; i++) {
      final nextSymbol = alphabet[getNextIndex()];
      if (forbiddenSymbols.contains(nextSymbol)) {
        i--;
        continue;
      }
      buffer.write(nextSymbol);
    }

    for (int i = 0; i < forbiddenSymbols.length; i++) {
      buffer.write(forbiddenSymbols.elementAt(i));
    }

    return buffer.toString();
  }

  String generateStringWithoutForbiddenSymbols() {
    final random = Random();
    final buffer = StringBuffer();

    int getNextIndex() => random.nextInt(alphabet.length);

    for (int i = 0; i < 10; i++) {
      final nextSymbol = alphabet[getNextIndex()];

      if (forbiddenSymbols.contains(nextSymbol)) {
        i--;
        continue;
      }

      buffer.write(nextSymbol);
    }

    return buffer.toString();
  }

  group("ForbiddenSymbolsValidator.Fail", () {
    final errorMessage =
        "поле '$fieldName' не должно содержать какой-либо символ среди ${forbiddenSymbols.toString()}";

    test(
      "validator should return error message if value contains at least one of forbidden symbols",
      () {
        final value = generateStringWithAllForbiddenSymbols();

        expect(validator.validate(value), errorMessage);
      },
    );
  });

  group("ForbiddenSymbolsValidator.Success", () {
    test(
      "validator should return null if value doesn't contain any of forbidden symbols",
      () {
        final value = generateStringWithoutForbiddenSymbols();

        expect(validator.validate(value), isNull);
      },
    );
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/gateways/ui/validators/types/int_validators/min_int_value_validator.dart';
import 'package:tournament_app/app/gateways/ui/validators/validator.dart';

void main() {
  late Validator<int> validator;
  final minValue = 10;
  final fieldName = "фамилия";

  setUp(() {
    validator = MinIntValueValidator(minValue: minValue, fieldName: fieldName);
  });

  group("MinIntValueValidator.Fail", () {
    final errorMessage = "поле '$fieldName' не должно быть меньше $minValue";

    test(
      "validator should return error message if value is less than $minValue",
      () {
        final value = minValue - 10;

        expect(validator.validate(value), errorMessage);
      },
    );
  });

  group("MinIntValueValidator.Success", () {
    test("validator should return null if value is greater than $minValue", () {
      final value = minValue + 10;

      expect(validator.validate(value), isNull);
    });

    test("validator should return null if value equals to $minValue", () {
      final value = minValue;

      expect(validator.validate(value), isNull);
    });
  });
}

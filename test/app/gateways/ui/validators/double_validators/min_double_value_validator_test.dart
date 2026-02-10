import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/gateways/ui/validators/types/double_validators/min_double_value_validator.dart';
import 'package:tournament_app/app/gateways/ui/validators/validator.dart';

void main() {
  late Validator<double> validator;
  final minValue = 10.0;
  final fieldName = "фамилия";

  setUp(() {
    validator = MinDoubleValueValidator(minValue: minValue, fieldName: fieldName);
  });

  group("MinDoubleValueValidator.Fail", () {
    final errorMessage = "поле '$fieldName' не должно быть меньше $minValue";

    test(
      "validator should return error message if value is less than $minValue",
          () {
        final value = minValue - 10.0;

        expect(validator.validate(value), errorMessage);
      },
    );
  });

  group("MinDoubleValueValidator.Success", () {
    test("validator should return null if value is greater than $minValue", () {
      final value = minValue + 10.0;

      expect(validator.validate(value), isNull);
    });

    test("validator should return null if value equals to $minValue", () {
      final value = minValue;

      expect(validator.validate(value), isNull);
    });
  });
}

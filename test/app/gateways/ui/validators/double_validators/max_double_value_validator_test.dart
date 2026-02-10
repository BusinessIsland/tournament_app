import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/gateways/ui/validators/types/double_validators/max_double_value_validator.dart';
import 'package:tournament_app/app/gateways/ui/validators/validator.dart';

void main() {
  late Validator<double> validator;
  final fieldName = "фамилия";
  final maxValue = 10.0;

  setUp(() {
    validator = MaxDoubleValueValidator(maxValue: maxValue, fieldName: fieldName);
  });

  group("MaxDoubleValueValidator.Fail", () {
    final errorMessage = "поле '$fieldName' не должно превышать '$maxValue'";

    test(
      "validator should return error message if value is greater than $maxValue",
          () {
        final value = maxValue + 10.0;

        expect(validator.validate(value), errorMessage);
      },
    );
  });

  group("MaxDoubleValueValidator.Success", () {
    test("validator should return null if value is lower than $maxValue", () {
      final value = maxValue - 10.0;

      expect(validator.validate(value), isNull);
    });

    test("validator should return null if value equals to $maxValue", () {
      final value = maxValue;

      expect(validator.validate(value), isNull);
    });
  });
}

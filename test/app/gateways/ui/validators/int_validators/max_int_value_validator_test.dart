import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/gateways/ui/validators/types/int_validators/max_int_value_validator.dart';
import 'package:tournament_app/app/gateways/ui/validators/validator.dart';

void main() {
  late Validator<int> validator;
  final fieldName = "фамилия";
  final maxValue = 10;

  setUp(() {
    validator = MaxIntValueValidator(maxValue: maxValue, fieldName: fieldName);
  });

  group("MaxIntValueValidator.Fail", () {
    final errorMessage = "поле '$fieldName' не должно превышать '$maxValue'";

    test(
      "validator should return error message if value is greater than $maxValue",
      () {
        final value = maxValue + 10;

        expect(validator.validate(value), errorMessage);
      },
    );
  });

  group("MaxIntValueValidator.Success", () {
    test("validator should return null if value is lower than $maxValue", () {
      final value = maxValue - 10;

      expect(validator.validate(value), isNull);
    });

    test("validator should return null if value equals to $maxValue", () {
      final value = maxValue;

      expect(validator.validate(value), isNull);
    });
  });
}

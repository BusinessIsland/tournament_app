import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/gateways/ui/validators/types/string_validators/max_length_validator.dart';
import 'package:tournament_app/app/gateways/ui/validators/validator.dart';

void main() {
  late Validator<String> validator;

  final maxLength = 10;
  final fieldName = "фамилия";

  setUp(() {
    validator = MaxLengthValidator(maxLength: maxLength, fieldName: fieldName);
  });

  group("MaxLengthValidator.Fail", () {
    final errorMessage =
        "поле '$fieldName' не должно превышать $maxLength символов";

    test(
      "validator should return error message if value's length is greater than $maxLength",
      () {
        final value = "aaa" * maxLength;

        expect(validator.validate(value), errorMessage);
      },
    );
  });

  group("MaxLengthValidator.Success", () {
    test(
      "validator should return null if value's length is less than $maxLength",
      () {
        final value = "a" * (maxLength - 1);

        expect(validator.validate(value), isNull);
      },
    );

    test(
      "validator should return null if value's length equals to $maxLength",
      () {
        final value = "a" * maxLength;

        expect(validator.validate(value), isNull);
      },
    );
  });
}

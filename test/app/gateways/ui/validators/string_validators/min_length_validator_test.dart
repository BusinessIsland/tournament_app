import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/gateways/ui/validators/types/string_validators/min_length_validator.dart';
import 'package:tournament_app/app/gateways/ui/validators/validator.dart';

void main() {
  late Validator<String> validator;
  final fieldName = "фамилия";
  final minLength = 10;

  setUp(() {
    validator = MinLengthValidator(minLength: minLength, fieldName: fieldName);
  });

  group("MinLengthValidator.Fail", () {
    final errorMessage =
        "поле '$fieldName' должно содержать не менее $minLength символов";

    test(
      "validator should return error message if value's length is less than '$minLength'",
      () {
        final value = "dwada";

        expect(validator.validate(value), errorMessage);
      },
    );
  });

  group("MinLengthValidator.Success", () {
    test(
      "validator should return null if value's length is greater than $minLength",
      () {
        final value = "a" * 20;

        expect(validator.validate(value), isNull);
      },
    );

    test(
      "validator should return null if value's length equals to $minLength",
          () {
        final value = "a" * minLength;

        expect(validator.validate(value), isNull);
      },
    );
  });
}

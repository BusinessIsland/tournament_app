import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/gateways/ui/validators/types/string_validators/not_empty_validator.dart';
import 'package:tournament_app/app/gateways/ui/validators/validator.dart';

void main() {
  late Validator<String> validator;
  final fieldName = "фамилия";

  setUp(() {
    validator = NotEmptyValidator(fieldName: fieldName);
  });

  group("NotEmptyValidator.Fail", () {
    final errorMessage =
        "поле 'фамилия' не может быть пустым или состоять только из пробельных символов";

    test("validator should return error message if value is empty", () {
      final value = "";

      expect(validator.validate(value), errorMessage);
    });

    test(
      "validator should return error message if value consists of whitespace characters only",
      () {
        final value = " " * 20;

        expect(validator.validate(value), errorMessage);
      },
    );
  });

  group("NotEmptyValidator.Success", () {
    test("validator should return null if value is not empty", () {
      final value = "Hello, World!";

      expect(validator.validate(value), isNull);
    });

    test(
      "validator should return null if value doesn't consists of whitespace characters only",
      () {
        final value = "       Hello,      World!        ";

        expect(validator.validate(value), isNull);
      },
    );
  });
}

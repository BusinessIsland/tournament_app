import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/gateways/ui/validators/types/date_time_validators/min_date_validator.dart';
import 'package:tournament_app/app/gateways/ui/validators/validator.dart';

void main() {
  late Validator<DateTime> validator;
  final minDate = DateTime(2020, 1, 2);
  final fieldName = "фамилия";

  setUp(() {
    validator = MinDateValidator(minDate: minDate, fieldName: fieldName);
  });

  group("MinDateValidator.Fail", () {
    final errorMessage =
        "поле '$fieldName' должно содержать дату после '${minDate.toString()}'";

    test(
      "validator should return error message when date before '${minDate.toString()}'",
      () {
        final value = minDate.subtract(Duration(days: 10));

        expect(validator.validate(value), errorMessage);
      },
    );
  });

  group("MinDateValidator.Success", () {
    test(
      "validator should return null when date after '${minDate.toString()}'",
      () {
        final value = minDate.add(Duration(days: 10));

        expect(validator.validate(value), isNull);
      },
    );

    test(
      "validator should return null when date equals '${minDate.toString()}'",
      () {
        final value = minDate;

        expect(validator.validate(value), isNull);
      },
    );
  });
}

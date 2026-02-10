import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/gateways/ui/validators/types/date_time_validators/max_date_validator.dart';
import 'package:tournament_app/app/gateways/ui/validators/validator.dart';

void main() {
  late Validator<DateTime> validator;
  final maxDate = DateTime(2020, 1, 2);
  final fieldName = "фамилия";

  setUp(() {
    validator = MaxDateValidator(maxDate: maxDate, fieldName: fieldName);
  });

  group("MaxDateValidator.Fail", () {
    final errorMessage =
        "поле '$fieldName' должно содержать дату до '${maxDate.toString()}'";

    test(
      "validator should return error message when date after '${maxDate.toString()}'",
      () {
        final value = maxDate.add(Duration(days: 10));

        expect(validator.validate(value), errorMessage);
      },
    );
  });

  group("MaxDateValidator.Success", () {
    test(
      "validator should return null when date before '${maxDate.toString()}'",
      () {
        final value = maxDate.subtract(Duration(days: 10));

        expect(validator.validate(value), isNull);
      },
    );

    test(
      "validator should return null when date equals '${maxDate.toString()}'",
      () {
        final value = maxDate;

        expect(validator.validate(value), isNull);
      },
    );
  });
}

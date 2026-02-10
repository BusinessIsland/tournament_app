import 'package:tournament_app/app/gateways/ui/validators/validator.dart';

class MaxDateValidator extends Validator<DateTime> {
  final DateTime maxDate;

  const MaxDateValidator({required this.maxDate, required super.fieldName});

  @override
  String? validate(DateTime value) {
    if (value.compareTo(maxDate) <= 0) return null;
    return _errorMessage;
  }

  String get _errorMessage =>
      "поле '$fieldName' должно содержать дату до '${maxDate.toString()}'";
}

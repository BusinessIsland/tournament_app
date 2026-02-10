import 'package:tournament_app/app/gateways/ui/validators/validator.dart';

class MinDateValidator extends Validator<DateTime> {
  final DateTime minDate;

  const MinDateValidator({required this.minDate, required super.fieldName});

  @override
  String? validate(DateTime value) {
    if (value.compareTo(minDate) >= 0) return null;
    return _errorMessage;
  }

  String get _errorMessage =>
      "поле '$fieldName' должно содержать дату после '${minDate.toString()}'";
}

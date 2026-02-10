import 'package:tournament_app/app/gateways/ui/validators/validator.dart';

class MaxIntValueValidator extends Validator<int> {
  final int maxValue;

  const MaxIntValueValidator({required this.maxValue, required super.fieldName});

  @override
  String? validate(int value) {
    if (value <= maxValue) return null;
    return _errorMessage;
  }

  String get _errorMessage => "поле '$fieldName' не должно превышать '$maxValue'";
}
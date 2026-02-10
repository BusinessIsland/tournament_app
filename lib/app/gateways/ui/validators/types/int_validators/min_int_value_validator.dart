import 'package:tournament_app/app/gateways/ui/validators/validator.dart';

class MinIntValueValidator extends Validator<int> {
  final int minValue;

  const MinIntValueValidator({required this.minValue, required super.fieldName});

  @override
  String? validate(int value) {
    if (value >= minValue) return null;
    return _errorMessage;
  }

  String get _errorMessage => "поле '$fieldName' не должно быть меньше $minValue";
}
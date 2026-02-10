import 'package:tournament_app/app/gateways/ui/validators/validator.dart';

class MinDoubleValueValidator extends Validator<double> {
  final double minValue;

  const MinDoubleValueValidator({required this.minValue, required super.fieldName});

  @override
  String? validate(double value) {
    if (value >= minValue) return null;
    return _errorMessage;
  }

  String get _errorMessage =>
      "поле '$fieldName' не должно быть меньше $minValue";
}

import 'package:tournament_app/app/gateways/ui/validators/validator.dart';

class MaxDoubleValueValidator extends Validator<double> {
  final double maxValue;

  const MaxDoubleValueValidator({
    required this.maxValue,
    required super.fieldName,
  });

  @override
  String? validate(double value) {
    if (value <= maxValue) return null;
    return _errorMessage;
  }

  String get _errorMessage =>
      "поле '$fieldName' не должно превышать '$maxValue'";
}

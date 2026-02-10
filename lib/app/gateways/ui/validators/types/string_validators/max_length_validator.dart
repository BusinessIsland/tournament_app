import 'package:tournament_app/app/gateways/ui/validators/validator.dart';

class MaxLengthValidator extends Validator<String> {
  final int maxLength;

  const MaxLengthValidator({required this.maxLength, required super.fieldName});

  @override
  String? validate(String value) {
    if (value.length <= maxLength) return null;
    return _errorMessage;
  }

  String get _errorMessage =>
      "поле '$fieldName' не должно превышать $maxLength символов";
}

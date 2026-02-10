import 'package:tournament_app/app/gateways/ui/validators/validator.dart';

class MinLengthValidator extends Validator<String> {
  final int minLength;

  const MinLengthValidator({required this.minLength, required super.fieldName});

  @override
  String? validate(String value) {
    if (value.length >= minLength) return null;
    return _errorMessage;
  }

  String get _errorMessage => "поле '$fieldName' должно содержать не менее $minLength символов";
}

import 'package:tournament_app/app/gateways/ui/validators/validator.dart';

class NotEmptyValidator extends Validator<String> {
  NotEmptyValidator({required super.fieldName});

  @override
  String? validate(String value) {
    if (value.trim().isNotEmpty) return null;
    return _errorMessage;
  }

  String get _errorMessage => "поле '$fieldName' не может быть пустым или состоять только из пробельных символов";
}

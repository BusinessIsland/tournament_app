import 'package:tournament_app/app/gateways/ui/validators/validator.dart';

class ForbiddenSymbolsValidator extends Validator<String> {
  final Set<String> forbiddenSymbols;

  const ForbiddenSymbolsValidator({
    required this.forbiddenSymbols,
    required super.fieldName,
  });

  @override
  String? validate(String value) {
    if (!hasForbiddenSymbols(value)) return null;
    return _errorMessage;
  }

  bool hasForbiddenSymbols(String value) {
    return forbiddenSymbols.where((s) => value.contains(s)).isNotEmpty;
  }

  String get _errorMessage =>
      "поле '$fieldName' не должно содержать какой-либо символ среди ${forbiddenSymbols.toString()}";
}

import 'package:tournament_app/app/gateways/ui/validators/validator.dart';

class ContainsSymbolsValidator extends Validator<String> {
  final Set<String> mustHaveSymbols;
  final int? atLeastCount;

  const ContainsSymbolsValidator({
    required this.mustHaveSymbols,
    required super.fieldName,
    this.atLeastCount,
  });

  @override
  String? validate(String value) {
    int targetCount = getTargetAtLeastCount();

    if (countMustHaveSymbols(value) >= targetCount) return null;
    return _errorMessage;
  }

  int getTargetAtLeastCount() {
    if (atLeastCount == null) return mustHaveSymbols.length;
    return atLeastCount!;
  }

  int countMustHaveSymbols(String value) {
    return mustHaveSymbols.where((s) => value.contains(s)).length;
  }

  String get _errorMessage {
    if (atLeastCount != null) {
      return "поле '$fieldName' должно содержать хотя бы '$atLeastCount' символа(ов) среди '${mustHaveSymbols.toString()}'";
    }

    return "поле '$fieldName' должно содержать все символы среди '${mustHaveSymbols.toString()}'";
  }
}

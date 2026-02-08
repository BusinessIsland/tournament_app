import 'package:tournament_app/app/models/parts/weight/weight.dart';

abstract class WeightParser {
  WeightParser? _next;

  WeightParser setNext(WeightParser nextParser) {
    _next = nextParser;
    return nextParser;
  }

  Weight parse(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return _next?.parse(raw) ?? UndefinedWeight();
    }

    final result = concreteParse(raw.trim());
    if (result != null) return result;

    return _next?.parse(raw) ?? UndefinedWeight();
  }

  Weight? concreteParse(String raw);
}

class StandardWeightParser extends WeightParser {
  Weight? _tryParseAsDouble(String raw) {
    final parsed = double.tryParse(raw);

    if (parsed == null) return null;
    if (parsed < 0) return null;

    return SimpleWeight(parsed);
  }

  @override
  Weight? concreteParse(String raw) {
    var value = _tryParseAsDouble(raw);
    if (value != null) return value;

    return null;
  }
}

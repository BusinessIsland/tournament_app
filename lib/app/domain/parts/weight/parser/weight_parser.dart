import 'package:tournament_app/app/domain/parts/weight/weight.dart';

class WeightParser {
  Weight? parse(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return null;
    }

    final prepared = _normalize(raw);

    final parsed = _tryParse(prepared);
    if (parsed != null) {
      return Weight(value: parsed);
    }

    return null;
  }

  String _normalize(String raw) {
    return raw
        .trim()
        .replaceAll(RegExp(r"\s+"), " ")
        .replaceAll(RegExp(","), ".")
        .toLowerCase();
  }

  double? _tryParse(String raw) {
    final parsed = double.tryParse(raw);
    if (parsed == null) return null;
    if (parsed <= 0) return null;
    return parsed;
  }
}

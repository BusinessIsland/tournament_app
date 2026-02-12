import 'package:tournament_app/app/models/parts/gender/gender.dart';
import 'package:tournament_app/app/models/parts/gender/parser/gender_pattern_parser.dart';

class GenderPipeline {
  final List<GenderPatternParser> _parsers;

  GenderPipeline(this._parsers);

  Gender parse(String? raw) {
    if (raw == null || raw
        .trim()
        .isEmpty) {
      return UndefinedGender();
    }

    final prepared = _normalize(raw);

    for (final parser in _parsers) {
      final result = parser.parse(prepared);

      if (result != null) return result;
    }

    return UndefinedGender();
  }

  String _normalize(String raw) {
    return raw.trim().replaceAll(RegExp(r"\s+"), " ").toLowerCase();
  }
}
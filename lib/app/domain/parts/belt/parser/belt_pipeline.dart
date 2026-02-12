import 'package:tournament_app/app/domain/parts/belt/belt.dart';
import 'package:tournament_app/app/domain/parts/belt/parser/belt_pattern_parser.dart';

class BeltPipeline {
  final List<BeltPatternParser> _parsers;

  BeltPipeline(this._parsers);

  Belt? parse(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return null;
    }

    final prepared = _normalize(raw);

    for (final parser in _parsers) {
      final result = parser.parse(prepared);

      if (result != null) return result;
    }

    return null;
  }

  String _normalize(String raw) {
    return raw.trim().replaceAll(RegExp(r"\s+"), " ").toLowerCase();
  }
}

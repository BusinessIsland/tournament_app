import 'package:tournament_app/app/domain/parts/name/parser/person_name_pattern_parser.dart';
import 'package:tournament_app/app/domain/parts/name/person_name.dart';

class PersonNamePipeline {
  final List<PersonNamePatternParser> _parsers;

  PersonNamePipeline(this._parsers);

  PersonName? parse(String? raw) {
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

import 'package:tournament_app/app/models/parts/name/parser/person_name_pattern_parser.dart';
import 'package:tournament_app/app/models/parts/name/person_name.dart';

class PersonNamePipeline {
  final List<PersonNamePatternParser> _parsers;

  PersonNamePipeline(this._parsers);

  PersonName parse(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return UndefinedName();
    }

    final prepared = _normalize(raw);

    for (final parser in _parsers) {
      final result = parser.parse(prepared);

      if (result != null) return result;
    }

    return UndefinedName();
  }

  String _normalize(String raw) {
    return raw.trim().replaceAll(RegExp(r"\s+"), " ").toLowerCase();
  }
}

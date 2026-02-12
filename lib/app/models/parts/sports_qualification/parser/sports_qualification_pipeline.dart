import 'package:tournament_app/app/models/parts/sports_qualification/parser/sports_qualification_pattern_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_qualification.dart';

class SportsQualificationPipeline {
  final List<SportsQualificationPatternParser> _parsers;

  SportsQualificationPipeline(this._parsers);

  SportsQualification parse(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return UndefinedSportsQualification();
    }

    final prepared = _normalize(raw);

    for (final parser in _parsers) {
      final result = parser.parse(prepared);

      if (result != null) return result;
    }

    return UndefinedSportsQualification();
  }

  String _normalize(String raw) {
    return raw.trim().replaceAll(RegExp(r"\s+"), " ").toLowerCase();
  }
}

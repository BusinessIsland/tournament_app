import 'package:tournament_app/app/models/parts/sports_qualification/sports_qualification.dart';

typedef SportsQualificationFactory = SportsQualification Function();

class SportsQualificationPatternParser {
  final List<(RegExp, SportsQualificationFactory)> _rules;

  SportsQualificationPatternParser(this._rules);

  SportsQualification? parse(String raw) {
    for (final (regexp, factory) in _rules) {
      final match = regexp.firstMatch(raw);

      if (match != null) {
        return factory();
      }
    }

    return null;
  }
}
import 'package:tournament_app/app/domain/parts/name/person_name.dart';

typedef NameFactory = PersonName Function(RegExpMatch);

class PersonNamePatternParser {
  final List<(RegExp, NameFactory)> _rules;

  PersonNamePatternParser(this._rules);

  PersonName? parse(String raw) {
    for (final (regexp, factory) in _rules) {
      final match = regexp.firstMatch(raw);

      if (match != null) {
        return factory(match);
      }
    }

    return null;
  }
}

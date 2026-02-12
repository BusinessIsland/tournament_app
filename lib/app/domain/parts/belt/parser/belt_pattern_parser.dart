import 'package:tournament_app/app/domain/parts/belt/belt.dart';

typedef BeltFactory = Belt Function(RegExpMatch);

class BeltPatternParser {
  final List<(RegExp, BeltFactory)> _rules;

  BeltPatternParser(this._rules);

  Belt? parse(String raw) {
    for (final (regexp, factory) in _rules) {
      final match = regexp.firstMatch(raw);

      if (match != null) {
        return factory(match);
      }
    }

    return null;
  }
}

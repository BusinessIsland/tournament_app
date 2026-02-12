import 'package:tournament_app/app/models/parts/gender/gender.dart';

typedef GenderFactory = Gender Function();

class GenderPatternParser {
  final List<(RegExp, GenderFactory)> _parsers;

  GenderPatternParser(this._parsers);

  Gender? parse(String raw) {
    if (_parsers.isEmpty) return null;

    for (final (regexp, factory) in _parsers) {
      final match = regexp.firstMatch(raw);

      if (match != null) {
        return factory();
      }
    }

    return null;
  }
}

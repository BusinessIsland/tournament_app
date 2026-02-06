import 'package:tournament_app/app/models/parts/sports_qualification/sports_qualification.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_titles/sports_title.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_titles/sports_titles_regexp.dart';

abstract class SportsTitleParser {
  SportsTitleParser? _next;

  SportsTitleParser setNext(SportsTitleParser nextParser) {
    _next = nextParser;
    return nextParser;
  }

  SportsQualification parse(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return _next?.parse(raw) ?? UndefinedSportsQualification();
    }

    final result = concreteParse(raw.trim());
    if (result != null) return result;

    return _next?.parse(raw) ?? UndefinedSportsQualification();
  }

  SportsQualification? concreteParse(String raw);
}

class GrandmasterRankParser extends SportsTitleParser {
  SportsQualification? _tryParseGrandmasterRank(String raw) {
    final match = GrandmasterRankRegexp.grandmasterRank.firstMatch(raw);
    return match == null ? null : Grandmaster();
  }

  @override
  SportsQualification? concreteParse(String raw) {
    var value = _tryParseGrandmasterRank(raw);
    if (value != null) return value;

    return null;
  }
}

class MasterOfSportsRankParser extends SportsTitleParser {
  SportsQualification? _tryParseMasterOfSportsRank(String raw) {
    final match = MasterOfSportsRankRegexp.masterOfSportsRank.firstMatch(raw);
    return match == null ? null : MasterOfSports();
  }

  @override
  SportsQualification? concreteParse(String raw) {
    var value = _tryParseMasterOfSportsRank(raw);
    if (value != null) return value;

    return null;
  }
}

class MasterOfSportsInternationalRankParser extends SportsTitleParser {
  SportsQualification? _tryParseMasterOfSportsInternationalRank(String raw) {
    final match = MasterOfSportsInternationalRankRegexp
        .masterOfSportsInternationalRank
        .firstMatch(raw);
    return match == null ? null : MasterOfSportsInternational();
  }

  @override
  SportsQualification? concreteParse(String raw) {
    var value = _tryParseMasterOfSportsInternationalRank(raw);
    if (value != null) return value;

    return null;
  }
}

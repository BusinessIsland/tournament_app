import 'package:tournament_app/app/models/parts/sports_qualification/sports_qualification.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_ranks/youth/youth_ranks.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_ranks/youth/youth_ranks_regexp.dart';

abstract class YouthRanksParser {
  YouthRanksParser? _next;

  YouthRanksParser setNext(YouthRanksParser nextParser) {
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

class FirstYouthRankParser extends YouthRanksParser {
  SportsQualification? _tryParseAdultRank(String raw) {
    final match = FirstYouthRankRegexp.youthRank.firstMatch(raw);
    return match == null ? null : FirstYouthRank();
  }

  @override
  SportsQualification? concreteParse(String raw) {
    var value = _tryParseAdultRank(raw);
    if (value != null) return value;

    return null;
  }
}

class SecondYouthRankParser extends YouthRanksParser {
  SportsQualification? _tryParseAdultRank(String raw) {
    final match = SecondYouthRankRegexp.youthRank.firstMatch(raw);
    return match == null ? null : SecondYouthRank();
  }

  @override
  SportsQualification? concreteParse(String raw) {
    var value = _tryParseAdultRank(raw);
    if (value != null) return value;

    return null;
  }
}

class ThirdYouthRankParser extends YouthRanksParser {
  SportsQualification? _tryParseAdultRank(String raw) {
    final match = ThirdYouthRankRegexp.youthRank.firstMatch(raw);
    return match == null ? null : ThirdYouthRank();
  }

  @override
  SportsQualification? concreteParse(String raw) {
    var value = _tryParseAdultRank(raw);
    if (value != null) return value;

    return null;
  }
}

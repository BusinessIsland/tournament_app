import 'package:tournament_app/app/models/parts/sports_qualification/sports_qualification.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_ranks/adults/adult_ranks.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_ranks/adults/adult_ranks_regexp.dart';

abstract class AdultRanksParser {
  AdultRanksParser? _next;

  AdultRanksParser setNext(AdultRanksParser nextParser) {
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

class FirstAdultRankParser extends AdultRanksParser {
  SportsQualification? _tryParseAdultRank(String raw) {
    final match = FirstAdultRankRegexp.adultRank.firstMatch(raw);
    return match == null ? null : FirstAdultRank();
  }

  @override
  SportsQualification? concreteParse(String raw) {
    var value = _tryParseAdultRank(raw);
    if (value != null) return value;

    return null;
  }
}

class SecondAdultRankParser extends AdultRanksParser {
  SportsQualification? _tryParseAdultRank(String raw) {
    final match = SecondAdultRankRegexp.adultRank.firstMatch(raw);
    return match == null ? null : SecondAdultRank();
  }

  @override
  SportsQualification? concreteParse(String raw) {
    var value = _tryParseAdultRank(raw);
    if (value != null) return value;

    return null;
  }
}

class ThirdAdultRankParser extends AdultRanksParser {
  SportsQualification? _tryParseAdultRank(String raw) {
    final match = ThirdAdultRankRegexp.adultRank.firstMatch(raw);
    return match == null ? null : ThirdAdultRank();
  }

  @override
  SportsQualification? concreteParse(String raw) {
    var value = _tryParseAdultRank(raw);
    if (value != null) return value;

    return null;
  }
}

import 'package:tournament_app/app/models/parts/sports_qualification/parser/sports_qualification_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_qualification.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_ranks/adults/adult_ranks.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/regexp/adult_ranks_regexp.dart';

class FirstAdultRankParser extends SportsQualificationParser {
  SportsQualification? _tryParseAdultRank(String raw) {
    final match = FirstAdultRankRegexp.firstAdultRank.firstMatch(raw);
    return match == null ? null : FirstAdultRank();
  }

  @override
  SportsQualification? concreteParse(String raw) {
    var value = _tryParseAdultRank(raw);
    if (value != null) return value;

    return null;
  }
}

class SecondAdultRankParser extends SportsQualificationParser {
  SportsQualification? _tryParseAdultRank(String raw) {
    final match = SecondAdultRankRegexp.secondAdultRank.firstMatch(raw);
    return match == null ? null : SecondAdultRank();
  }

  @override
  SportsQualification? concreteParse(String raw) {
    var value = _tryParseAdultRank(raw);
    if (value != null) return value;

    return null;
  }
}

class ThirdAdultRankParser extends SportsQualificationParser {
  SportsQualification? _tryParseAdultRank(String raw) {
    final match = ThirdAdultRankRegexp.thirdAdultRank.firstMatch(raw);
    return match == null ? null : ThirdAdultRank();
  }

  @override
  SportsQualification? concreteParse(String raw) {
    var value = _tryParseAdultRank(raw);
    if (value != null) return value;

    return null;
  }
}

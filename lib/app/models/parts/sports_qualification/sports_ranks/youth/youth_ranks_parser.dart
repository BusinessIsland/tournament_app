import 'package:tournament_app/app/models/parts/sports_qualification/sports_qualification.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_qualification_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_ranks/youth/youth_ranks.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_ranks/youth/youth_ranks_regexp.dart';

class FirstYouthRankParser extends SportsQualificationParser {
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

class SecondYouthRankParser extends SportsQualificationParser {
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

class ThirdYouthRankParser extends SportsQualificationParser {
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

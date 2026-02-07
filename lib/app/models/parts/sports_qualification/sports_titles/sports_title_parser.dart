import 'package:tournament_app/app/models/parts/sports_qualification/sports_qualification.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_qualification_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_titles/sports_title.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_titles/sports_titles_regexp.dart';

class GrandmasterRankParser extends SportsQualificationParser {
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

class MasterOfSportsRankParser extends SportsQualificationParser {
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

class MasterOfSportsInternationalRankParser extends SportsQualificationParser {
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

import 'package:tournament_app/app/models/parts/sports_qualification/parser/sports_qualification_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_qualification.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/regexp/candidate_rank_regexp.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_ranks/sports_rank.dart';

class CandidateRankParser extends SportsQualificationParser {
  SportsQualification? _tryParseCandidateMasterRank(String raw) {
    final match = CandidateRankRegexp.candidateMasterRank.firstMatch(raw);
    print(raw);
    return match == null ? null : CandidateMaster();
  }

  @override
  SportsQualification? concreteParse(String raw) {
    var value = _tryParseCandidateMasterRank(raw);
    if (value != null) return value;

    return null;
  }
}
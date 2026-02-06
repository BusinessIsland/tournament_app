import 'package:tournament_app/app/models/parts/sports_qualification/sports_qualification.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_ranks/candidate/candidate_rank_regexp.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_ranks/sports_rank.dart';

abstract class CandidateRankParser {
  CandidateRankParser? _next;

  CandidateRankParser setNext(CandidateRankParser nextParser) {
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

class CandidateRankParserImpl extends CandidateRankParser {
  SportsQualification? _tryParseCandidateMasterRank(String raw) {
    final match = CandidateRankRegexp.candidateMasterRank.firstMatch(raw);
    return match == null ? null : CandidateMaster();
  }

  @override
  SportsQualification? concreteParse(String raw) {
    var value = _tryParseCandidateMasterRank(raw);
    if (value != null) return value;

    return null;
  }
}
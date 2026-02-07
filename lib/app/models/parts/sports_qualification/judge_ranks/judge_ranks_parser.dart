import 'package:tournament_app/app/models/parts/sports_qualification/judge_ranks/judge_ranks.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/judge_ranks/judge_ranks_regexp.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_qualification.dart';

abstract class JudgeRanksParser {
  JudgeRanksParser? _next;

  JudgeRanksParser setNext(JudgeRanksParser nextParser) {
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

class AllSportsJudgeRankParser extends JudgeRanksParser {
  SportsQualification? _tryParseAllSportsJudgeRank(String raw) {
    final match = AllSportsJudgeRegExp.allSportsJudge.firstMatch(raw);
    return match == null ? null : AllSportsJudge();
  }

  @override
  SportsQualification? concreteParse(String raw) {
    var value = _tryParseAllSportsJudgeRank(raw);
    if (value != null) return value;

    return null;
  }
}

class FirstCategoryJudgeRankParser extends JudgeRanksParser {
  SportsQualification? _tryParseFirstCategoryJudgeRank(String raw) {
    final match = FirstCategoryJudgeRegExp.firstCategoryJudge.firstMatch(raw);
    return match == null ? null : FirstCategoryJudge();
  }

  @override
  SportsQualification? concreteParse(String raw) {
    var value = _tryParseFirstCategoryJudgeRank(raw);
    if (value != null) return value;

    return null;
  }
}

class SecondCategoryJudgeRankParser extends JudgeRanksParser {
  SportsQualification? _tryParseSecondCategoryJudgeRank(String raw) {
    final match = SecondCategoryJudgeRegExp.secondCategoryJudge.firstMatch(raw);
    return match == null ? null : SecondCategoryJudge();
  }

  @override
  SportsQualification? concreteParse(String raw) {
    var value = _tryParseSecondCategoryJudgeRank(raw);
    if (value != null) return value;

    return null;
  }
}

class ThirdCategoryJudgeRankParser extends JudgeRanksParser {
  SportsQualification? _tryParseThirdCategoryJudgeRank(String raw) {
    final match = ThirdCategoryJudgeRegExp.thirdCategoryJudge.firstMatch(raw);
    return match == null ? null : ThirdCategoryJudge();
  }

  @override
  SportsQualification? concreteParse(String raw) {
    var value = _tryParseThirdCategoryJudgeRank(raw);
    if (value != null) return value;

    return null;
  }
}

class YouthCategoryJudgeRankParser extends JudgeRanksParser {
  SportsQualification? _tryParseYouthCategoryJudgeRank(String raw) {
    final match = YouthCategoryJudgeRegExp.youthCategoryJudge.firstMatch(raw);
    return match == null ? null : YouthCategoryJudge();
  }

  @override
  SportsQualification? concreteParse(String raw) {
    var value = _tryParseYouthCategoryJudgeRank(raw);
    if (value != null) return value;

    return null;
  }
}
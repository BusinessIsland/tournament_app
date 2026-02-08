import 'package:tournament_app/app/models/parts/sports_qualification/judge_ranks/judge_ranks.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/sports_qualification_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/regexp/judge_ranks_regexp.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_qualification.dart';

class AllSportsCategoryJudgeParser extends SportsQualificationParser {
  SportsQualification? _tryParseAllSportsJudgeRank(String raw) {
    final match = AllSportsCategoryJudgeRegExp.allSportsCategoryJudge.firstMatch(raw);
    return match == null ? null : AllSportsJudge();
  }

  @override
  SportsQualification? concreteParse(String raw) {
    var value = _tryParseAllSportsJudgeRank(raw);
    if (value != null) return value;

    return null;
  }
}

class FirstCategoryJudgeParser extends SportsQualificationParser {
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

class SecondCategoryJudgeParser extends SportsQualificationParser {
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

class ThirdCategoryJudgeParser extends SportsQualificationParser {
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

class YouthCategoryJudgeParser extends SportsQualificationParser {
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

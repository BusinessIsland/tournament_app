import 'package:tournament_app/app/models/parts/sports_qualification/judge_ranks/judge_ranks.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/patterns/all_sports_category_judge_sports_qualification_pattern.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/patterns/candidate_rank_sports_qualification_pattern.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/patterns/first_adult_rank_sports_qualification_pattern.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/patterns/first_category_judge_sports_qualification_pattern.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/patterns/first_youth_rank_sports_qualification_pattern.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/patterns/grandmaster_title_sports_qualification_pattern.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/patterns/master_of_sports_of_international_title_sports_qualification_pattern.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/patterns/master_of_sports_title_sports_qualification_pattern.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/patterns/second_adult_rank_sports_qualification_pattern.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/patterns/second_category_judge_sports_qualification_pattern.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/patterns/second_youth_rank_sports_qualification_pattern.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/patterns/third_adult_rank_sports_qualification_pattern.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/patterns/third_category_judge_sports_qualification_pattern.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/patterns/third_youth_rank_sports_qualification_pattern.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/patterns/youth_category_judge_sports_qualification_pattern.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/sports_qualification_pattern_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_ranks/adults/adult_ranks.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_ranks/sports_rank.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_ranks/youth/youth_ranks.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_titles/sports_title.dart';

class SportsQualificationParserRegistry {
  static SportsQualificationPatternParser firstAdult() =>
      SportsQualificationPatternParser([
        (
          FirstAdultRankSportsQualificationPattern.firstAdultRank,
          () => FirstAdultRank(),
        ),
      ]);

  static SportsQualificationPatternParser secondAdult() =>
      SportsQualificationPatternParser([
        (
          SecondAdultRankSportsQualificationPattern.secondAdultRank,
          () => SecondAdultRank(),
        ),
      ]);

  static SportsQualificationPatternParser thirdAdult() =>
      SportsQualificationPatternParser([
        (
          ThirdAdultRankSportsQualificationPattern.thirdAdultRank,
          () => ThirdAdultRank(),
        ),
      ]);

  static SportsQualificationPatternParser firstYouth() =>
      SportsQualificationPatternParser([
        (
          FirstYouthRankSportsQualificationPattern.firstYouthRank,
          () => FirstYouthRank(),
        ),
      ]);

  static SportsQualificationPatternParser secondYouth() =>
      SportsQualificationPatternParser([
        (
          SecondYouthRankSportsQualificationPattern.secondYouthRank,
          () => SecondYouthRank(),
        ),
      ]);

  static SportsQualificationPatternParser thirdYouth() =>
      SportsQualificationPatternParser([
        (
          ThirdYouthRankSportsQualificationPattern.thirdYouthRank,
          () => ThirdYouthRank(),
        ),
      ]);

  static SportsQualificationPatternParser candidate() =>
      SportsQualificationPatternParser([
        (
          CandidateRankSportsQualificationPattern.candidateRank,
          () => CandidateMaster(),
        ),
      ]);

  static SportsQualificationPatternParser internationalMaster() =>
      SportsQualificationPatternParser([
        (
          MasterOfSportsOfInternationalTitleSportsQualificationPattern
              .masterOfSportsOfInternationalTitle,
          () => MasterOfSportsInternational(),
        ),
      ]);

  static SportsQualificationPatternParser master() =>
      SportsQualificationPatternParser([
        (
          MasterOfSportsTitleSportsQualificationPattern.masterOfSportsTitle,
          () => MasterOfSports(),
        ),
      ]);

  static SportsQualificationPatternParser grandmaster() =>
      SportsQualificationPatternParser([
        (
          GrandmasterTitleSportsQualificationPattern.grandmasterTitle,
          () => Grandmaster(),
        ),
      ]);

  static SportsQualificationPatternParser allSportsJudge() =>
      SportsQualificationPatternParser([
        (
          AllSportsCategoryJudgeSportsQualificationPattern.allSportsCategory,
          () => AllSportsJudge(),
        ),
      ]);

  static SportsQualificationPatternParser firstJudge() =>
      SportsQualificationPatternParser([
        (
          FirstCategoryJudgeSportsQualificationPattern.firstCategoryJudge,
          () => FirstCategoryJudge(),
        ),
      ]);

  static SportsQualificationPatternParser secondJudge() =>
      SportsQualificationPatternParser([
        (
          SecondCategoryJudgeSportsQualificationPattern.secondCategoryJudge,
          () => SecondCategoryJudge(),
        ),
      ]);

  static SportsQualificationPatternParser thirdJudge() =>
      SportsQualificationPatternParser([
        (
          ThirdCategoryJudgeSportsQualificationPattern.thirdCategoryJudge,
          () => ThirdCategoryJudge(),
        ),
      ]);

  static SportsQualificationPatternParser youthJudge() =>
      SportsQualificationPatternParser([
        (
          YouthCategoryJudgeSportsQualificationPattern.youthCategoryJudge,
          () => YouthCategoryJudge(),
        ),
      ]);
}

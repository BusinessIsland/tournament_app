import 'package:tournament_app/app/models/parts/sports_qualification/parser/sports_qualification_parser.dart';

abstract class ISportsQualificationParserBuilder {
  ISportsQualificationParserBuilder addFirstAdultRankParser();
  ISportsQualificationParserBuilder addSecondAdultRankParser();
  ISportsQualificationParserBuilder addThirdAdultRankParser();
  ISportsQualificationParserBuilder addFirstYouthRankParser();
  ISportsQualificationParserBuilder addSecondYouthRankParser();
  ISportsQualificationParserBuilder addThirdYouthRankParser();
  ISportsQualificationParserBuilder addCandidateRankParser();
  ISportsQualificationParserBuilder addAllSportsCategoryJudgeParser();
  ISportsQualificationParserBuilder addFirstCategoryJudgeParser();
  ISportsQualificationParserBuilder addSecondCategoryJudgeParser();
  ISportsQualificationParserBuilder addThirdCategoryJudgeParser();
  ISportsQualificationParserBuilder addYouthCategoryJudgeParser();
  ISportsQualificationParserBuilder addGrandmasterTitleParser();
  ISportsQualificationParserBuilder addMasterOfSportsTitleParser();
  ISportsQualificationParserBuilder addMasterOfSportsInternationalTitleParser();
  SportsQualificationParser build();
}
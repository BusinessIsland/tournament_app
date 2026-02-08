import 'package:tournament_app/app/models/competition_judge/parser/competition_judge_parser.dart';
import 'package:tournament_app/app/models/parts/belt/parser/builders/belt_parser_builder.dart';
import 'package:tournament_app/app/models/parts/name/parser/builders/person_name_parser_builder.dart';
import 'package:tournament_app/app/models/parts/region/parser/builders/region_parser_builder.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/builders/sports_qualification_parser_builder.dart';

class CompetitionJudgeParserFactory {
  static CompetitionJudgeParser createDefaultParser() {
    return CompetitionJudgeParser(
      personNameParser: PersonNameParserBuilder()
          .addFullNameParser()
          .addNameWithInitialsParser()
          .addShortNameParser()
          .build(),
      beltParser: BeltParserBuilder().addKuParser().addDanParser().build(),
      sportsQualificationParser: SportsQualificationParserBuilder()
          .addAllSportsCategoryJudgeParser()
          .addFirstCategoryJudgeParser()
          .addSecondCategoryJudgeParser()
          .addThirdCategoryJudgeParser()
          .addYouthCategoryJudgeParser()
          .build(),
      regionParser: RegionParserBuilder().addStandardParser().build(),
    );
  }
}

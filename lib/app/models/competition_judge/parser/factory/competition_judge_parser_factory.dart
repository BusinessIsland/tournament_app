import 'package:tournament_app/app/models/competition_judge/parser/competition_judge_parser.dart';
import 'package:tournament_app/app/models/parts/belt/parser/belt_pipeline_builder.dart';
import 'package:tournament_app/app/models/parts/name/parser/person_name_pipeline_builder.dart';
import 'package:tournament_app/app/models/parts/region/parser/region_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/sports_qualification_pipeline_builder.dart';

class CompetitionJudgeParserFactory {
  static CompetitionJudgeParser createDefaultParser() {
    return CompetitionJudgeParser(
      personNameParser: PersonNamePipelineBuilder()
          .addFullName()
          .addInitials()
          .addShortName()
          .build(),
      beltParser: BeltPipelineBuilder().addKuBelt().addDanBelt().build(),
      sportsQualificationParser: SportsQualificationPipelineBuilder()
          .addAllSportsJudge()
          .addFirstJudge()
          .addSecondAdult()
          .addThirdAdult()
          .addYouthJudge()
          .build(),
      regionParser: RegionParser(),
    );
  }
}

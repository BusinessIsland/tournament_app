import 'package:tournament_app/app/models/participant/parser/participant_parser.dart';
import 'package:tournament_app/app/models/parts/belt/parser/builders/belt_parser_builder.dart';
import 'package:tournament_app/app/models/parts/block/parser/builders/block_parser_builder.dart';
import 'package:tournament_app/app/models/parts/date_of_birth/parser/builders/date_of_birth_parser_builder.dart';
import 'package:tournament_app/app/models/parts/gender/parser/builders/gender_parser_builder.dart';
import 'package:tournament_app/app/models/parts/name/parser/builders/person_name_parser_builder.dart';
import 'package:tournament_app/app/models/parts/region/parser/builders/region_parser_builder.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/builders/sports_qualification_parser_builder.dart';
import 'package:tournament_app/app/models/parts/weight/parser/builders/weight_parser_builder.dart';
import 'package:tournament_app/app/models/trainer/parser/factory/trainer_parser_factory.dart';

class ParticipantParserFactory {
  static ParticipantParser createDefaultParser() {
    return ParticipantParser(
      genderParser: GenderParserBuilder()
          .addMaleParser()
          .addFemaleParser()
          .build(),
      nameParser: PersonNameParserBuilder()
          .addFullNameParser()
          .addNameWithInitialsParser()
          .addShortNameParser()
          .build(),
      dateOfBirthParser: DateOfBirthParserBuilder().addDateTimeParser().build(),
      beltParser: BeltParserBuilder().addKuParser().addDanParser().build(),
      sportsQualificationParser: SportsQualificationParserBuilder()
          .addFirstAdultRankParser()
          .addSecondAdultRankParser()
          .addThirdAdultRankParser()
          .addFirstYouthRankParser()
          .addSecondYouthRankParser()
          .addThirdYouthRankParser()
          .addGrandmasterTitleParser()
          .addMasterOfSportsTitleParser()
          .addMasterOfSportsInternationalTitleParser()
          .addCandidateRankParser()
          .build(),
      weightParser: WeightParserBuilder().addStandardParser().build(),
      regionParser: RegionParserBuilder().addStandardParser().build(),
      trainerParser: TrainerParserFactory().createDefaultParser(),
      blockParser: BlockParserBuilder().addStandardParser().build(),
    );
  }
}

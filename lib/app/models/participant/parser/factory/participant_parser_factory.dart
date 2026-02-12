import 'package:tournament_app/app/models/participant/parser/participant_parser.dart';
import 'package:tournament_app/app/models/parts/belt/parser/belt_pipeline_builder.dart';
import 'package:tournament_app/app/models/parts/block/parser/block_parser.dart';
import 'package:tournament_app/app/models/parts/date_of_birth/parser/date_of_birth_parser.dart';
import 'package:tournament_app/app/models/parts/gender/parser/gender_pipeline_builder.dart';
import 'package:tournament_app/app/models/parts/name/parser/person_name_pipeline_builder.dart';
import 'package:tournament_app/app/models/parts/region/parser/region_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/sports_qualification_pipeline_builder.dart';
import 'package:tournament_app/app/models/parts/weight/parser/weight_parser.dart';
import 'package:tournament_app/app/models/trainer/parser/trainer_parser.dart';

class ParticipantParserFactory {
  static ParticipantParser createDefaultParser() {
    final genderParser = GenderPipelineBuilder().addMale().addFemale().build();

    final nameParser = PersonNamePipelineBuilder()
        .addFullName()
        .addInitials()
        .addShortName()
        .build();

    final dateOfBirthParser = DateOfBirthParser();

    final beltParser = BeltPipelineBuilder().addKuBelt().addDanBelt().build();

    final sportsQualificationParser = SportsQualificationPipelineBuilder()
        .addFirstAdult()
        .addSecondAdult()
        .addThirdAdult()
        .addFirstYouth()
        .addSecondYouth()
        .addThirdYouth()
        .addGrandmaster()
        .addMaster()
        .addInternationalMaster()
        .addCandidate()
        .build();

    final weightParser = WeightParser();

    final regionParser = RegionParser();

    final trainerParser = TrainerParser(nameParser);

    final blockParser = BlockParser();

    return ParticipantParser(
      genderParser: genderParser,
      nameParser: nameParser,
      dateOfBirthParser: dateOfBirthParser,
      beltParser: beltParser,
      sportsQualificationParser: sportsQualificationParser,
      weightParser: weightParser,
      regionParser: regionParser,
      trainerParser: trainerParser,
      blockParser: blockParser,
    );
  }
}

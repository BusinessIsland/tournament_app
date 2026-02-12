import 'package:tournament_app/app/domain/participant/participant.dart';
import 'package:tournament_app/app/domain/parts/belt/parser/belt_pipeline.dart';
import 'package:tournament_app/app/domain/parts/block/parser/block_parser.dart';
import 'package:tournament_app/app/domain/parts/date_of_birth/parser/date_of_birth_parser.dart';
import 'package:tournament_app/app/domain/parts/gender/parser/gender_pipeline.dart';
import 'package:tournament_app/app/domain/parts/id/id.dart';
import 'package:tournament_app/app/domain/parts/name/parser/person_name_pipeline.dart';
import 'package:tournament_app/app/domain/parts/region/parser/region_parser.dart';
import 'package:tournament_app/app/domain/parts/sports_qualification/parser/sports_qualification_parser.dart';
import 'package:tournament_app/app/domain/parts/weight/parser/weight_parser.dart';
import 'package:tournament_app/app/domain/trainer/parser/trainer_parser.dart';

class ParticipantParser {
  GenderPipeline genderParser;
  PersonNamePipeline nameParser;
  DateOfBirthParser dateOfBirthParser;
  BeltPipeline beltParser;
  SportsQualificationParser sportsQualificationParser;
  WeightParser weightParser;
  RegionParser regionParser;
  TrainerParser trainerParser;
  BlockParser blockParser;

  ParticipantParser({
    required this.genderParser,
    required this.nameParser,
    required this.dateOfBirthParser,
    required this.beltParser,
    required this.sportsQualificationParser,
    required this.weightParser,
    required this.regionParser,
    required this.trainerParser,
    required this.blockParser,
  });

  Participant parse(
    String? rawGender,
    String? rawName,
    String? rawDateOfBirth,
    String? rawBelt,
    String? rawSportsQualification,
    String? rawWeight,
    String? rawRegion,
    String? rawTrainer,
    String? rawBlock,
  ) {
    final parsedGender = genderParser.parse(rawGender);
    final parsedName = nameParser.parse(rawName);
    final parsedDateOfBirth = dateOfBirthParser.parse(rawDateOfBirth);
    final parsedBelt = beltParser.parse(rawBelt);
    final parsedSportsQualification = sportsQualificationParser.parse(
      rawSportsQualification,
    );
    final parsedWeight = weightParser.parse(rawWeight);
    final parsedRegion = regionParser.parse(rawRegion);
    final parsedTrainer = trainerParser.parse(rawTrainer);
    final parsedBlock = blockParser.parse(rawBlock);

    return Participant(
      id: Id(),
      gender: parsedGender,
      name: parsedName,
      dateOfBirth: parsedDateOfBirth,
      belt: parsedBelt,
      sportsQualification: parsedSportsQualification,
      weight: parsedWeight,
      region: parsedRegion,
      trainers: parsedTrainer,
      block: parsedBlock,
    );
  }
}

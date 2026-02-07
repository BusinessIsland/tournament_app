import 'package:tournament_app/app/models/participant/participant.dart';
import 'package:tournament_app/app/models/parts/belt/belt_parser.dart';
import 'package:tournament_app/app/models/parts/block/block_parser.dart';
import 'package:tournament_app/app/models/parts/date_of_birth/date_of_birth_parser.dart';
import 'package:tournament_app/app/models/parts/gender/gender_parser.dart';
import 'package:tournament_app/app/models/parts/id/id.dart';
import 'package:tournament_app/app/models/parts/name/person_name_parser.dart';
import 'package:tournament_app/app/models/parts/region/region_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_qualification_parser.dart';
import 'package:tournament_app/app/models/parts/weight/weight_parser.dart';
import 'package:tournament_app/app/models/trainer/parser/trainer_parser.dart';

class ParticipantParser {
  GenderParser genderParser;
  PersonNameParser nameParser;
  DateOfBirthParser dateOfBirthParser;
  BeltParser beltParser;
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

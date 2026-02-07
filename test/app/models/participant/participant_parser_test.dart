import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/participant/participant.dart';
import 'package:tournament_app/app/models/participant/participant_parser.dart';
import 'package:tournament_app/app/models/parts/belt/belt_parser.dart';
import 'package:tournament_app/app/models/parts/block/block_parser.dart';
import 'package:tournament_app/app/models/parts/date_of_birth/date_of_birth_parser.dart';
import 'package:tournament_app/app/models/parts/gender/gender_parser.dart';
import 'package:tournament_app/app/models/parts/name/person_name_parser.dart';
import 'package:tournament_app/app/models/parts/region/region_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_ranks/adults/adult_ranks_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_ranks/candidate/candidate_rank_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_ranks/youth/youth_ranks_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_titles/sports_title_parser.dart';
import 'package:tournament_app/app/models/parts/weight/weight_parser.dart';
import 'package:tournament_app/app/models/trainer/parser/trainer_parser.dart';

void main() {
  Participant parseParticipant(
    String rawGender,
    String rawName,
    String rawDateOfBirth,
    String rawBelt,
    String rawSportsQualification,
    String rawWeight,
    String rawRegion,
    String rawTrainer,
    String rawBlock,
  ) {
    final genderParser = MaleGenderParser();
    genderParser.setNext(FemaleGenderParser());

    final nameParser = FullNameParser();
    final dateOfBirthParser = DateTimeDateOfBirthParser();
    final beltParser = KuBeltParser();
    beltParser.setNext(DanBeltParser());

    final sportsQualificationParser = FirstAdultRankParser();
    sportsQualificationParser
        .setNext(SecondAdultRankParser())
        .setNext(ThirdAdultRankParser())
        .setNext(FirstYouthRankParser())
        .setNext(SecondYouthRankParser())
        .setNext(ThirdYouthRankParser())
        .setNext(CandidateRankParserImpl())
        .setNext(MasterOfSportsRankParser())
        .setNext(GrandmasterRankParser())
        .setNext(MasterOfSportsInternationalRankParser());

    final weightParser = SimpleWeightParser();
    final regionParser = StandardRegionParser();
    final trainerParser = TrainerParser(NameWithInitialsParser());
    final blockParser = SimpleBlockParser();

    final parser = ParticipantParser(
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

    return parser.parse(
      rawGender,
      rawName,
      rawDateOfBirth,
      rawBelt,
      rawSportsQualification,
      rawWeight,
      rawRegion,
      rawTrainer,
      rawBlock,
    );
  }

  group("ParticipantParser_Success", () {
    test("parser should parse all strings input into participant instance", () {
      final gender = "м";
      final name = " Славинский Максим Леонидович";
      final dateOfBirth = "05/10/2011";
      final belt = "4 кю";
      final qualification = "";
      final weight = "60";
      final region = "Хабаровский край";
      final trainers = "Воробьёва А.В.";
      final block = "А";

      final got = parseParticipant(
        gender,
        name,
        dateOfBirth,
        belt,
        qualification,
        weight,
        region,
        trainers,
        block,
      );

      expect(got.gender.label, "м");
      expect(got.name.formatted, "Славинский Максим Леонидович");
      expect(got.dateOfBirth.toString(), "05/10/2011");
      expect(got.belt.toString(), "4 кю");
      expect(got.sportsQualification.toString(), "не указано");
      expect(got.weight.toString(), "60.0");
      expect(got.region.toString(), "Хабаровский край");
      expect(got.trainers.toString(), "Воробьёва А.В.");
      expect(got.block.toString(), "А");
    });
  });
}

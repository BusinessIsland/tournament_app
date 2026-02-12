import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/participant/parser/factory/participant_parser_factory.dart';
import 'package:tournament_app/app/models/participant/participant.dart';

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
    final parser = ParticipantParserFactory.createDefaultParser();

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

      expect(got.gender.shortLabel, "м");
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

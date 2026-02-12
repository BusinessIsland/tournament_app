import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/domain/parts/sports_qualification/parser/sports_qualification_parser.dart';
import 'package:tournament_app/app/domain/parts/sports_qualification/sports_qualification.dart';

void main() {
  late SportsQualificationParser parser;

  setUp(() {
    parser = SportsQualificationParser(qualifications: [
      SportsQualification(
          label: "первый спортивный разряд",
          sortWeight: 10,
          masks: ["1 спорт.р."])
    ]);
  });

  group("AdultRanks_Success", () {
    group("FirstAdultRank_Success", () {
      test("parse_RegExpInput_ReturnsSportsQualificationAsFirstAdultRank", () {
        final given = "1 спорт.р.";
        final got = parser.parse(given);

        expect(got!.label, "первый спортивный разряд");
      });

      test(
        "parse_RegExpInputWithWhitespaces_ReturnsSportsQualificationAsFirstAdultRank",
        () {
          final given = "   1   спорт.р.    ";
          final got = parser.parse(given);

          expect(got!.label, "первый спортивный разряд");
        },
      );

      test("toString_RegExpInput_ReturnsFirstAdultRankDescription", () {
        final given = "1 спорт.р.";
        final got = parser.parse(given);

        expect(got!.label, "первый спортивный разряд");
      });

      test("sortWeight_RegExpInput_Returns 10", () {
        final given = "1 спорт.р.";
        final got = parser.parse(given);

        expect(got!.sortWeight, 10);
      });
    });
  });
}

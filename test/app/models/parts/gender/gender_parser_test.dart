import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/parts/gender/gender.dart';
import 'package:tournament_app/app/models/parts/gender/parser/gender_parser.dart';
import 'package:tournament_app/app/models/parts/gender/parser/builders/gender_parser_builder.dart';

void main() {
  late GenderParser maleParser;
  late GenderParser femaleParser;
  late GenderParser commonParser;

  setUp(() {
    maleParser = GenderParserBuilder().addMaleParser().build();

    femaleParser = GenderParserBuilder().addFemaleParser().build();

    commonParser = GenderParserBuilder()
        .addFemaleParser()
        .addMaleParser()
        .build();
  });

  group("MaleGender_Success", () {
    test("parse_RegExpInput_ReturnsGenderAsMaleGender", () {
      final given = "м";
      final got = maleParser.parse(given);

      expect(got, isA<MaleGender>());
    });

    test("parse_RegExpInputWithWhitespaces_ReturnsGenderAsMaleGender", () {
      final given = " м  ";
      final got = maleParser.parse(given);

      expect(got, isA<MaleGender>());
    });

    test("parse_RegExpInput_StringifyReturnsMaleLabel", () {
      final given = "м";
      final got = maleParser.parse(given);

      expect(got.shortLabel, "м");
    });
  });

  group("FemaleGender_Success", () {
    test("parse_RegExpInput_ReturnsGenderAsFemaleGender", () {
      final given = "ж";
      final got = femaleParser.parse(given);

      expect(got, isA<FemaleGender>());
    });

    test("parse_RegExpInputWithWhitespaces_ReturnsGenderAsFemaleGender", () {
      final given = " ж  ";
      final got = femaleParser.parse(given);

      expect(got, isA<FemaleGender>());
    });

    test("parse_RegExpInput_StringifyReturnsFemaleLabel", () {
      final given = "ж";
      final got = femaleParser.parse(given);

      expect(got.shortLabel, "ж");
    });
  });

  group("UndefinedGender_Success", () {
    test("parse_NonRegExpInput_ReturnsGenderAsUndefinedGender", () {
      final given = "undefined";
      final got = commonParser.parse(given);

      expect(got, isA<UndefinedGender>());
    });
  });
}

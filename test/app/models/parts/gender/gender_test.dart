import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/parts/gender/gender.dart';
import 'package:tournament_app/app/models/parts/gender/gender_parser.dart';

void main() {
  late GenderParser parser;

  setUp(() {
    parser = MaleGenderParser();
    parser.setNext(FemaleGenderParser());
  });

  Gender parseMaleGender(String raw) {
    final parser = MaleGenderParser();
    return parser.parse(raw);
  }

  Gender parseFemaleGender(String raw) {
    final parser = FemaleGenderParser();
    return parser.parse(raw);
  }

  Gender parseGender(String raw) {
    final parser = MaleGenderParser();
    parser.setNext(FemaleGenderParser());
    return parser.parse(raw);
  }

  group("MaleGender_Success", () {
    test("parse_RegExpInput_ReturnsGenderAsMaleGender", () {
      final given = "м";
      final got = parseMaleGender(given);

      expect(got, isA<MaleGender>());
    });

    test("parse_RegExpInputWithWhitespaces_ReturnsGenderAsMaleGender", () {
      final given = " м  ";
      final got = parseMaleGender(given);

      expect(got, isA<MaleGender>());
    });

    test("parse_RegExpInput_StringifyReturnsMaleLabel", () {
      final given = "м";
      final got = parseMaleGender(given);

      expect(got.label, "м");
    });
  });

  group("FemaleGender_Success", () {
    test("parse_RegExpInput_ReturnsGenderAsFemaleGender", () {
      final given = "ж";
      final got = parseFemaleGender(given);

      expect(got, isA<FemaleGender>());
    });

    test("parse_RegExpInputWithWhitespaces_ReturnsGenderAsFemaleGender", () {
      final given = " ж  ";
      final got = parseFemaleGender(given);

      expect(got, isA<FemaleGender>());
    });

    test("parse_RegExpInput_StringifyReturnsFemaleLabel", () {
      final given = "ж";
      final got = parseFemaleGender(given);

      expect(got.label, "ж");
    });
  });

  group("UndefinedGender_Success", () {
    test("parse_NonRegExpInput_ReturnsGenderAsUndefinedGender", () {
      final given = "undefined";
      final got = parseGender(given);

      expect(got, isA<UndefinedGender>());
    });
  });
}

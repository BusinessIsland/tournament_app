import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/domain/parts/date_of_birth/date_of_birth.dart';
import 'package:tournament_app/app/domain/parts/date_of_birth/parser/date_of_birth_parser.dart';

void main() {
  late DateOfBirthParser parser;

  setUp(() {
    parser = DateOfBirthParser();
  });

  group("DateTimeDateOfBirth_Success", () {
    test(
      "parse_RegExpInputAsYYYY-MM-DD_ReturnsDateOfBirthAsDateTimeDateOfBirth",
          () {
        final given = "2004-03-23";
        final got = parser.parse(given);

        expect(got, isA<DateOfBirth>());
      },
    );

    test(
      "parse_RegExpInputAsDD.MM.YYYY_ReturnsDateOfBirthAsDateTimeDateOfBirth",
          () {
        final given = "23.03.2004";
        final got = parser.parse(given);

        expect(got, isA<DateOfBirth>());
      },
    );

    test(
      "parse_RegExpInputAsYYYY/MM/DD_ReturnsDateOfBirthAsDateTimeDateOfBirth",
          () {
        final given = "2004/03/23";
        final got = parser.parse(given);

        expect(got, isA<DateOfBirth>());
      },
    );

    test(
      "parse_RegExpInputAsMM.DD.YYYY_ReturnsDateOfBirthAsDateTimeDateOfBirth",
          () {
        final given = "23-03-2004";
        final got = parser.parse(given);

        expect(got, isA<DateOfBirth>());
      },
    );

    test(
      "parse_RegExpInput_AgeReturnsCorrectAgeWhenDateOfBirthLessThanNow",
          () {
        final given = "23-03-2004";
        final got = parser.parse(given);

        expect(got, isNotNull);
        expect(got!.ageAt(DateTime(2014, 3, 23)), 10);
      },
    );

    test("parse_RegExpInput_AgeReturnsZeroWhenDateOfBirthGreaterThanNow", () {
      final given = "23-03-2054";
      final got = parser.parse(given);

      expect(got!.ageAt(DateTime(2054, 3, 23)), 0);
    });
  });

  group("UndefinedDateOfBirth_Success", () {
    test("parse_NotRegExpInput_ReturnsNull", () {
      final given = "2004.23.03";
      final got = parser.parse(given);

      expect(got, isNull);
    });
  });
}

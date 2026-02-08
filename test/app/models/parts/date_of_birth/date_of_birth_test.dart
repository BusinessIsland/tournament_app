import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/parts/date_of_birth/date_of_birth.dart';
import 'package:tournament_app/app/models/parts/date_of_birth/parser/builders/date_of_birth_parser_builder.dart';
import 'package:tournament_app/app/models/parts/date_of_birth/parser/date_of_birth_parser.dart';

void main() {
  late DateOfBirthParser dateTimeParser;
  late DateOfBirthParser commonParser;

  setUp(() {
    dateTimeParser = DateOfBirthParserBuilder()
        .addDateTimeParser()
        .build();

    commonParser = DateOfBirthParserBuilder()
        .addDateTimeParser()
        .build();
  });

  int calculateAge(DateTime from) {
    final now = DateTime.now();

    int age = now.year - from.year;
    if (now.month < from.month ||
        (now.month == from.month && now.day < from.day)) {
      age--;
    }

    return age;
  }

  group("DateTimeDateOfBirth_Success", () {
    test(
      "parse_RegExpInputAsYYYY-MM-DD_ReturnsDateOfBirthAsDateTimeDateOfBirth",
          () {
        final given = "2004-03-23";
        final got = dateTimeParser.parse(given);

        expect(got, isA<DateTimeDateOfBirth>());
      },
    );

    test(
      "parse_RegExpInputAsDD.MM.YYYY_ReturnsDateOfBirthAsDateTimeDateOfBirth",
          () {
        final given = "23.03.2004";
        final got = dateTimeParser.parse(given);

        expect(got, isA<DateTimeDateOfBirth>());
      },
    );

    test(
      "parse_RegExpInputAsYYYY/MM/DD_ReturnsDateOfBirthAsDateTimeDateOfBirth",
          () {
        final given = "2004/03/23";
        final got = dateTimeParser.parse(given);

        expect(got, isA<DateTimeDateOfBirth>());
      },
    );

    test(
      "parse_RegExpInputAsMM.DD.YYYY_ReturnsDateOfBirthAsDateTimeDateOfBirth",
          () {
        final given = "23-03-2004";
        final got = dateTimeParser.parse(given);

        expect(got, isA<DateTimeDateOfBirth>());
      },
    );

    test("parse_RegExpInput_StringifyReturnsDateAsDD/MM/YYYY", () {
      final given = "23-03-2004";
      final got = dateTimeParser.parse(given);

      expect(got.toString(), "23/03/2004");
    });

    test(
      "parse_RegExpInput_AgeReturnsCorrectAgeWhenDateOfBirthLessThanNow",
          () {
        final given = "23-03-2004";
        final got = dateTimeParser.parse(given);

        expect(got.age, calculateAge(DateTime(2004, 03, 23)));
      },
    );

    test("parse_RegExpInput_AgeReturnsZeroWhenDateOfBirthGreaterThanNow", () {
      final given = "23-03-2054";
      final got = dateTimeParser.parse(given);

      expect(got.age, 0);
    });
  });

  group("UndefinedDateOfBirth_Success", () {
    test("parse_NotRegExpInput_ReturnsDateOfBirthAsUndefinedDateOfBirth", () {
      final given = "2004.23.03";
      final got = commonParser.parse(given);

      expect(got, isA<UndefinedDateOfBirth>());
    });

    test("parse_NotRegExpInput_AgeReturnsZero", () {
      final given = "2004.23.03";
      final got = commonParser.parse(given);

      expect(got.age, 0);
    });

    test("parse_NotRegExpInput_StringifyReturnsText", () {
      final given = "2004.23.03";
      final got = commonParser.parse(given);

      expect(got.toString(), "не указано");
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/parts/name/parser/builders/person_name_parser_builder.dart';
import 'package:tournament_app/app/models/parts/name/person_name.dart';
import 'package:tournament_app/app/models/parts/name/parser/person_name_parser.dart';

void main() {
  late PersonNameParser fullNameParser;
  late PersonNameParser nameWithInitialsParser;
  late PersonNameParser shortNameParser;
  late PersonNameParser commonParser;

  setUp(() {
    fullNameParser = PersonNameParserBuilder().addFullNameParser().build();
    nameWithInitialsParser = PersonNameParserBuilder()
        .addNameWithInitialsParser()
        .build();
    shortNameParser = PersonNameParserBuilder().addShortNameParser().build();
    commonParser = PersonNameParserBuilder()
        .addFullNameParser()
        .addNameWithInitialsParser()
        .addShortNameParser()
        .build();
  });

  group("FullName_Success", () {
    test("parse_RegExpInput_ReturnsPersonNameAsFullName", () {
      final given = "Мисяченко Ярослав Андреевич";
      final got = fullNameParser.parse(given);

      expect(got, isA<FullName>());
    });

    test("parse_RegExpInputWithoutMiddlename_ReturnsPersonNameAsFullName", () {
      final given = "Мисяченко Ярослав";
      final got = fullNameParser.parse(given);

      expect(got, isA<FullName>());
    });

    test("parse_RegExpInputWithWhitespaces_ReturnsPersonNameAsFullName", () {
      final given = "  Мисяченко  Ярослав   Андреевич ";
      final got = fullNameParser.parse(given);

      expect(got, isA<FullName>());
    });

    test("parse_RegExpInput_StringifyReturnsFullname", () {
      final given = "Мисяченко Ярослав Андреевич";
      final got = fullNameParser.parse(given);

      expect(got.formatted, "Мисяченко Ярослав Андреевич");
    });
  });

  group("NameWithInitials_Success", () {
    test("parse_RegExpInput_ReturnsPersonNameAsNameWithInitials", () {
      final given = "Мисяченко Я.М.";
      final got = nameWithInitialsParser.parse(given);

      expect(got, isA<NameWithInitials>());
    });

    test(
      "parse_RegExpInputWithoutMiddleName_ReturnsPersonNameAsNameWithInitials",
      () {
        final given = "Мисяченко Я.";
        final got = nameWithInitialsParser.parse(given);

        expect(got, isA<NameWithInitials>());
      },
    );

    test(
      "parse_RegExpInputWithWhitespaces_ReturnsPersonNameAsNameWithInitials",
      () {
        final given = "  Мисяченко   Я.  М.  ";
        final got = nameWithInitialsParser.parse(given);

        expect(got, isA<NameWithInitials>());
      },
    );

    test("parse_RegExpInput_StringifyReturnsFullNameWithInitials", () {
      final given = "Мисяченко Я.М.";
      final got = nameWithInitialsParser.parse(given);

      expect(got.formatted, "Мисяченко Я.М.");
    });
  });

  group("ShortName_Success", () {
    test("parse_RegExpInput_ReturnsPersonNameAsShortName", () {
      final given = "Мисяченко";
      final got = shortNameParser.parse(given);

      expect(got, isA<ShortName>());
    });

    test("parse_RegExpInputWithWhitespaces_ReturnsPersonNameAsShortName", () {
      final given = "    Мисяченко     ";
      final got = shortNameParser.parse(given);

      expect(got, isA<ShortName>());
    });

    test("parse_RegExpInput_StringifyReturnsLastName", () {
      final given = "Мисяченко";
      final got = shortNameParser.parse(given);

      expect(got.formatted, "Мисяченко");
    });
  });

  group("UndefinedName_Success", () {
    test("parse_NonRegExpInput_ReturnsUndefinedName", () {
      final given = " " * 20;
      final got = commonParser.parse(given);

      expect(got, isA<UndefinedName>());
    });

    test("parse_NonRegExpInput_StringifyNameReturnsText", () {
      final given = " " * 20;
      final got = commonParser.parse(given);

      expect(got.formatted, "не указано");
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/parts/name/person_name.dart';
import 'package:tournament_app/app/models/parts/name/person_name_parser.dart';

void main() {
  PersonName parseFullName(String raw) {
    final parser = FullNameParser();
    return parser.parse(raw);
  }

  PersonName parseNameWithInitials(String raw) {
    final parser = NameWithInitialsParser();
    return parser.parse(raw);
  }

  PersonName parseShortName(String raw) {
    final parser = ShortNameParser();
    return parser.parse(raw);
  }

  PersonName parseName(String raw) {
    final parser = FullNameParser();
    parser.setNext(NameWithInitialsParser()).setNext(ShortNameParser());
    return parser.parse(raw);
  }

  group("FullName_Success", () {
    test("parse_RegExpInput_ReturnsPersonNameAsFullName", () {
      final given = "Мисяченко Ярослав Андреевич";
      final got = parseFullName(given);

      expect(got, isA<FullName>());
    });

    test("parse_RegExpInputWithoutMiddlename_ReturnsPersonNameAsFullName", () {
      final given = "Мисяченко Ярослав";
      final got = parseFullName(given);

      expect(got, isA<FullName>());
    });

    test("parse_RegExpInputWithWhitespaces_ReturnsPersonNameAsFullName", () {
      final given = "  Мисяченко  Ярослав   Андреевич ";
      final got = parseFullName(given);

      expect(got, isA<FullName>());
    });

    test("parse_RegExpInput_StringifyReturnsFullname", () {
      final given = "Мисяченко Ярослав Андреевич";
      final got = parseFullName(given);

      expect(got.formatted, "Мисяченко Ярослав Андреевич");
    });
  });

  group("NameWithInitials_Success", () {
    test("parse_RegExpInput_ReturnsPersonNameAsNameWithInitials", () {
      final given = "Мисяченко Я.М.";
      final got = parseNameWithInitials(given);

      expect(got, isA<NameWithInitials>());
    });

    test("parse_RegExpInputWithoutMiddleName_ReturnsPersonNameAsNameWithInitials", () {
      final given = "Мисяченко Я.";
      final got = parseNameWithInitials(given);

      expect(got, isA<NameWithInitials>());
    });

    test("parse_RegExpInputWithWhitespaces_ReturnsPersonNameAsNameWithInitials", () {
      final given = "  Мисяченко   Я.  М.  ";
      final got = parseNameWithInitials(given);

      expect(got, isA<NameWithInitials>());
    });

    test("parse_RegExpInput_StringifyReturnsFullNameWithInitials", () {
      final given = "Мисяченко Я.М.";
      final got = parseNameWithInitials(given);

      expect(got.formatted, "Мисяченко Я.М.");
    });
  });

  group("ShortName_Success", () {
    test("parse_RegExpInput_ReturnsPersonNameAsShortName", () {
      final given = "Мисяченко";
      final got = parseShortName(given);

      expect(got, isA<ShortName>());
    });

    test("parse_RegExpInputWithWhitespaces_ReturnsPersonNameAsShortName", () {
      final given = "    Мисяченко     ";
      final got = parseShortName(given);

      expect(got, isA<ShortName>());
    });

    test("parse_RegExpInput_StringifyReturnsLastName", () {
      final given = "Мисяченко";
      final got = parseShortName(given);

      expect(got.formatted, "Мисяченко");
    });
  });

  group("UndefinedName_Success", () {
    test("parse_NonRegExpInput_ReturnsUndefinedName", () {
      final given = " " * 20;
      final got = parseName(given);

      expect(got, isA<UndefinedName>());
    });

    test("parse_NonRegExpInput_StringifyNameReturnsText", () {
      final given = " " * 20;
      final got = parseName(given);

      expect(got.formatted, "не указано");
    });
  });
}

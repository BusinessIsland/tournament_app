import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/parts/belt/belt.dart';
import 'package:tournament_app/app/models/parts/belt/belt_parser.dart';

void main() {
  Belt parseKuBelt(String raw) {
    final parser = KuBeltParser();
    return parser.parse(raw);
  }
  
  Belt parseDanBelt(String raw) {
    final parser = DanBeltParser();
    return parser.parse(raw);
  }

  Belt parseBelt(String raw) {
    final parser = KuBeltParser();
    parser.setNext(DanBeltParser());
    return parser.parse(raw);
  }

  group("KuBelt_Success", () {
    test("parse_RegExpInput_ReturnsBeltAsKuBeltType", () {
      final given = "10 кю";
      final got = parseKuBelt(given);

      expect(got, isA<KuBelt>());
    });

    test("parse_RegExpInput_ReturnsKuBeltWithLabel", () {
      final given = "10 кю";
      final got = parseKuBelt(given);

      expect(got.label, "кю");
    });

    test("KuBelt_RegExpInput_ReturnsKuBeltWithNegativePowerLevel", () {
      final given = "2 кю";
      final got = parseKuBelt(given);

      expect(got.powerLevel, -2);
    });

    test("parse_RegExpInput_StringifyReturnsEqualsInput", () {
      final given = "10 кю";
      final got = parseKuBelt(given);

      expect(got.toString(), "10 кю");
    });

    test(
      "parse_RegExpInputWithWhitespaces_StringifyReturnsEqualsInputWithoutWhitespaces",
      () {
        final given = "        10       кю         ";
        final got = parseKuBelt(given);

        expect(got.toString(), "10 кю");
      },
    );

    test(
      "parse_RegExpInputWithUppercase_StringifyReturnsEqualsInputWithLowercase",
      () {
        final given = "10 КЮ";
        final got = parseKuBelt(given);

        expect(got.toString(), "10 кю");
      },
    );

    test(
      "parse_RegExpInputWithUppercaseAndWhitespaces_StringifyReturnsEqualsInputWithLowercaseAndWithoutWhitespaces",
      () {
        final given = "        10       КЮ         ";
        final got = parseKuBelt(given);

        expect(got.toString(), "10 кю");
      },
    );
  });

  group("DanBelt_Success", () {
    test("parse_RegExpInput_ReturnsBeltAsDanBelt", () {
      final given = "3 дан";
      final got = parseDanBelt(given);

      expect(got, isA<DanBelt>());
    });

    test("parse_RegExpInput_ReturnsDanBeltWithLabel", () {
      final given = "3 дан";
      final got = parseDanBelt(given);

      expect(got.label, "дан");
    });

    test("parse_RegExpInput_ReturnsDanBeltWithPositivePowerLevel", () {
      final given = "5 дан";
      final got = parseDanBelt(given);

      expect(got.powerLevel, 5);
    });

    test("parse_RegExpInput_StringifyReturnsEqualsInput", () {
      final given = "2 дан";
      final got = parseDanBelt(given);

      expect(got.toString(), "2 дан");
    });

    test(
      "parse_RegExpInputWithWhitespaces_StringifyReturnsEqualsInputWithoutWhitespaces",
          () {
        final given = "        10       дан         ";
        final got = parseDanBelt(given);

        expect(got.toString(), "10 дан");
      },
    );

    test(
      "parse_RegExpInputWithUppercase_StringifyReturnsEqualsInputWithLowercase",
          () {
        final given = "10 ДАН";
        final got = parseDanBelt(given);

        expect(got.toString(), "10 дан");
      },
    );

    test(
      "parse_RegExpInputWithUppercaseAndWhitespaces_StringifyReturnsEqualsInputWithLowercaseAndWithoutWhitespaces",
          () {
        final given = "        10       ДАН         ";
        final got = parseDanBelt(given);

        expect(got.toString(), "10 дан");
      },
    );
  });

  group("UndefinedBelt_Success", () {
    test("parse_WhitInputWithoutWhitespaces_ReturnsBeltAsUndefinedBelt", () {
      final given = "2кю";
      final got = parseBelt(given);

      expect(got, isA<UndefinedBelt>());
    });

    test("parse_WithInputWithIncorrectPartsOrder_ReturnsBeltAsUndefinedBelt", () {
      final given = "кю 5";
      final got = parseBelt(given);

      expect(got, isA<UndefinedBelt>());
    });

    test("parse_WithInputWithoutRank_ReturnsBeltAsUndefinedBelt", () {
      final given = "кю";
      final got = parseBelt(given);

      expect(got, isA<UndefinedBelt>());
    });

    test("parse_WithInputWithoutLabel_ReturnsBeltAsUndefinedBelt", () {
      final given = "5";
      final got = parseBelt(given);

      expect(got, isA<UndefinedBelt>());
    });
  });
}

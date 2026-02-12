import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/domain/parts/belt/belt.dart';
import 'package:tournament_app/app/domain/parts/belt/parser/belt_pipeline.dart';
import 'package:tournament_app/app/domain/parts/belt/parser/belt_pipeline_builder.dart';

void main() {
  late BeltPipeline pipeline;

  setUp(() {
    final builder = BeltPipelineBuilder();

    builder.addKuBelt().addDanBelt();

    pipeline = builder.build();
  });

  group("KuBelt_Success", () {
    test("parse_RegExpInput_ReturnsBeltAsKuBeltType", () {
      final given = "10 кю";
      final got = pipeline.parse(given);

      expect(got, isA<KuBelt>());
    });

    test("parse_RegExpInput_ReturnsKuBeltWithLabel", () {
      final given = "10 кю";
      final got = pipeline.parse(given);

      expect(got!.label, "кю");
    });

    test("KuBelt_RegExpInput_ReturnsKuBeltWithNegativePowerLevel", () {
      final given = "2 кю";
      final got = pipeline.parse(given);

      expect(got!.powerLevel, -2);
    });

    test("parse_RegExpInput_StringifyReturnsEqualsInput", () {
      final given = "10 кю";
      final got = pipeline.parse(given);

      expect(got.toString(), "10 кю");
    });

    test(
      "parse_RegExpInputWithWhitespaces_StringifyReturnsEqualsInputWithoutWhitespaces",
      () {
        final given = "        10       кю         ";
        final got = pipeline.parse(given);

        expect(got.toString(), "10 кю");
      },
    );

    test(
      "parse_RegExpInputWithUppercase_StringifyReturnsEqualsInputWithLowercase",
      () {
        final given = "10 КЮ";
        final got = pipeline.parse(given);

        expect(got.toString(), "10 кю");
      },
    );

    test(
      "parse_RegExpInputWithUppercaseAndWhitespaces_StringifyReturnsEqualsInputWithLowercaseAndWithoutWhitespaces",
      () {
        final given = "        10       КЮ         ";
        final got = pipeline.parse(given);

        expect(got.toString(), "10 кю");
      },
    );
  });

  group("DanBelt_Success", () {
    test("parse_RegExpInput_ReturnsBeltAsDanBelt", () {
      final given = "3 дан";
      final got = pipeline.parse(given);

      expect(got, isA<DanBelt>());
    });

    test("parse_RegExpInput_ReturnsDanBeltWithLabel", () {
      final given = "3 дан";
      final got = pipeline.parse(given);

      expect(got!.label, "дан");
    });

    test("parse_RegExpInput_ReturnsDanBeltWithPositivePowerLevel", () {
      final given = "5 дан";
      final got = pipeline.parse(given);

      expect(got!.powerLevel, 5);
    });

    test("parse_RegExpInput_StringifyReturnsEqualsInput", () {
      final given = "2 дан";
      final got = pipeline.parse(given);

      expect(got.toString(), "2 дан");
    });

    test(
      "parse_RegExpInputWithWhitespaces_StringifyReturnsEqualsInputWithoutWhitespaces",
          () {
        final given = "        10       дан         ";
        final got = pipeline.parse(given);

        expect(got.toString(), "10 дан");
      },
    );

    test(
      "parse_RegExpInputWithUppercase_StringifyReturnsEqualsInputWithLowercase",
          () {
        final given = "10 ДАН";
        final got = pipeline.parse(given);

        expect(got.toString(), "10 дан");
      },
    );

    test(
      "parse_RegExpInputWithUppercaseAndWhitespaces_StringifyReturnsEqualsInputWithLowercaseAndWithoutWhitespaces",
          () {
        final given = "        10       ДАН         ";
        final got = pipeline.parse(given);

        expect(got.toString(), "10 дан");
      },
    );
  });

  group("UndefinedBelt_Success", () {
    test("parse_WhitInputWithoutWhitespaces_ReturnsBeltAsUndefinedBelt", () {
      final given = "2кю";
      final got = pipeline.parse(given);

      expect(got, isNull);
    });

    test("parse_WithInputWithIncorrectPartsOrder_ReturnsBeltAsUndefinedBelt", () {
      final given = "кю 5";
      final got = pipeline.parse(given);

      expect(got, isNull);
    });

    test("parse_WithInputWithoutRank_ReturnsBeltAsUndefinedBelt", () {
      final given = "кю";
      final got = pipeline.parse(given);

      expect(got, isNull);
    });

    test("parse_WithInputWithoutLabel_ReturnsBeltAsUndefinedBelt", () {
      final given = "5";
      final got = pipeline.parse(given);

      expect(got, isNull);
    });
  });
}

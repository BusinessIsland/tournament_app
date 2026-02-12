import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/domain/parts/name/parser/person_name_pipeline.dart';
import 'package:tournament_app/app/domain/parts/name/parser/person_name_pipeline_builder.dart';
import 'package:tournament_app/app/domain/parts/name/person_name.dart';

void main() {
  late PersonNamePipeline pipeline;

  setUp(() {
    final builder = PersonNamePipelineBuilder();

    builder.addFullName().addInitials().addShortName();

    pipeline = builder.build();
  });

  group("FullName_Success", () {
    test("parse_RegExpInput_ReturnsPersonNameAsFullName", () {
      final given = "Иванов Иван Иванович";
      final got = pipeline.parse(given);

      expect(got, isA<FullName>());
    });

    test("parse_RegExpInputWithoutMiddleName_ReturnsPersonNameAsFullName", () {
      final given = "Мисяченко Ярослав";
      final got = pipeline.parse(given);

      expect(got, isA<FullName>());
    });

    test("parse_RegExpInputWithWhitespaces_ReturnsPersonNameAsFullName", () {
      final given = "  Мисяченко  Ярослав   Андреевич ";
      final got = pipeline.parse(given);

      expect(got, isA<FullName>());
    });

    test("parse_RegExpInput_StringifyReturnsFullName", () {
      final given = "Мисяченко Ярослав Андреевич";
      final got = pipeline.parse(given);

      expect(got!.formatted, "Мисяченко Ярослав Андреевич");
    });
  });

  group("NameWithInitials_Success", () {
    test("parse_RegExpInput_ReturnsPersonNameAsNameWithInitials", () {
      final given = "Мисяченко Я.М.";
      final got = pipeline.parse(given);

      expect(got, isA<NameWithInitials>());
    });

    test(
      "parse_RegExpInputWithoutMiddleName_ReturnsPersonNameAsNameWithInitials",
      () {
        final given = "Мисяченко Я.";
        final got = pipeline.parse(given);

        expect(got, isA<NameWithInitials>());
      },
    );

    test(
      "parse_RegExpInputWithWhitespaces_ReturnsPersonNameAsNameWithInitials",
      () {
        final given = "  Мисяченко   Я.  М.  ";
        final got = pipeline.parse(given);

        expect(got, isA<NameWithInitials>());
      },
    );

    test("parse_RegExpInput_StringifyReturnsFullNameWithInitials", () {
      final given = "Мисяченко Я.М.";
      final got = pipeline.parse(given);

      expect(got!.formatted, "Мисяченко Я.М.");
    });
  });

  group("ShortName_Success", () {
    test("parse_RegExpInput_ReturnsPersonNameAsShortName", () {
      final given = "Мисяченко";
      final got = pipeline.parse(given);

      expect(got, isA<ShortName>());
    });

    test("parse_RegExpInputWithWhitespaces_ReturnsPersonNameAsShortName", () {
      final given = "    Мисяченко     ";
      final got = pipeline.parse(given);

      expect(got, isA<ShortName>());
    });

    test("parse_RegExpInput_StringifyReturnsLastName", () {
      final given = "Мисяченко";
      final got = pipeline.parse(given);

      expect(got!.formatted, "Мисяченко");
    });
  });

  group("UndefinedName_Success", () {
    test("parse_NonRegExpInput_ReturnsUndefinedName", () {
      final given = " " * 20;
      final got = pipeline.parse(given);

      expect(got, isNull);
    });
  });
}

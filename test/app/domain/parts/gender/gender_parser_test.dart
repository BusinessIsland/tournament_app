import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/domain/parts/gender/gender_type.dart';
import 'package:tournament_app/app/domain/parts/gender/parser/gender_pipeline.dart';
import 'package:tournament_app/app/domain/parts/gender/parser/gender_pipeline_builder.dart';

void main() {
  late GenderPipeline pipeline;

  setUp(() {
    final builder = GenderPipelineBuilder();

    builder.addMale().addFemale();

    pipeline = builder.build();
  });

  group("MaleGender_Success", () {
    test("parse_RegExpInput_ReturnsGenderAsMaleGender", () {
      final given = "м";
      final got = pipeline.parse(given);

      expect(got!.type, GenderType.male);
    });

    test("parse_RegExpInputWithWhitespaces_ReturnsGenderAsMaleGender", () {
      final given = " м  ";
      final got = pipeline.parse(given);

      expect(got!.type, GenderType.male);
    });

    test("parse_RegExpInput_StringifyReturnsMaleLabel", () {
      final given = "м";
      final got = pipeline.parse(given);
      
      expect(got!.shortLabel, "м");
    });
  });

  group("FemaleGender_Success", () {
    test("parse_RegExpInput_ReturnsGenderAsFemaleGender", () {
      final given = "ж";
      final got = pipeline.parse(given);

      expect(got!.type, GenderType.female);
    });

    test("parse_RegExpInputWithWhitespaces_ReturnsGenderAsFemaleGender", () {
      final given = " ж  ";
      final got = pipeline.parse(given);

      expect(got!.type, GenderType.female);
    });

    test("parse_RegExpInput_StringifyReturnsFemaleLabel", () {
      final given = "ж";
      final got = pipeline.parse(given);

      expect(got!.shortLabel, "ж");
    });
  });

  group("UndefinedGender_Success", () {
    test("parse_NonRegExpInput_ReturnsGenderAsUndefinedGender", () {
      final given = "undefined";
      final got = pipeline.parse(given);

      expect(got, isNull);
    });
  });
}

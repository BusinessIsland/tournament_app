import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/parts/age_category/age_category.dart';
import 'package:tournament_app/app/models/parts/age_category/parser/builders/age_category_parser_builder_impl.dart';

void main() {
  AgeCategory parse(String? minAge, String? maxAge) {
    final builder = AgeCategoryParserBuilderImpl();

    builder
        .addAboveAgeCategoryParser()
        .addBelowAgeCategoryParser()
        .addRangeAgeCategoryParser()
        .addAbsoluteAgeCategoryParser();

    final parser = builder.build();

    return parser.parse(minAge, maxAge);
  }

  String generateAboveAgeCategoryLabel(int minAge) {
    return "$minAge лет и старше";
  }

  String generateBelowAgeCategoryLabel(int maxAge) {
    return "$maxAge лет и младше";
  }

  String generateRangeAgeCategoryLabel(int minAge, int maxAge) {
    return "$minAge-$maxAge лет";
  }

  String generateAbsoluteAgeCategoryLabel() {
    return "абсолютная возрастная категория";
  }

  group("AgeCategoryParser.parse", () {
    test(
      "parser should create AboveAgeCategory from minAge != null and maxAge == null",
      () {
        final minAge = "14";
        final maxAge = null;

        final parsed = parse(minAge, maxAge);

        expect(parsed, isA<AboveAgeCategory>());
        expect(parsed.label, generateAboveAgeCategoryLabel(14));
      },
    );

    test(
      "parser should create BelowAgeCategory from minAge == null and maxAge != null",
      () {
        final minAge = null;
        final maxAge = "20";

        final parsed = parse(minAge, maxAge);

        expect(parsed, isA<BelowAgeCategory>());
        expect(parsed.label, generateBelowAgeCategoryLabel(20));
      },
    );

    test(
      "parser should create RangeAgeCategory from minAge != null and maxAge != null",
      () {
        final minAge = "14";
        final maxAge = "35";

        final parsed = parse(minAge, maxAge);

        expect(parsed, isA<RangeAgeCategory>());
        expect(parsed.label, generateRangeAgeCategoryLabel(14, 35));
      },
    );

    test(
      "parser should create AbsoluteAgeCategory from minAge == null and maxAge == null",
      () {
        final minAge = null;
        final maxAge = null;

        final parsed = parse(minAge, maxAge);

        expect(parsed, isA<AbsoluteAgeCategory>());
        expect(parsed.label, generateAbsoluteAgeCategoryLabel());
      },
    );
  });
}

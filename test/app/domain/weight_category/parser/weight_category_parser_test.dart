import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/domain/parts/weight_category/parser/weight_category_parser.dart';
import 'package:tournament_app/app/domain/parts/weight_category/weight_category.dart';

void main() {
  late WeightCategoryParser parser;

  setUp(() {
    parser = WeightCategoryParser();
  });

  String generateAboveWeightCategoryLabel(double minWeight) {
    return "$minWeight+ кг";
  }

  String generateBelowWeightCategoryLabel(double maxWeight) {
    return "$maxWeight кг";
  }

  String generateAbsoluteWeightCategoryLabel() {
    return "абсолютная";
  }

  group("WeightCategory.parse", () {
    test(
      "parser should create AboveWeightCategory from minAge != null and maxAge == null",
      () {
        final minWeight = "14";
        final maxWeight = null;

        final parsed = parser.parse(minWeight, maxWeight);

        expect(parsed, isA<AboveWeightCategory>());
        expect(parsed!.label, generateAboveWeightCategoryLabel(14));
      },
    );

    test(
      "parser should create BelowWeightCategory from minAge == null and maxAge != null",
      () {
        final minWeight = null;
        final maxWeight = "20";

        final parsed = parser.parse(minWeight, maxWeight);

        expect(parsed, isA<BelowWeightCategory>());
        expect(parsed!.label, generateBelowWeightCategoryLabel(20));
      },
    );

    test(
      "parser should create AbsoluteWeightCategory from minAge == null and maxAge == null",
      () {
        final minAge = null;
        final maxAge = null;

        final parsed = parser.parse(minAge, maxAge);

        expect(parsed, isA<AbsoluteWeightCategory>());
        expect(parsed!.label, generateAbsoluteWeightCategoryLabel());
      },
    );
  });
}

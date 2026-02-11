import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/weight_category/factory/weight_category_factory.dart';
import 'package:tournament_app/app/models/weight_category/weight_category.dart';

void main() {
  group("create", () {
    test("create above weight category should return WeightCategory", () {
      final category = WeightCategoryFactory.createAboveWeightCategory(minWeight: 30);

      expect(category, isNotNull);
      expect(category, isA<AboveWeightCategory>());
      expect(category.label, "30.0+ кг");
    });

    test("create below weight category should return WeightCategory", () {
      final category = WeightCategoryFactory.createBelowWeightCategory(maxWeight: 20);

      expect(category, isNotNull);
      expect(category, isA<BelowWeightCategory>());
      expect(category.label, "20.0 кг");
    });

    test("create absolute weight category should return WeightCategory", () {
      final category = WeightCategoryFactory.createAbsoluteWeightCategory();

      expect(category, isNotNull);
      expect(category, isA<AbsoluteWeightCategory>());
    });
  });
}
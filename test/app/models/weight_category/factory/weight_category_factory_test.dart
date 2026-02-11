import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/weight_category/weight_category.dart';

void main() {
  late WeightCategoryFactory factory;


  group("create", () {
    test("create above weight category should return WeightCategory", () {
      final category = factory.createAboveWeightCategory(minWeight: 30);

      expect(category, isNotNull);
      expect(category, isA<AboveWeightCategory>());
      expect(category.label, "30+ кг");
    });

    test("create below weight category should return WeightCategory", () {
      final category = factory.createBelowWeightCategory(maxWeight: 20);

      expect(category, isNotNull);
      expect(category, isA<BelowWeightCategory>());
      expect(category.label, "до 20 кг");
    });

    test("create absolute weight category should return WeightCategory", () {
      final category = factory.createAbsoluteWeightCategory();

      expect(category, isNotNull);
      expect(category, isA<AbsoluteWeightCategory>());
    });
  });
}
import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/weight_category/weight_category.dart';

void main() {

  group("WeightCategory.label", () {
    test("BelowWeightCategory returns max weight text", () {
      final category = BelowWeightCategory(maxWeight: 50);

      expect(category.label, "50.0 кг");
    });

    test("AboveWeightCategory returns min weight text", () {
      final category = AboveWeightCategory(minWeight: 100);

      expect(category.label, "100.0+ кг");
    });

    test("AbsoluteWeightCategory returns absolute text", () {
      final category = AbsoluteWeightCategory();

      expect(category.label, "абсолютная");
    });
  });

  group("WeightCategory.match", () {
    test("BelowWeightCategory returns true if weight lte max weight", () {
      final category = BelowWeightCategory(maxWeight: 50);

      expect(category.matches(50), true);
      expect(category.matches(10.2), true);
      expect(category.matches(50.01), false);
    });

    test("AboveWeightCategory returns true if weight gt min weight", () {
      final category = AboveWeightCategory(minWeight: 100);

      expect(category.matches(100), false);
      expect(category.matches(150.5), true);
    });

    test("AbsoluteWeightCategory returns true always", () {
      final category = AbsoluteWeightCategory();

      expect(category.matches(200), true);
    });
  });
}
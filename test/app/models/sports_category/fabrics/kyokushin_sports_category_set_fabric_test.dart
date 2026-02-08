import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/sports_category/factories/kyokushin_sports_category_set_fabric.dart';

void main() {
  group("junior groups", () {
    group("male junior groups", () {
      test("male junior groups should have junior label", () {
        final set = KyokushinSportsCategorySetFabric.createJuniorSet(
          isMale: true,
        );

        expect(set.groupLabel, "юниоры 16-17 лет");
      });

      test("male junior groups should have junior age category", () {
        final set = KyokushinSportsCategorySetFabric.createJuniorSet(
          isMale: true,
        );

        expect(set.ageCategory.label, "16-17 лет");
      });

      test("male junior groups should have 6 weight categories", () {
        final set = KyokushinSportsCategorySetFabric.createJuniorSet(
          isMale: true,
        );

        expect(set.weightCategories.length, 6);
      });
    });
  });
}

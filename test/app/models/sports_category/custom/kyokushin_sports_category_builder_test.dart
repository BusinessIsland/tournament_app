import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/parts/gender/gender.dart';
import 'package:tournament_app/app/models/sports_category/strategies/kyokushin/custom/i_custom_kyokushin_sports_category_builder.dart';
import 'package:tournament_app/app/models/sports_category/strategies/kyokushin/custom/standard_custom_kyokushin_sports_category_builder.dart';
import 'package:tournament_app/app/models/weight_category/weight_category.dart';

void main() {
  int getBelowWeightCategoriesCount(List<WeightCategory> list) {
    return list.whereType<BelowWeightCategory>().length;
  }

  int getAboveWeightCategoriesCount(List<WeightCategory> list) {
    return list.whereType<AboveWeightCategory>().length;
  }

  int getAbsoluteWeightCategoriesCount(List<WeightCategory> list) {
    return list.whereType<AbsoluteWeightCategory>().length;
  }

  int getAllWeightsInBelowWeightCategories(
    List<WeightCategory> list,
    double weight,
  ) {
    return list
        .whereType<BelowWeightCategory>()
        .where((e) => e.maxWeight == weight)
        .length;
  }

  int getAllWeightsInAboveWeightCategories(
    List<WeightCategory> list,
    double weight,
  ) {
    return list
        .whereType<AboveWeightCategory>()
        .where((e) => e.minWeight == weight)
        .length;
  }

  group("kyokushin builder", () {
    late ICustomKyokushinSportsCategoryBuilder builder;

    setUp(() {
      builder = StandardCustomKyokushinSportsCategoryBuilder();
    });

    test("builder with valid params returns SportsCategory", () {
      builder.addWeightCategory(maxWeight: 36.6);
      builder.addWeightCategory(minWeight: 40);
      builder.setAgeCategory(minAge: 10, maxAge: 20);
      builder.setGroupLabel(groupLabel: "девочки 10-20 лет");
      builder.setGender(isMale: false);

      final sportsCategory = builder.build();

      expect(sportsCategory.groupLabel, "девочки 10-20 лет");
      expect(sportsCategory.ageCategory.label, "10-20 лет");
      expect(sportsCategory.gender, isA<FemaleGender>());
      expect(getBelowWeightCategoriesCount(sportsCategory.weightCategories), 1);
      expect(getAboveWeightCategoriesCount(sportsCategory.weightCategories), 1);
      expect(
        getAllWeightsInBelowWeightCategories(
          sportsCategory.weightCategories,
          36.6,
        ),
        1,
      );
      expect(
        getAllWeightsInAboveWeightCategories(
          sportsCategory.weightCategories,
          40,
        ),
        1,
      );
    });

    test(
      "builder with null weight params returns sports category with absolute weight category",
      () {
        builder.addWeightCategory();
        builder.setAgeCategory(minAge: 10, maxAge: 20);
        builder.setGroupLabel(groupLabel: "девочки 10-20 лет");
        builder.setGender(isMale: false);

        final sportsCategory = builder.build();

        expect(sportsCategory.groupLabel, "девочки 10-20 лет");
        expect(sportsCategory.ageCategory.label, "10-20 лет");
        expect(sportsCategory.gender, isA<FemaleGender>());
        expect(
          getAbsoluteWeightCategoriesCount(sportsCategory.weightCategories),
          1,
        );
      },
    );

    test(
      "builder with null age params returns sports category with absolute age category",
      () {
        builder.addWeightCategory(minWeight: 30);
        builder.setAgeCategory();
        builder.setGroupLabel(groupLabel: "девочки 10-20 лет");
        builder.setGender(isMale: false);

        final sportsCategory = builder.build();

        expect(sportsCategory.groupLabel, "девочки 10-20 лет");
        expect(
          sportsCategory.ageCategory.label,
          "абсолютная возрастная категория",
        );
        expect(sportsCategory.gender, isA<FemaleGender>());
        expect(
          getAboveWeightCategoriesCount(sportsCategory.weightCategories),
          1,
        );
      },
    );
  });
}

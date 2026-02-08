


import 'package:tournament_app/app/models/age_category/age_category.dart';
import 'package:tournament_app/app/models/sports_category/sports_category_set.dart';
import 'package:tournament_app/app/models/weight_category/weight_category.dart';

class KyokushinSportsCategorySetFabric {
  static SportsCategorySet createJuniorSet({required bool isMale}) {
    final ageCategory = RangeAgeCategory(minAge: 16, maxAge: 17);

    if (isMale) {
      final groupLabel = "юниоры 16-17 лет";

      final weightCategories = <WeightCategory>[
        BelowWeightCategory(maxWeight: 55),
        BelowWeightCategory(maxWeight: 60),
        BelowWeightCategory(maxWeight: 65),
        BelowWeightCategory(maxWeight: 70),
        BelowWeightCategory(maxWeight: 75),
        AboveWeightCategory(minWeight: 75),
      ];

      return SportsCategorySet(groupLabel: groupLabel, ageCategory: ageCategory, weightCategories: weightCategories);
    } else {
      final groupLabel = "юниорки 16-17 лет";

      final weightCategories = <WeightCategory>[
        BelowWeightCategory(maxWeight: 55),
        BelowWeightCategory(maxWeight: 60),
        BelowWeightCategory(maxWeight: 65),
        BelowWeightCategory(maxWeight: 70),
        BelowWeightCategory(maxWeight: 75),
        AboveWeightCategory(minWeight: 75),
      ];

      return SportsCategorySet(groupLabel: groupLabel, ageCategory: ageCategory, weightCategories: weightCategories);
    }
  }
}
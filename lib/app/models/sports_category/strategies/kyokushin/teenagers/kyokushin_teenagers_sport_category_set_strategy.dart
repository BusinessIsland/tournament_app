import 'package:tournament_app/app/models/age_category/age_category.dart';
import 'package:tournament_app/app/models/parts/gender/gender.dart';
import 'package:tournament_app/app/models/sports_category/sports_category_set.dart';
import 'package:tournament_app/app/models/sports_category/strategies/kyokushin/kyokushin_sport_category_set_strategy.dart';
import 'package:tournament_app/app/models/weight_category/weight_category.dart';

class KyokushinTeenagersSportCategorySetStrategy
    implements KyokushinSportCategorySetStrategy {
  SportsCategorySet _createMaleSet() {
    final groupLabel = "юноши 12-13 лет";
    final ageCategory = RangeAgeCategory(minAge: 12, maxAge: 13);

    final weightCategories = <WeightCategory>[
      BelowWeightCategory(maxWeight: 35),
      BelowWeightCategory(maxWeight: 40),
      BelowWeightCategory(maxWeight: 45),
      BelowWeightCategory(maxWeight: 50),
      BelowWeightCategory(maxWeight: 55),
      AboveWeightCategory(minWeight: 55),
    ];

    return SportsCategorySet(
      groupLabel: groupLabel,
      ageCategory: ageCategory,
      weightCategories: weightCategories,
      gender: MaleGender(),
    );
  }

  SportsCategorySet _createFemaleSet() {
    final groupLabel = "девушки 12-13 лет";
    final ageCategory = RangeAgeCategory(minAge: 12, maxAge: 13);

    final weightCategories = <WeightCategory>[
      BelowWeightCategory(maxWeight: 40),
      BelowWeightCategory(maxWeight: 45),
      BelowWeightCategory(maxWeight: 50),
      BelowWeightCategory(maxWeight: 55),
      AboveWeightCategory(minWeight: 55),
    ];

    return SportsCategorySet(
      groupLabel: groupLabel,
      ageCategory: ageCategory,
      weightCategories: weightCategories,
      gender: FemaleGender(),
    );
  }

  @override
  SportsCategorySet createSet({required bool isMale}) {
    return isMale ? _createMaleSet() : _createFemaleSet();
  }
}

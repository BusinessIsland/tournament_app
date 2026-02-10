import 'package:tournament_app/app/models/age_category/age_category.dart';
import 'package:tournament_app/app/models/parts/gender/gender.dart';
import 'package:tournament_app/app/models/sports_category/sports_category_set.dart';
import 'package:tournament_app/app/models/sports_category/strategies/kyokushin/youths/kyokushin_youths_sport_category_set_strategy.dart';
import 'package:tournament_app/app/models/weight_category/weight_category.dart';

class KyokushinYoungstersSportCategorySetStrategy
    implements KyokushinYouthsSportCategorySetStrategy {
  SportsCategorySet _createMaleSet() {
    final groupLabel = "мальчики 10-11 лет";
    final ageCategory = RangeAgeCategory(minAge: 10, maxAge: 11);

    final weightCategories = <WeightCategory>[
      BelowWeightCategory(maxWeight: 30),
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
    final groupLabel = "девочки 10-11 лет";
    final ageCategory = RangeAgeCategory(minAge: 10, maxAge: 11);

    final weightCategories = <WeightCategory>[
      BelowWeightCategory(maxWeight: 30),
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
      gender: FemaleGender(),
    );
  }

  @override
  SportsCategorySet createSet({required bool isMale}) {
    return isMale ? _createMaleSet() : _createFemaleSet();
  }
}

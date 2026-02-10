import 'package:tournament_app/app/models/age_category/age_category.dart';
import 'package:tournament_app/app/models/parts/gender/gender.dart';
import 'package:tournament_app/app/models/sports_category/sports_category_set.dart';
import 'package:tournament_app/app/models/sports_category/strategies/kyokushin/kyokushin_sport_category_set_strategy.dart';
import 'package:tournament_app/app/models/weight_category/weight_category.dart';

class KyokushinAdultSportCategorySetStrategy
    implements KyokushinSportCategorySetStrategy {
  SportsCategorySet _createMaleSet() {
    final groupLabel = "18 лет и старше";
    final ageCategory = AboveAgeCategory(minAge: 18);

    final weightCategories = <WeightCategory>[
      BelowWeightCategory(maxWeight: 70),
      BelowWeightCategory(maxWeight: 80),
      BelowWeightCategory(maxWeight: 90),
      AboveWeightCategory(minWeight: 80),
      AboveWeightCategory(minWeight: 90),
      AbsoluteWeightCategory()
    ];

    return SportsCategorySet(
      groupLabel: groupLabel,
      ageCategory: ageCategory,
      weightCategories: weightCategories,
      gender: MaleGender(),
    );
  }

  SportsCategorySet _createFemaleSet() {
    final groupLabel = "18 лет и старше";
    final ageCategory = AboveAgeCategory(minAge: 18);

    final weightCategories = <WeightCategory>[
      BelowWeightCategory(maxWeight: 60),
      BelowWeightCategory(maxWeight: 65),
      AboveWeightCategory(minWeight: 60),
      AboveWeightCategory(minWeight: 65),
    ];

    return SportsCategorySet(
      groupLabel: groupLabel,
      ageCategory: ageCategory,
      weightCategories: weightCategories,
      gender: FemaleGender()
    );
  }

  @override
  SportsCategorySet createSet({required bool isMale}) {
    return isMale ? _createMaleSet() : _createFemaleSet();
  }
}

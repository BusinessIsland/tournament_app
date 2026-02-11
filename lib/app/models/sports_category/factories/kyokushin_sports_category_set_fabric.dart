import 'package:tournament_app/app/models/sports_category/sports_category_set.dart';
import 'package:tournament_app/app/models/sports_category/strategies/kyokushin/adults/kyokushin_adult_sport_category_set_strategy.dart';
import 'package:tournament_app/app/models/sports_category/strategies/kyokushin/custom/standard_kyokushin_sports_category_builder.dart';
import 'package:tournament_app/app/models/sports_category/strategies/kyokushin/juniors/kyokushin_junior_sport_category_set_strategy.dart';
import 'package:tournament_app/app/models/sports_category/strategies/kyokushin/teenagers/kyokushin_teenagers_sport_category_set_strategy.dart';
import 'package:tournament_app/app/models/sports_category/strategies/kyokushin/youngsters/kyokushin_youngsters_sport_category_set_strategy.dart';
import 'package:tournament_app/app/models/sports_category/strategies/kyokushin/youths/kyokushin_youths_sport_category_set_strategy.dart';

class KyokushinSportsCategorySetFabric {
  static SportsCategorySet createYoungstersSet({required bool isMale}) {
    return KyokushinYoungstersSportCategorySetStrategy().createSet(
      isMale: isMale,
    );
  }

  static SportsCategorySet createTeenagersSet({required bool isMale}) {
    return KyokushinTeenagersSportCategorySetStrategy().createSet(
      isMale: isMale,
    );
  }

  static SportsCategorySet createYouthsSet({required bool isMale}) {
    return KyokushinYouthsSportCategorySetStrategy().createSet(isMale: isMale);
  }

  static SportsCategorySet createJuniorSet({required bool isMale}) {
    return KyokushinJuniorSportCategorySetStrategy().createSet(isMale: isMale);
  }

  static SportsCategorySet createAdultSet({required bool isMale}) {
    return KyokushinAdultSportCategorySetStrategy().createSet(isMale: isMale);
  }

  static SportsCategorySet createStandardCustomSet({
    required List<(double? minWeight, double? maxWeight)> weights,
    required String groupLabel,
    int? minAge,
    int? maxAge,
    required bool isMale,
  }) {
    final builder = StandardKyokushinSportsCategoryBuilder();

    for (final weightParams in weights) {
      builder.addWeightCategory(
        minWeight: weightParams.$1,
        maxWeight: weightParams.$2,
      );
    }

    builder.setGroupLabel(groupLabel: groupLabel);
    builder.setAgeCategory(minAge: minAge, maxAge: maxAge);
    builder.setGender(isMale: isMale);

    return builder.build();
  }
}

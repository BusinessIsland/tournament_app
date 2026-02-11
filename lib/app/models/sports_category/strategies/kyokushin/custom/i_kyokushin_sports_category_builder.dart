import 'package:tournament_app/app/models/age_category/age_category.dart';
import 'package:tournament_app/app/models/parts/gender/gender.dart';
import 'package:tournament_app/app/models/sports_category/sports_category_set.dart';
import 'package:tournament_app/app/models/weight_category/weight_category.dart';

abstract class IKyokushinSportsCategoryBuilder {
  String groupLabel = "";
  AgeCategory? ageCategory;
  List<WeightCategory> weightCategories = [];

  IKyokushinSportsCategoryBuilder addWeightCategory({
    double? minWeight,
    double? maxWeight,
  });

  IKyokushinSportsCategoryBuilder setGroupLabel({
    required String groupLabel,
  });

  IKyokushinSportsCategoryBuilder setAgeCategory({
    int? minAge,
    int? maxAge,
  });

  IKyokushinSportsCategoryBuilder setGender({required bool isMale});

  SportsCategorySet build();
}

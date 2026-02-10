import 'package:tournament_app/app/models/age_category/age_category.dart';
import 'package:tournament_app/app/models/parts/gender/gender.dart';
import 'package:tournament_app/app/models/sports_category/sports_category_set.dart';
import 'package:tournament_app/app/models/weight_category/weight_category.dart';

abstract class ICustomKyokushinSportsCategoryBuilder {
  String groupLabel = "";
  AgeCategory? ageCategory;
  List<WeightCategory> weightCategories = [];

  ICustomKyokushinSportsCategoryBuilder addWeightCategory({
    double? minWeight,
    double? maxWeight,
  });

  ICustomKyokushinSportsCategoryBuilder setGroupLabel({
    required String groupLabel,
  });

  ICustomKyokushinSportsCategoryBuilder setAgeCategory({
    int? minAge,
    int? maxAge,
  });

  ICustomKyokushinSportsCategoryBuilder setGender({required bool isMale});

  SportsCategorySet build();
}

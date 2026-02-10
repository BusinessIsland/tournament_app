import 'package:tournament_app/app/models/age_category/age_category.dart';
import 'package:tournament_app/app/models/parts/gender/gender.dart';
import 'package:tournament_app/app/models/sports_category/sports_category_set.dart';
import 'package:tournament_app/app/models/sports_category/strategies/kyokushin/custom/i_custom_kyokushin_sports_category_builder.dart';
import 'package:tournament_app/app/models/weight_category/weight_category.dart';

class StandardCustomKyokushinSportsCategoryBuilder
    extends ICustomKyokushinSportsCategoryBuilder {
  final List<WeightCategory> _weightCategories = List<WeightCategory>.empty(
    growable: true,
  );

  AgeCategory? _ageCategory;
  String? _groupLabel;
  Gender? _gender;

  @override
  ICustomKyokushinSportsCategoryBuilder addWeightCategory({
    double? minWeight,
    double? maxWeight,
  }) {
    final category = _createWeightCategory(
      minWeight: minWeight,
      maxWeight: maxWeight,
    );

    _weightCategories.add(category);

    return this;
  }

  @override
  ICustomKyokushinSportsCategoryBuilder setAgeCategory({
    int? minAge,
    int? maxAge,
  }) {
    _ageCategory = _createAgeCategory(minAge: minAge, maxAge: maxAge);

    return this;
  }

  @override
  ICustomKyokushinSportsCategoryBuilder setGroupLabel({
    required String groupLabel,
  }) {
    _groupLabel = groupLabel;
    return this;
  }

  @override
  ICustomKyokushinSportsCategoryBuilder setGender({required bool isMale}) {
    _gender = _createGender(isMale: isMale);
    return this;
  }

  @override
  SportsCategorySet build() {
    return SportsCategorySet(
      groupLabel: _groupLabel ?? "",
      ageCategory: _ageCategory ?? UndefinedAgeCategory(),
      weightCategories: _weightCategories,
      gender: _gender ?? UndefinedGender(),
    );
  }

  WeightCategory _createWeightCategory({double? minWeight, double? maxWeight}) {
    if (minWeight != null && maxWeight == null)
      return AboveWeightCategory(minWeight: minWeight);

    if (minWeight == null && maxWeight != null)
      return BelowWeightCategory(maxWeight: maxWeight);

    return AbsoluteWeightCategory();
  }

  AgeCategory _createAgeCategory({int? minAge, int? maxAge}) {
    if (minAge != null && maxAge != null)
      return RangeAgeCategory(minAge: minAge, maxAge: maxAge);
    if (minAge != null && maxAge == null)
      return AboveAgeCategory(minAge: minAge);
    if (minAge == null && maxAge != null)
      return BelowAgeCategory(maxAge: maxAge);

    return AbsoluteAgeCategory();
  }

  Gender _createGender({required bool isMale}) {
    return isMale ? MaleGender() : FemaleGender();
  }
}

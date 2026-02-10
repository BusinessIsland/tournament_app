import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/age_category/age_category.dart';
import 'package:tournament_app/app/models/sports_category/sports_category_set.dart';
import 'package:tournament_app/app/models/sports_category/strategies/kyokushin/youngsters/kyokushin_youngsters_sport_category_set_strategy.dart';
import 'package:tournament_app/app/models/weight_category/weight_category.dart';

void main() {
  int getBelowWeightCategoriesCount(List<WeightCategory> list) {
    return list.whereType<BelowWeightCategory>().length;
  }

  int getAboveWeightCategoriesCount(List<WeightCategory> list) {
    return list.whereType<AboveWeightCategory>().length;
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

  final expectedMaleGroupLabel = "мальчики 10-11 лет";
  final expectedFemaleGroupLabel = "девочки 10-11 лет";

  final expectedAgeLabel = "10-11 лет";

  group("male sports category", () {
    late SportsCategorySet set;

    setUp(() {
      set = KyokushinYoungstersSportCategorySetStrategy().createSet(isMale: true);
    });

    test("set should have male group label", () {
      expect(set.groupLabel, expectedMaleGroupLabel);
    });

    test("set should have range age category and label", () {
      expect(set.ageCategory, isA<RangeAgeCategory>());
      expect(set.ageCategory.label, expectedAgeLabel);
    });

    test("set should have 7 weight categories", () {
      expect(set.weightCategories.length, 7);
    });

    test("set should have 6 BelowWeightCategory", () {
      expect(getBelowWeightCategoriesCount(set.weightCategories), 6);
    });

    test("set should have 1 AboveWeightCategory", () {
      expect(getAboveWeightCategoriesCount(set.weightCategories), 1);
    });

    test("set should have one 30kg, one 35kg, one 40kg, one 45kg, one 50kg, one 55kg BelowWeightCategory", () {
      expect(getAllWeightsInBelowWeightCategories(set.weightCategories, 30), 1);
      expect(getAllWeightsInBelowWeightCategories(set.weightCategories, 35), 1);
      expect(getAllWeightsInBelowWeightCategories(set.weightCategories, 40), 1);
      expect(getAllWeightsInBelowWeightCategories(set.weightCategories, 45), 1);
      expect(getAllWeightsInBelowWeightCategories(set.weightCategories, 50), 1);
      expect(getAllWeightsInBelowWeightCategories(set.weightCategories, 55), 1);
    });

    test("set should have one 55+kg AboveWeightCategory", () {
      expect(getAllWeightsInAboveWeightCategories(set.weightCategories, 55), 1);
    });
  });

  group("female sports category", () {
    late SportsCategorySet set;

    setUp(() {
      set = KyokushinYoungstersSportCategorySetStrategy().createSet(isMale: false);
    });

    test("set should have female group label", () {
      expect(set.groupLabel, expectedFemaleGroupLabel);
    });

    test("set should have range age category and label", () {
      expect(set.ageCategory, isA<RangeAgeCategory>());
      expect(set.ageCategory.label, expectedAgeLabel);
    });

    test("set should have 7 weight categories", () {
      expect(set.weightCategories.length, 7);
    });

    test("set should have 6 BelowWeightCategory", () {
      expect(getBelowWeightCategoriesCount(set.weightCategories), 6);
    });

    test("set should have 1 AboveWeightCategory", () {
      expect(getAboveWeightCategoriesCount(set.weightCategories), 1);
    });

    test("set should have one 30kg, 35kg, 40kg, 45kg, 50kg, 55kg BelowWeightCategory", () {
      expect(getAllWeightsInBelowWeightCategories(set.weightCategories, 30), 1);
      expect(getAllWeightsInBelowWeightCategories(set.weightCategories, 35), 1);
      expect(getAllWeightsInBelowWeightCategories(set.weightCategories, 40), 1);
      expect(getAllWeightsInBelowWeightCategories(set.weightCategories, 45), 1);
      expect(getAllWeightsInBelowWeightCategories(set.weightCategories, 50), 1);
      expect(getAllWeightsInBelowWeightCategories(set.weightCategories, 55), 1);
    });

    test("set should have one 55+kg AboveWeightCategory", () {
      expect(getAllWeightsInAboveWeightCategories(set.weightCategories, 55), 1);
    });
  });
}
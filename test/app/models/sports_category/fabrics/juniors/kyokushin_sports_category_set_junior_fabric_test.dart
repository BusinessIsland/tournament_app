import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/age_category/age_category.dart';
import 'package:tournament_app/app/models/sports_category/factories/kyokushin_sports_category_set_fabric.dart';
import 'package:tournament_app/app/models/sports_category/sports_category_set.dart';
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

  final expectedMaleGroupLabel = "юниоры 16-17 лет";
  final expectedFemaleGroupLabel = "юниорки 16-17 лет";

  final expectedAgeLabel = "16-17 лет";

  group("male junior groups", () {

    late SportsCategorySet set;

    setUp(() {
      set = KyokushinSportsCategorySetFabric.createJuniorSet(isMale: true);
    });

    test("set should have male junior group label", () {
      expect(set.groupLabel, expectedMaleGroupLabel);
    });

    test("set should have range age category", () {
      expect(set.ageCategory, isA<RangeAgeCategory>());
      expect(set.ageCategory.label, expectedAgeLabel);
    });

    test("set should have 6 weight categories", () {
      expect(set.weightCategories.length, 6);
    });

    test("set should 5 BelowWeightCategory, 1 AboveWeightCategory", () {
      expect(getBelowWeightCategoriesCount(set.weightCategories), 5);
      expect(getAboveWeightCategoriesCount(set.weightCategories), 1);
    });
    
    test("set should have one 55kg, 60kg, 65kg, 70kg, 75kg BelowWeightCategory", () {
      expect(getAllWeightsInBelowWeightCategories(set.weightCategories, 55), 1);
      expect(getAllWeightsInBelowWeightCategories(set.weightCategories, 60), 1);
      expect(getAllWeightsInBelowWeightCategories(set.weightCategories, 65), 1);
      expect(getAllWeightsInBelowWeightCategories(set.weightCategories, 70), 1);
      expect(getAllWeightsInBelowWeightCategories(set.weightCategories, 75), 1);
    });

    test("set should have one 75+kg AboveWeightCategory", () {
      expect(getAllWeightsInAboveWeightCategories(set.weightCategories, 75), 1);
    });
  });

  group("female junior groups", () {

    late SportsCategorySet set;

    setUp(() {
      set = KyokushinSportsCategorySetFabric.createJuniorSet(isMale: false);
    });

    test("set should have female junior label", () {
      expect(set.groupLabel, expectedFemaleGroupLabel);
    });

    test("set should have range age category and label", () {
      expect(set.ageCategory, isA<RangeAgeCategory>());
      expect(set.ageCategory.label, expectedAgeLabel);
    });

    test("set should have 4 weight categories", () {
      expect(set.weightCategories.length, 4);
    });
    
    test("set should have one 50kg, one 55kg, one 60kg BelowWeightCategory", () {
      expect(getAllWeightsInBelowWeightCategories(set.weightCategories, 50), 1);
      expect(getAllWeightsInBelowWeightCategories(set.weightCategories, 55), 1);
      expect(getAllWeightsInBelowWeightCategories(set.weightCategories, 60), 1);
    });
    
    test("set should have one 60+kg AboveWeightCategory", () {
      expect(getAllWeightsInAboveWeightCategories(set.weightCategories, 60), 1);
    });
  });
}
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

  final expectedMaleGroupLabel = "мальчики 5-6 лет";
  final expectedFemaleGroupLabel = "девочки 5-6 лет";

  final expectedAgeLabel = "5-6 лет";

  group("male junior groups", () {
    late SportsCategorySet set;

    setUp(() {
      set = KyokushinSportsCategorySetFabric.createStandardCustomSet(
        weights: <(double? minWeight, double? maxWeight)>[
          (55.0, null),
          (null, 60.0),
        ],
        groupLabel: 'мальчики 5-6 лет',
        isMale: true,
        minAge: 5,
        maxAge: 6,
      );
    });

    test("set should have male custom group label", () {
      expect(set.groupLabel, expectedMaleGroupLabel);
    });

    test("set should have range age category", () {
      expect(set.ageCategory, isA<RangeAgeCategory>());
      expect(set.ageCategory.label, expectedAgeLabel);
    });

    test("set should have 6 weight categories", () {
      expect(set.weightCategories.length, 2);
    });

    test("set should 1 BelowWeightCategory, 1 AboveWeightCategory", () {
      expect(getBelowWeightCategoriesCount(set.weightCategories), 1);
      expect(getAboveWeightCategoriesCount(set.weightCategories), 1);
    });

    test("set should have one 60kg BelowWeightCategory", () {
      expect(getAllWeightsInBelowWeightCategories(set.weightCategories, 60), 1);
    });

    test("set should have one 55+kg AboveWeightCategory", () {
      expect(getAllWeightsInAboveWeightCategories(set.weightCategories, 55), 1);
    });
  });

  group("female junior groups", () {
    late SportsCategorySet set;

    setUp(() {
      set = KyokushinSportsCategorySetFabric.createStandardCustomSet(
        weights: [(30.0, null), (null, 35.0)],
        groupLabel: 'девочки 5-6 лет',
        isMale: false,
        minAge: 5,
        maxAge: 6,
      );
    });

    test("set should have female junior label", () {
      expect(set.groupLabel, expectedFemaleGroupLabel);
    });

    test("set should have range age category and label", () {
      expect(set.ageCategory, isA<RangeAgeCategory>());
      expect(set.ageCategory.label, expectedAgeLabel);
    });

    test("set should have 2 weight categories", () {
      expect(set.weightCategories.length, 2);
    });

    test("set should have one 35kg BelowWeightCategory", () {
      expect(getAllWeightsInBelowWeightCategories(set.weightCategories, 35), 1);
    });

    test("set should have one 30+kg AboveWeightCategory", () {
      expect(getAllWeightsInAboveWeightCategories(set.weightCategories, 30), 1);
    });
  });
}

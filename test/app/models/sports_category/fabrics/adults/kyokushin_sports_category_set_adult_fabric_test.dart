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

  int getAbsoluteWeightCategoriesCount(List<WeightCategory> list) {
    return list.whereType<AbsoluteWeightCategory>().length;
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

  final expectedGroupLabel = "18 лет и старше";
  final expectedAgeLabel = "18 лет и старше";

  group("male adult category set", () {
    late SportsCategorySet set;

    setUp(() {
      set = KyokushinSportsCategorySetFabric.createAdultSet(isMale: true);
    });

    test("set should have adult label", () {
      expect(set.groupLabel, expectedGroupLabel);
    });

    test(
      "set should have age category type as AboveAgeCategory and corresponding label",
      () {
        expect(set.ageCategory, isA<AboveAgeCategory>());
        expect(set.ageCategory.label, expectedAgeLabel);
      },
    );

    test("set should have 6 weight categories", () {
      expect(set.weightCategories.length, 6);
    });

    test(
      "set should have 3 BelowWeightCategories, 2 AboveWeightCategories and 1 AbsoluteWeightCategory",
      () {
        expect(getBelowWeightCategoriesCount(set.weightCategories), 3);
        expect(getAboveWeightCategoriesCount(set.weightCategories), 2);
        expect(getAbsoluteWeightCategoriesCount(set.weightCategories), 1);
      },
    );

    test(
      "set should have one 70kg, one 80kg, one 90kg BelowWeightCategory",
      () {
        expect(
          getAllWeightsInBelowWeightCategories(set.weightCategories, 70),
          1,
        );
        expect(
          getAllWeightsInBelowWeightCategories(set.weightCategories, 80),
          1,
        );
        expect(
          getAllWeightsInBelowWeightCategories(set.weightCategories, 90),
          1,
        );
      },
    );

    test("set should have one 80kg, one 90kg AboveWeightCategory", () {
      expect(getAllWeightsInAboveWeightCategories(set.weightCategories, 80), 1);
      expect(getAllWeightsInAboveWeightCategories(set.weightCategories, 90), 1);
    });
  });

  group("female adult category set", () {
    late SportsCategorySet set;

    setUp(() {
      set = KyokushinSportsCategorySetFabric.createAdultSet(isMale: false);
    });

    test("set should have adult label", () {
      expect(set.groupLabel, expectedGroupLabel);
    });

    test(
      "set should have age category type as AboveAgeCategory and corresponding label",
          () {
        expect(set.ageCategory, isA<AboveAgeCategory>());
        expect(set.ageCategory.label, expectedAgeLabel);
      },
    );

    test("set should have 4 weight categories", () {
      expect(set.weightCategories.length, 4);
    });

    test("set should have 2 BelowWeightCategory, 2 AboveWeightCategory", () {
      expect(getBelowWeightCategoriesCount(set.weightCategories), 2);
      expect(getAboveWeightCategoriesCount(set.weightCategories), 2);
    });

    test("set should have one 60kg, one 65kg BelowWeightCategory", () {
      expect(getAllWeightsInBelowWeightCategories(set.weightCategories, 60), 1);
      expect(getAllWeightsInBelowWeightCategories(set.weightCategories, 65), 1);
    });
    
    test("set should have one 60+kg, one 65+kg AboveWeightCategory", () {
      expect(getAllWeightsInAboveWeightCategories(set.weightCategories, 60), 1);
      expect(getAllWeightsInAboveWeightCategories(set.weightCategories, 65), 1);
    });
  });
}

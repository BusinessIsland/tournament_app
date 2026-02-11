import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/age_category/age_category.dart';
import 'package:tournament_app/app/models/parts/gender/gender.dart';
import 'package:tournament_app/app/models/parts/id/id.dart';
import 'package:tournament_app/app/models/sports_category/sports_category_set.dart';
import 'package:tournament_app/app/models/sports_category/sports_category_set_list.dart';
import 'package:tournament_app/app/models/sports_category/strategies/kyokushin/custom/standard_kyokushin_sports_category_builder.dart';

void main() {
  late SportsCategorySetList list;

  setUp(() {
    list = SportsCategorySetListBasicImpl();
  });

  SportsCategorySet createSet({
    required List<(double? minWeight, double? maxWeight)> weights,
    required String groupLabel,
    int? minAge,
    int? maxAge,
    required bool isMale,
  }) {
    final builder = StandardKyokushinSportsCategoryBuilder();

    builder.setAgeCategory(minAge: minAge, maxAge: maxAge);
    builder.setGroupLabel(groupLabel: groupLabel);
    builder.setGender(isMale: isMale);

    for (final w in weights) {
      builder.addWeightCategory(minWeight: w.$1, maxWeight: w.$2);
    }

    return builder.build();
  }

  group("size", () {
    test("created instance of list should have size 0", () {
      expect(list.size, 0);
    });
  });

  group("findById", () {
    test("findById with unexisting id should return null", () {
      expect(list.findById(Id().toString()), isNull);
    });

    test("findById with existing id should return set that was found", () {
      final set = createSet(
        groupLabel: "мужчины 10-20 лет",
        isMale: true,
        minAge: 10,
        maxAge: 20,
        weights: <(double? minWeight, double? maxWeight)>[
          (20, null),
          (null, 10),
        ],
      );

      list.add(set);

      final found = list.findById(set.id.toString());

      expect(found, isNotNull);
      expect(found?.groupLabel, "мужчины 10-20 лет");
      expect(found?.gender, isA<MaleGender>());
      expect(found?.ageCategory, isA<RangeAgeCategory>());
      expect(found?.weightCategories.length, 2);
    });
  });

  group("add", () {
    test("add should insert set into list, size should be increased by 1", () {
      final set = createSet(
        groupLabel: "мужчины 10-20 лет",
        isMale: true,
        minAge: 10,
        maxAge: 20,
        weights: <(double? minWeight, double? maxWeight)>[
          (20, null),
          (null, 10),
        ],
      );

      list.add(set);

      expect(list.size, 1);
    });
  });

  group("replace", () {
    test("replace with existing id should replace existing set", () {
      final set = createSet(
        groupLabel: "мужчины 10-20 лет",
        isMale: true,
        minAge: 10,
        maxAge: 20,
        weights: <(double? minWeight, double? maxWeight)>[
          (20, null),
          (null, 10),
        ],
      );

      list.add(set);

      final newSet = createSet(
        groupLabel: "мужчины 15-20 лет",
        isMale: true,
        minAge: 15,
        maxAge: 20,
        weights: <(double? minWeight, double? maxWeight)>[
          (50, null),
          (null, 30),
          (null, 25),
        ],
      );

      list.replace(newSet, set.id.toString());

      final found = list.findById(newSet.id.toString());

      expect(list.size, 1);
      expect(found?.groupLabel, "мужчины 15-20 лет");
      expect(found?.ageCategory, isA<RangeAgeCategory>());
      expect(found?.weightCategories.length, 3);
      expect(found?.gender, isA<MaleGender>());
    });
  });

  group("delete", () {
    test("delete with unexisting id should not change size", () {
      final set = createSet(
        groupLabel: "мужчины 10-20 лет",
        isMale: true,
        minAge: 10,
        maxAge: 20,
        weights: <(double? minWeight, double? maxWeight)>[
          (20, null),
          (null, 10),
        ],
      );

      list.add(set);
      list.delete(Id().toString());

      expect(list.size, 1);
    });

    test("delete with existing id should delete set from list", () {
      final set = createSet(
        groupLabel: "мужчины 10-20 лет",
        isMale: true,
        minAge: 10,
        maxAge: 20,
        weights: <(double? minWeight, double? maxWeight)>[
          (20, null),
          (null, 10),
        ],
      );

      list.add(set);
      list.delete(set.id.toString());

      expect(list.size, 0);
      expect(list.findById(set.id.toString()), isNull);
    });
  });
}

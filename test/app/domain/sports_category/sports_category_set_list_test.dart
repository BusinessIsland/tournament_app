import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/parts/age_category/age_category.dart';
import 'package:tournament_app/app/models/parts/gender/gender.dart';
import 'package:tournament_app/app/models/parts/id/id.dart';
import 'package:tournament_app/app/models/sports_category/parser/factory/sports_category_set_parser_factory.dart';
import 'package:tournament_app/app/models/sports_category/sports_category_set.dart';
import 'package:tournament_app/app/models/sports_category/sports_category_set_list.dart';

void main() {
  late SportsCategorySetList list;

  setUp(() {
    list = SportsCategorySetListBasicImpl();
  });

  SportsCategorySet createSet({
    required String rawGroupLabel,
    String? rawMinAge,
    String? rawMaxAge,
    required String rawGender,
    required List<(String? minWeight, String? maxWeight)> rawWeights,
  }) {
    final parser = SportsCategorySetParserFactory.createDefaultParser();

    return parser.parse(rawGroupLabel, rawGender, rawMinAge, rawMaxAge, rawWeights);
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
        rawGroupLabel: "мужчины 10-20 лет",
        rawGender: "м",
        rawMinAge: "10",
        rawMaxAge: "20",
        rawWeights: <(String? minWeight, String? maxWeight)>[
          ("20", null),
          (null, "10"),
        ],
      );

      list.add(set);

      final found = list.findById(set.id.toString());

      expect(found, isNotNull);
      expect(found?.groupLabel.label, "мужчины 10-20 лет");
      expect(found?.gender, isA<MaleGender>());
      expect(found?.ageCategory, isA<RangeAgeCategory>());
      expect(found?.weightCategories.length, 2);
    });
  });

  group("add", () {
    test("add should insert set into list, size should be increased by 1", () {
      final set = createSet(
        rawGroupLabel: "мужчины 10-20 лет",
        rawGender: "м",
        rawMinAge: "10",
        rawMaxAge: "20",
        rawWeights: <(String? minWeight, String? maxWeight)>[
          ("20", null),
          (null, "10"),
        ],
      );

      list.add(set);

      expect(list.size, 1);
    });
  });

  group("replace", () {
    test("replace with existing id should replace existing set", () {
      final set = createSet(
        rawGroupLabel: "мужчины 10-20 лет",
        rawGender: "м",
        rawMinAge: "10",
        rawMaxAge: "20",
        rawWeights: <(String? minWeight, String? maxWeight)>[
          ("20", null),
          (null, "10"),
        ],
      );

      list.add(set);

      final newSet = createSet(
        rawGroupLabel: "мужчины 15-20 лет",
        rawGender: "м",
        rawMinAge: "15",
        rawMaxAge: "20",
        rawWeights: <(String? minWeight, String? maxWeight)>[
          ("50", null),
          (null, "30"),
          (null, "25"),
        ],
      );

      list.replace(newSet, set.id.toString());

      final found = list.findById(newSet.id.toString());

      expect(list.size, 1);
      expect(found?.groupLabel.label, "мужчины 15-20 лет");
      expect(found?.ageCategory, isA<RangeAgeCategory>());
      expect(found?.weightCategories.length, 3);
      expect(found?.gender, isA<MaleGender>());
    });
  });

  group("delete", () {
    test("delete with unexisting id should not change size", () {
      final set = createSet(
        rawGroupLabel: "мужчины 10-20 лет",
        rawGender: "м",
        rawMinAge: "10",
        rawMaxAge: "20",
        rawWeights: <(String? minWeight, String? maxWeight)>[
          ("20", null),
          (null, "10"),
        ],
      );

      list.add(set);
      list.delete(Id().toString());

      expect(list.size, 1);
    });

    test("delete with existing id should delete set from list", () {
      final set = createSet(
        rawGroupLabel: "мужчины 10-20 лет",
        rawGender: "м",
        rawMinAge: "10",
        rawMaxAge: "20",
        rawWeights: <(String? minWeight, String? maxWeight)>[
          ("20", null),
          (null, "10"),
        ],
      );

      list.add(set);
      list.delete(set.id.toString());

      expect(list.size, 0);
      expect(list.findById(set.id.toString()), isNull);
    });
  });
}

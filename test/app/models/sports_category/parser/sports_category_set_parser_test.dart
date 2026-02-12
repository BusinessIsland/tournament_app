import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/parts/age_category/age_category.dart';
import 'package:tournament_app/app/models/parts/gender/gender.dart';
import 'package:tournament_app/app/models/sports_category/parser/factory/sports_category_set_parser_factory.dart';
import 'package:tournament_app/app/models/sports_category/sports_category_set.dart';

void main() {
  SportsCategorySet parse(
    String? rawGroupLabel,
    String? rawGender,
    String? rawMinAge,
    String? rawMaxAge,
    List<(String? rawMinWeight, String? rawMaxWeight)> rawWeights,
  ) {
    final parser = SportsCategorySetParserFactory.createDefaultParser();

    return parser.parse(rawGroupLabel, rawGender, rawMinAge, rawMaxAge, rawWeights);
  }

  group("SportsCategorySetParser.parse", () {
    final rawGroupLabel = "юноши 14-15 лет";
    final rawGender = "м";
    final rawMinAge = "14";
    final rawMaxAge = "15";
    final rawWeights = <(String? rawMinWeight, String? rawMaxWeight)>[
      ("22.5", null),
      (null, "50,5"),
      ("22", null)
    ];

    test("parser should create new sports category set", () {
      final parsed = parse(rawGroupLabel, rawGender, rawMinAge, rawMaxAge, rawWeights);

      expect(parsed.groupLabel.label, rawGroupLabel);
      expect(parsed.gender, isA<MaleGender>());
      expect(parsed.ageCategory, isA<RangeAgeCategory>());
      expect(parsed.weightCategories.length, 3);
    });
  });
}

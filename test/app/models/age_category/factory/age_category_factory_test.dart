import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/parts/age_category/age_category.dart';
import 'package:tournament_app/app/models/parts/age_category/factory/age_category_factory.dart';

void main() {

  group("above age category factory", () {
    final label = "20 лет и старше";

    test("with minAge = 20 and maxAge = null should create AboveAgeCategory with label", () {
      final ageCategory = AgeCategoryFactory.createAboveAgeCategory(minAge: 20);

      expect(ageCategory, isA<AboveAgeCategory>());
      expect(ageCategory.label, label);
    });
  });

  group("below age category factory", () {
    final label = "10 лет и младше";

    test("with maxAge = 10 and minAge = null should create BelowAgeCategory with label", () {
      final ageCategory = AgeCategoryFactory.createBelowAgeCategory(maxAge: 10);

      expect(ageCategory, isA<BelowAgeCategory>());
      expect(ageCategory.label, label);
    });
  });

  group("range age category factory", () {
    final label = "20-50 лет";

    test("with minAge = 20 and maxAge = 50 should create RangeAgeCategory with label", () {
      final ageCategory = AgeCategoryFactory.createRangeAgeCategory(minAge: 20, maxAge: 50);

      expect(ageCategory, isA<RangeAgeCategory>());
      expect(ageCategory.label, label);
    });
  });

  group("AgeCategoryFactory.createAbsoluteAgeCategory", () {
    final label = "абсолютная возрастная категория";

    test("create should return absolute age category", () {
      final ageCategory = AgeCategoryFactory.createAbsoluteAgeCategory();

      expect(ageCategory, isA<AbsoluteAgeCategory>());
      expect(ageCategory.label, label);
    });
  });
}
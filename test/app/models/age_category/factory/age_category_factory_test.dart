import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/age_category/age_category.dart';
import 'package:tournament_app/app/models/age_category/factory/age_category_factory.dart';

void main() {

  group("above age category factory", () {
    test("with minAge = 20 and maxAge = null should create AboveAgeCategory with label", () {
      final ageCategory = AgeCategoryFactory.createAboveAgeCategory(minAge: 20);

      expect(ageCategory, isA<AboveAgeCategory>());
      expect(ageCategory.label, "20 лет и старше");
    });
  });

  group("below age category factory", () {
    test("with maxAge = 10 and minAge = null should create BelowAgeCategory with label", () {
      final ageCategory = AgeCategoryFactory.createBelowAgeCategory(maxAge: 10);

      expect(ageCategory, isA<BelowAgeCategory>());
      expect(ageCategory.label, "10 лет и младше");
    });
  });

  group("range age category factory", () {
    test("with minAge = 20 and maxAge = 50 should create RangeAgeCategory with label", () {
      final ageCategory = AgeCategoryFactory.createRangeAgeCategory(minAge: 20, maxAge: 50);

      expect(ageCategory, isA<RangeAgeCategory>());
      expect(ageCategory.label, "20-50 лет");
    });
  });

  group("AgeCategoryFactory.createAbsoluteAgeCategory", () {
    test("create should return absolute age category", () {
      final ageCategory = AgeCategoryFactory.createAbsoluteAgeCategory();

      expect(ageCategory, isA<AbsoluteAgeCategory>());
      expect(ageCategory.label, "абсолютная возрастная категория");
    });
  });
}
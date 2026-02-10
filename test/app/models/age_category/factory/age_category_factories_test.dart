import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/age_category/age_category.dart';
import 'package:tournament_app/app/models/age_category/factory/above_age_category_factory.dart';
import 'package:tournament_app/app/models/age_category/factory/below_age_category_factory.dart';
import 'package:tournament_app/app/models/age_category/factory/i_age_category_factory.dart';
import 'package:tournament_app/app/models/age_category/factory/range_age_category_factory.dart';

void main() {

  group("above age category factory", () {

    late IAgeCategoryFactory factory;

    setUp(() {
      factory = AboveAgeCategoryFactory();
    });

    final aboveAge20Label = "20 лет и старше";

    test("with minAge = 20 and maxAge = null should create AboveAgeCategory with label", () {
      final ageCategory = factory.create(minAge: 20);

      expect(ageCategory, isA<AboveAgeCategory>());
      expect(ageCategory.label, aboveAge20Label);
    });

    test("with minAge = 20 and maxAge = 10 should create AboveAgeCategory with label", () {
      final ageCategory = factory.create(minAge: 20, maxAge: 10);

      expect(ageCategory, isA<AboveAgeCategory>());
      expect(ageCategory.label, aboveAge20Label);
    });

    test("with minAge = null and maxAge = null should create UndefinedAgeCategory", () {
      final ageCategory = factory.create();

      expect(ageCategory, isA<UndefinedAgeCategory>());
    });

    test("with minAge = null and maxAge = 50 should create UndefinedAgeCategory", () {
      final ageCategory = factory.create(maxAge: 50);

      expect(ageCategory, isA<UndefinedAgeCategory>());
    });
  });

  group("below age category factory", () {

    late IAgeCategoryFactory factory;

    setUp(() {
      factory = BelowAgeCategoryFactory();
    });

    final belowAge10Label = "10 лет и младше";

    test("with maxAge = 10 and minAge = null should create BelowAgeCategory with label", () {
      final ageCategory = factory.create(maxAge: 10);

      expect(ageCategory, isA<BelowAgeCategory>());
      expect(ageCategory.label, belowAge10Label);
    });

    test("with maxAge = 10 and minAge = 20 should create BelowAgeCategory with label", () {
      final ageCategory = factory.create(maxAge: 10, minAge: 20);

      expect(ageCategory, isA<BelowAgeCategory>());
      expect(ageCategory.label, belowAge10Label);
    });

    test("with maxAge = null and minAge = null should create UndefinedAgeCategory", () {
      final ageCategory = factory.create();

      expect(ageCategory, isA<UndefinedAgeCategory>());
    });

    test("with maxAge = null and minAge = 20 should create UndefinedAgeCategory", () {
      final ageCategory = factory.create(minAge: 20);

      expect(ageCategory, isA<UndefinedAgeCategory>());
    });
  });

  group("range age category factory", () {
    late IAgeCategoryFactory factory;

    setUp(() {
      factory = RangeAgeCategoryFactory();
    });

    final rangeMin20AndMax50Label = "20-50 лет";

    test("with minAge = 20 and maxAge = 50 should create RangeAgeCategory with label", () {
      final ageCategory = factory.create(minAge: 20, maxAge: 50);

      expect(ageCategory, isA<RangeAgeCategory>());
      expect(ageCategory.label, rangeMin20AndMax50Label);
    });

    test("with minAge = null and maxAge = 20 should create UndefinedAgeCategory", () {
      final ageCategory = factory.create(maxAge: 20);

      expect(ageCategory, isA<UndefinedAgeCategory>());
    });

    test("with minAge = 50 and maxAge = null should create UndefinedAgeCategory", () {
      final ageCategory = factory.create(minAge: 50);

      expect(ageCategory, isA<UndefinedAgeCategory>());
    });

    test("with minAge = null and maxAge = null should create UndefinedAgeCategory", () {
      final ageCategory = factory.create();

      expect(ageCategory, isA<UndefinedAgeCategory>());
    });
  });
}
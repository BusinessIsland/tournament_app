import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/age_category/age_category.dart';

void main() {
  group("AgeCategory.label", () {
    test("InnerAgeCategory returns min-max age text", () {
      final category = RangeAgeCategory(minAge: 7, maxAge: 9);

      expect(category.label, "7-9 лет");
    });

    test("BelowAgeCategory returns min-age text", () {
      final category = BelowAgeCategory(maxAge: 7);

      expect(category.label, "7 лет и младше");
    });

    test("AboveAgeCategory returns max-age text", () {
      final category = AboveAgeCategory(minAge: 20);

      expect(category.label, "20 лет и старше");
    });

    test("AbsoluteAgeCategory returns absolute text", () {
      final category = AbsoluteAgeCategory();

      expect(category.label, "абсолютная возрастная категория");
    });
  });

  group("AgeCategory.match", () {
    test("InnerAgeCategory returns true, if age between min and max age", () {
      final category = RangeAgeCategory(minAge: 10, maxAge: 20);

      expect(category.matches(20), true);
      expect(category.matches(10), true);
      expect(category.matches(15), true);
    });

    test("BelowAgeCategory returns true, if age lte max age", () {
      final category = BelowAgeCategory(maxAge: 10);

      expect(category.matches(10), true);
      expect(category.matches(5), true);
    });

    test("AboveAgeCategory returns true, if age gte min age", () {
      final category = AboveAgeCategory(minAge: 20);

      expect(category.matches(20), true);
      expect(category.matches(40), true);
    });

    test("AbsoluteAgeCategory returns true always", () {
      final category = AbsoluteAgeCategory();

      expect(category.matches(20), true);
      expect(category.matches(40), true);
    });
  });
}
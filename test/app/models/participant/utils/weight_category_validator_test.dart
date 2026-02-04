import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/participant/utils/age_category.dart';
import 'package:tournament_app/app/models/participant/utils/gender.dart';
import 'package:tournament_app/app/models/participant/utils/weight_category.dart';
import 'package:tournament_app/app/models/participant/utils/weight_category_validator.dart';

void main() {
  group('CategoryMatcher Algorithm', () {
    test('should assign 44.5kg to u45 category for u14 male', () {
      final result = WeightCategoryValidator.findWeightCategory(
        age: AgeCategory.u14,
        gender: Gender.male,
        weight: 44.5,
      );
      expect(result, equals(WeightCategory.u45));
    });

    test('should assign 52.0kg to u55 category for u14 male', () {
      final result = WeightCategoryValidator.findWeightCategory(
        age: AgeCategory.u14,
        gender: Gender.male,
        weight: 52.0,
      );
      expect(result, equals(WeightCategory.u55));
    });

    test("should assign 101kg to u90g", () {
      final result = WeightCategoryValidator.findWeightCategory(
        age: AgeCategory.adult,
        gender: Gender.male,
        weight: 101,
      );
      expect(result, equals(WeightCategory.u90g));
    });

    test("should assign 89kg to u90", () {
      final result = WeightCategoryValidator.findWeightCategory(
        age: AgeCategory.adult,
        gender: Gender.male,
        weight: 89,
      );
      expect(result, equals(WeightCategory.u90));
    });
  });
}
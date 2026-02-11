import 'package:tournament_app/app/models/age_category/age_category.dart';

abstract class AgeCategoryFactory {
  static AgeCategory createAboveAgeCategory({required int minAge}) {
    return AboveAgeCategory(minAge: minAge);
  }

  static AgeCategory createBelowAgeCategory({required int maxAge}) {
    return BelowAgeCategory(maxAge: maxAge);
  }

  static AgeCategory createRangeAgeCategory({required int minAge, required int maxAge}) {
    return RangeAgeCategory(minAge: minAge, maxAge: maxAge);
  }

  static AgeCategory createAbsoluteAgeCategory() {
    return AbsoluteAgeCategory();
  }
}
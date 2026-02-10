import 'package:tournament_app/app/models/age_category/age_category.dart';
import 'package:tournament_app/app/models/age_category/factory/i_age_category_factory.dart';

class RangeAgeCategoryFactory implements IAgeCategoryFactory {
  @override
  AgeCategory create({int? minAge, int? maxAge}) {
    if (minAge != null && maxAge != null) {
      return RangeAgeCategory(minAge: minAge, maxAge: maxAge);
    }
    return UndefinedAgeCategory();
  }
}

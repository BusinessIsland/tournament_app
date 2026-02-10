import 'package:tournament_app/app/models/age_category/age_category.dart';
import 'package:tournament_app/app/models/age_category/factory/i_age_category_factory.dart';

class BelowAgeCategoryFactory implements IAgeCategoryFactory {
  @override
  AgeCategory create({int? minAge, int? maxAge}) {
    if (maxAge != null) return BelowAgeCategory(maxAge: maxAge);
    return UndefinedAgeCategory();
  }
}

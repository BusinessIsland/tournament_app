import 'package:tournament_app/app/models/age_category/age_category.dart';
import 'package:tournament_app/app/models/age_category/factory/i_age_category_factory.dart';

class AboveAgeCategoryFactory extends IAgeCategoryFactory {
  @override
  AgeCategory create({int? minAge, int? maxAge}) {
    if (minAge == null) return UndefinedAgeCategory();
    if (minAge <= 0 || minAge > 100) return UndefinedAgeCategory();

    return AboveAgeCategory(minAge: minAge);
  }
}

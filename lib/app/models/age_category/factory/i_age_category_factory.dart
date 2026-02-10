import 'package:tournament_app/app/models/age_category/age_category.dart';

abstract class IAgeCategoryFactory {
  AgeCategory create({int? minAge, int? maxAge});
}
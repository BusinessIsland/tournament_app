import 'package:tournament_app/app/models/age_category/age_category.dart';
import 'package:tournament_app/app/models/weight_category/weight_category.dart';

class SportsCategorySet {
  final String groupLabel;
  final AgeCategory ageCategory;
  final List<WeightCategory> weightCategories;

  const SportsCategorySet({
    required this.groupLabel,
    required this.ageCategory,
    required this.weightCategories,
  });
}

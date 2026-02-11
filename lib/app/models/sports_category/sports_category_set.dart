import 'package:tournament_app/app/models/age_category/age_category.dart';
import 'package:tournament_app/app/models/parts/gender/gender.dart';
import 'package:tournament_app/app/models/parts/id/id.dart';
import 'package:tournament_app/app/models/weight_category/weight_category.dart';

class SportsCategorySet {
  final Id id;
  final String groupLabel;
  final AgeCategory ageCategory;
  final List<WeightCategory> weightCategories;
  final Gender gender;

  const SportsCategorySet({
    required this.id,
    required this.groupLabel,
    required this.ageCategory,
    required this.weightCategories,
    required this.gender,
  });
}

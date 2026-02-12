import 'package:tournament_app/app/models/parts/age_category/age_category.dart';
import 'package:tournament_app/app/models/parts/weight_category/weight_category.dart';

class ParticipantCategory {
  final AgeCategory ageCategory;
  final WeightCategory weightCategory;
  final String label;

  const ParticipantCategory({
    required this.ageCategory,
    required this.weightCategory,
    required this.label,
  });

  bool matches({required int age, required double weight}) =>
      ageCategory.matches(age) && weightCategory.matches(weight);
}

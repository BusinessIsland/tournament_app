import 'package:tournament_app/app/domain/parts/age_category/age_category.dart';
import 'package:tournament_app/app/domain/parts/gender/gender.dart';
import 'package:tournament_app/app/domain/parts/group_label/group_label.dart';
import 'package:tournament_app/app/domain/parts/id/id.dart';
import 'package:tournament_app/app/domain/parts/weight_category/weight_category.dart';

class SportsCategorySet {
  final Id id;
  final GroupLabel groupLabel;
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

  @override
  String toString() {
    return 'SportsCategorySet{id: $id, groupLabel: $groupLabel, ageCategory: $ageCategory, weightCategories: $weightCategories, gender: $gender}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SportsCategorySet &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}

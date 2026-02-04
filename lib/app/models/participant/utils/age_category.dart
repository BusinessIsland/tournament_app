import 'package:tournament_app/app/models/participant/utils/gender.dart';

enum AgeCategory {
  u7(
    label: "5-6 лет",
    minAge: 5,
    maxAge: 6,
    femaleDescription: "девочки",
    maleDescription: "мальчики",
  ),
  u10(label: "7-9 лет", minAge: 7, maxAge: 9, femaleDescription: "девочки", maleDescription: "мальчики"),
  u12(label: "10-11 лет", minAge: 10, maxAge: 11, femaleDescription: "девочки", maleDescription: "мальчики"),
  u14(label: '12-13 лет', minAge: 12, maxAge: 13, femaleDescription: "девушки", maleDescription: "юноши"),
  u16(label: "14-15 лет", minAge: 14, maxAge: 15, femaleDescription: "девушки", maleDescription: "юноши"),
  u18(label: "16-17 лет", minAge: 16, maxAge: 17, femaleDescription: "юниоры", maleDescription: "юниорки"),
  adult(label: "18 лет и старше", minAge: 18, maxAge: 1000, femaleDescription: "женщины", maleDescription: "мужчины");

  final String label;
  final String femaleDescription;
  final String maleDescription;
  final int minAge;
  final int maxAge;

  const AgeCategory({
    required this.label,
    required this.femaleDescription,
    required this.maleDescription,
    required this.minAge,
    required this.maxAge,
  });

  bool contains(int age) => age >= minAge && age <= maxAge;

  String getDescription(Gender gender) {
    return gender.isMale ? maleDescription : femaleDescription;
  }

  static AgeCategory? fromAge(int age) {
    for (var category in AgeCategory.values) {
      if (category.contains(age)) return category;
    }

    return null;
  }
}

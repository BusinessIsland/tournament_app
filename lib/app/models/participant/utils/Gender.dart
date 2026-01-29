
// пол участника
enum Gender {
  male,
  female
}

// расширение для получения строкового описания значения Gender
extension GenderStringifier on Gender {
  String toStringGender() {
    switch (name) {
      case "male":
        return "мужчина";
      case "female":
        return "женщина";
      default:
        return "";
    }
  }
}
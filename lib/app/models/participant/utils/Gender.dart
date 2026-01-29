// пол участника
enum Gender {
  male,
  female;

  // фабричный метод для конвертации строкового значения (из Excel) в перечисление
  factory Gender.fromSheet(String rawGender) {
    switch (rawGender) {
      case "м":
      case "М":
        return Gender.male;
      case "ж":
      case "Ж":
        return Gender.female;
      default:
        throw FormatException(
          "неудалось получить пол участника в: '$rawGender'. возможные значения: 'м, М, ж, Ж'",
        );
    }
  }
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

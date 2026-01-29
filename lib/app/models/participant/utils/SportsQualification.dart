// перечисление квалификации (звание или разряд)
enum SportsQualification {
  title,
  category,
  undefined,
}

// расширение для получения строкового описания значения SportsQualification
extension SportsQualificationStringifier on SportsQualification {
  String toStringSportsQualification() {
    switch (name) {
      case "title":
        return "звание";
      case "category":
        return "разряд";
      case "undefined":
        return "не указано";
      default:
        return "";
    }
  }
}
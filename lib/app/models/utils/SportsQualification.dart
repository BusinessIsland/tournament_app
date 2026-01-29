// перечисление квалификации (звание или разряд)
enum SportsQualification {
  title,
  category
}

// расширение для получения строкового описания значения SportsQualification
extension SportsQualificationStringifier on SportsQualification {
  String toStringSportsQualification() {
    switch (name) {
      case "title":
        return "звание";
      case "category":
        return "разряд";
      default:
        return "";
    }
  }
}
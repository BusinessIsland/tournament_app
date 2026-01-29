
// Перечисление спортивных разрядов
enum SportsCategory {
  candidateForMasterOfSports,
  firstSportsCategory,
  secondSportsCategory,
  thirdSportsCategory,
  firstYouthSportsCategory,
  secondYouthSportsCategory,
  thirdYouthSportsCategory
}

// расширение для получения строкового описания значения SportsCategory
extension SportsCategoryStringifier on SportsCategory {
  String toStringSportsCategory() {
    switch (name) {
      case "candidateForMasterOfSports":
        return "кандидат в мастера спорта";
      case "firstSportsCategory":
        return "первый спортивный разряд";
      case "secondSportsCategory":
        return "второй спортивный разряд";
      case "thirdSportsCategory":
        return "третий спортивный разряд";
      case "firstYouthSportsCategory":
        return "первый юношеский спортивный разряд";
      case "secondYouthSportsCategory":
        return "второй юношеский спортивный разряд";
      case "thirdYouthSportsCategory":
        return "третий юношеский спортивный разряд";
      default:
        return "";
    }
  }
}
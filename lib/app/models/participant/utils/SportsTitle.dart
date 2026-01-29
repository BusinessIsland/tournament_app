
// Перечисление спортивных званий
enum SportsTitle {
  masterOfSportsOfInternationalClass,
  masterOfSports,
  grandmaster
}

// расширение для получения строкового описания значения SportsTitle
extension SportsTitleStringifier on SportsTitle {
  String toStringSportsTitle() {
    switch (name) {
      case "masterOfSportsOfInternationalClass":
        return "мастер спорта России международного класса";
      case "masterOfSports":
        return "мастер спорта России";
      case "grandmaster":
        return "гроссмейстер России";
      default:
        return "";
    }
  }
}
// Перечисление спортивных разрядов и званий
enum SportsTitle {
  // спортивные разряды
  candidateForMasterOfSports,
  firstSportsCategory,
  secondSportsCategory,
  thirdSportsCategory,
  firstYouthSportsCategory,
  secondYouthSportsCategory,
  thirdYouthSportsCategory,

  // спортивные звания
  masterOfSportsOfInternationalClass,
  masterOfSports,
  grandmaster,
  undefined;

  factory SportsTitle.fromSheet(String rawSportsTitle) {
    final trimmed = rawSportsTitle.trim();

    switch (trimmed) {
      case "1 юн.р.":
        return SportsTitle.firstYouthSportsCategory;
      case "2 юн.р.":
        return SportsTitle.secondYouthSportsCategory;
      case "3 юн.р.":
        return SportsTitle.thirdYouthSportsCategory;
      case "1 спорт.р.":
        return SportsTitle.firstSportsCategory;
      case "2 спорт.р.":
        return SportsTitle.secondSportsCategory;
      case "3 спорт.р.":
        return SportsTitle.thirdSportsCategory;
      case "КМС":
        return SportsTitle.candidateForMasterOfSports;
      case "МС":
        return SportsTitle.masterOfSports;
      case "ММС":
        return SportsTitle.masterOfSportsOfInternationalClass;
      case "гроссмейстер":
        return SportsTitle.grandmaster;
      default:
        return SportsTitle.undefined;
    }
  }

  @override
  String toString() {
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
      case "masterOfSportsOfInternationalClass":
        return "мастер спорта России международного класса";
      case "masterOfSports":
        return "мастер спорта России";
      case "grandmaster":
        return "гроссмейстер России";
      case "undefined":
        return "не указано";
      default:
        return "";
    }
  }
}

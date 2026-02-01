// Перечисление спортивных разрядов и званий
enum SportsTitle {
  grandmaster(
    description: "гроссмейстер России",
    aliases: ["гроссмейстер", "ГР"],
    sheetAlias: "ГР",
    weight: 10,
  ),
  masterOfSportsOfInternationalClass(
    description: "мастер спорта России международного класса",
    aliases: ["МСМК", "ММС"],
    sheetAlias: "МСМК",
    weight: 9,
  ),
  masterOfSports(
    description: "мастер спорта России",
    aliases: ["МС"],
    sheetAlias: "МС",
    weight: 8,
  ),
  candidateMaster(
    description: "кандидат в мастера спорта",
    aliases: ["КМС"],
    sheetAlias: "КМС",
    weight: 7,
  ),
  firstSports(
    description: "первый спортивный разряд",
    aliases: ["1 спорт.р.", "1ср", "1 ср", "1 сп.р."],
    sheetAlias: "1 спорт.р.",
    weight: 6,
  ),
  secondSports(
    description: "второй спортивный разряд",
    aliases: ["2 спорт.р.", "2ср", "2 ср", "2 сп.р."],
    sheetAlias: "2 спорт.р.",
    weight: 5,
  ),
  thirdSports(
    description: "третий спортивный разряд",
    aliases: ["3 спорт.р.", "3ср", "3 ср", "3 сп.р."],
    sheetAlias: "3 спорт.р.",
    weight: 4,
  ),
  firstYouthSports(
    description: "первый юношеский спортивный разряд",
    aliases: ["1 юнош.р.", "1юр", "1 юр", "1 юн.р."],
    sheetAlias: "1 юнош.р.",
    weight: 3,
  ),
  secondYouthSports(
    description: "второй юношеский спортивный разряд",
    aliases: ["2 юнош.р.", "2юр", "2 юр", "2 юн.р."],
    sheetAlias: "2 юнош.р.",
    weight: 2,
  ),
  thirdYouthSports(
    description: "третий юношеский спортивный разряд",
    aliases: ["3 юнош.р.", "3юр", "3 юр", "3 юн.р."],
    sheetAlias: "3 юнош.р.",
    weight: 1,
  ),
  undefined(description: "не указано", aliases: [], sheetAlias: "-", weight: 0);

  final String description;
  final List<String> aliases;
  final String sheetAlias;
  final int weight;

  const SportsTitle({
    required this.description,
    required this.aliases,
    required this.sheetAlias,
    required this.weight,
  });

  factory SportsTitle.withValidation(String raw) {
    final trimmed = raw.trim().toLowerCase();

    if (trimmed.isEmpty || trimmed == "-") return SportsTitle.undefined;

    return SportsTitle.values.firstWhere(
      (type) => type.aliases.any((a) => a.toLowerCase() == trimmed),
      orElse: () => SportsTitle.undefined,
    );
  }

  @override
  String toString() => description;
}

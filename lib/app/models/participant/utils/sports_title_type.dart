enum SportsTitleType {
  grandmaster(
    label: "гроссмейстер России",
    shortLabel: "ГР",
    aliases: ["гроссмейстер", "ГР"],
    weight: 10,
  ),
  masterOfSportsOfInternationalClass(
    label: "мастер спорта России международного класса",
    shortLabel: "МСМК",
    aliases: ["МСМК", "ММС"],
    weight: 9,
  ),
  masterOfSports(
    label: "мастер спорта России",
    shortLabel: "МС",
    aliases: ["МС"],
    weight: 8,
  ),
  candidateMaster(
    label: "кандидат в мастера спорта",
    shortLabel: "КМС",
    aliases: ["КМС"],
    weight: 7,
  ),
  firstSports(
    label: "первый спортивный разряд",
    shortLabel: "1 спорт.р.",
    aliases: ["1 спорт.р.", "1ср", "1 ср", "1 сп.р."],
    weight: 6,
  ),
  secondSports(
    label: "второй спортивный разряд",
    shortLabel: "2 спорт.р.",
    aliases: ["2 спорт.р.", "2ср", "2 ср", "2 сп.р."],
    weight: 5,
  ),
  thirdSports(
    label: "третий спортивный разряд",
    shortLabel: "3 спорт.р.",
    aliases: ["3 спорт.р.", "3ср", "3 ср", "3 сп.р."],
    weight: 4,
  ),
  firstYouthSports(
    label: "первый юношеский спортивный разряд",
    shortLabel: "1 юнош.р.",
    aliases: ["1 юнош.р.", "1юр", "1 юр", "1 юн.р."],
    weight: 3,
  ),
  secondYouthSports(
    label: "второй юношеский спортивный разряд",
    shortLabel: "2 юнош.р.",
    aliases: ["2 юнош.р.", "2юр", "2 юр", "2 юн.р."],
    weight: 2,
  ),
  thirdYouthSports(
    label: "третий юношеский спортивный разряд",
    shortLabel: "3 юнош.р.",
    aliases: ["3 юнош.р.", "3юр", "3 юр", "3 юн.р."],
    weight: 1,
  ),
  undefined(label: "не указано", shortLabel: "-", weight: 0);

  final String label;
  final String shortLabel;
  final List<String>? aliases;
  final int weight;

  const SportsTitleType({
    required this.label,
    required this.shortLabel,
    this.aliases,
    required this.weight,
  });
}
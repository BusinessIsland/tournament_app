enum GenderType {
  male(label: "мужчина", shortLabel: "м", aliases: ["м", "муж"]),
  female(label: "женщина", shortLabel: "ж", aliases: ["ж", "жен"]),
  undefined(label: "не указано", shortLabel: "-");

  final String label;
  final String shortLabel;
  final List<String>? aliases;

  const GenderType({
    required this.label,
    required this.shortLabel,
    this.aliases,
  });
}

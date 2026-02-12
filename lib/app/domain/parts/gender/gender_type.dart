enum GenderType {
  male(label: "мужчина", shortLabel: "м"),
  female(label: "женщина", shortLabel: "ж");

  final String label;
  final String shortLabel;

  const GenderType({required this.label, required this.shortLabel});
}

abstract class SportsQualification {
  final String label;
  final int weight;

  SportsQualification({required this.label, required this.weight});
}

class UndefinedSportsQualification extends SportsQualification {
  UndefinedSportsQualification() : super(label: "не указано", weight: -1000);
}
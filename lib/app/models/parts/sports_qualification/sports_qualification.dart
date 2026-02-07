abstract class SportsQualification {
  final String label;
  final int sortWeight;

  SportsQualification({required this.label, required this.sortWeight});

  @override
  String toString() => label;
}

class UndefinedSportsQualification extends SportsQualification {
  UndefinedSportsQualification() : super(label: "не указано", sortWeight: -1000);
}
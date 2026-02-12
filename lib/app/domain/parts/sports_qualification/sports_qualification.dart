class SportsQualification {
  final String label;
  final int sortWeight;
  final List<String> masks;

  SportsQualification(
      {required this.label, required this.sortWeight, required this.masks});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SportsQualification &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          sortWeight == other.sortWeight;

  @override
  int get hashCode => Object.hash(label, sortWeight);

  @override
  String toString() {
    return 'SportsQualification{label: $label, sortWeight: $sortWeight, masks: $masks}';
  }
}
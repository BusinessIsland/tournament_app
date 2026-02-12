class Region {
  final String label;

  const Region({required this.label});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Region &&
          runtimeType == other.runtimeType &&
          label == other.label;

  @override
  int get hashCode => label.hashCode;

  @override
  String toString() {
    return 'Region{label: $label}';
  }
}

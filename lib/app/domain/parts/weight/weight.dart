class Weight {
  final double value;

  const Weight({required this.value});

  String get label => value.toStringAsFixed(1);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Weight &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'Weight{value: $value}';
  }
}

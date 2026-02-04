class Region {
  final String value;

  Region(this.value);

  factory Region.withValidation(String? raw) {
    if (raw == null) {
      return Region("");
    }

    return Region(raw.trim());
  }

  @override
  String toString() {
    return 'Region{value: $value}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Region &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}
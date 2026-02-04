class Block {
  static const String _defaultValue = "не указано";
  final String value;

  Block(this.value);

  factory Block.fromString(String? raw) {
    if (raw == null) {
      return Block(_defaultValue);
    }
    return Block(raw.trim());
  }

  @override
  String toString() => value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Block &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

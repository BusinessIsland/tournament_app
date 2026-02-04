class Block {
  final String value;

  Block(this.value);

  factory Block.withValidation(String? raw) {
    if (raw == null) {
      return Block("");
    }
    return Block(raw.trim());
  }

  @override
  String toString() {
    return 'Block{value: $value}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Block &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

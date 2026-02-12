class Block {
  final String label;

  const Block({required this.label});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Block &&
          runtimeType == other.runtimeType &&
          label == other.label;

  @override
  int get hashCode => label.hashCode;

  @override
  String toString() {
    return 'Block{label: $label}';
  }
}

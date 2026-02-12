sealed class Block {
  final String label;

  Block({required this.label});

  @override
  String toString();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Block &&
          runtimeType == other.runtimeType &&
          label == other.label;

  @override
  int get hashCode => label.hashCode;
}

class StandardBlock extends Block {
  StandardBlock(String label) : super(label: label);

  @override
  String toString() => label;
}

class UndefinedBlock extends Block {
  UndefinedBlock() : super(label: "не указано");

  @override
  String toString() => label;
}

sealed class Block {
  final String label;

  Block({required this.label});

  String get stringify;

  @override
  String toString() => label;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Block &&
          runtimeType == other.runtimeType &&
          label == other.label;

  @override
  int get hashCode => label.hashCode;
}

class SimpleBlock extends Block {
  SimpleBlock(String value) : super(label: value);

  @override
  String get stringify => label;
}

class UndefinedBlock extends Block {
  UndefinedBlock() : super(label: "не указано");

  @override
  String get stringify => label;
}

sealed class Weight {
  final double value;

  Weight({required this.value});

  String get stringify;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Weight &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

class SimpleWeight extends Weight {
  SimpleWeight(double value) : super(value: value);

  @override
  String get stringify => value.toString();
}

class UndefinedWeight extends Weight {
  UndefinedWeight() : super(value: 0);

  @override
  String get stringify => "не указано";
}
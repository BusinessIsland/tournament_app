sealed class Region {
  final String value;

  Region({required this.value});

  String get stringified;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Region &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

class StandardRegion extends Region {
  StandardRegion(String value) : super(value: value);

  @override
  String get stringified => value;
}

class UndefinedRegion extends Region {
  UndefinedRegion() : super(value: "не указано");

  @override
  String get stringified => "не указано";
}
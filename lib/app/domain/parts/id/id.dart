class Id {
  final int value;

  const Id._({required this.value});

  factory Id.newId(int nextValue) => Id._(value: nextValue);

  factory Id.fromInt(int value) => Id._(value: value);

  @override
  String toString() => value.toString();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Id && runtimeType == other.runtimeType &&
              value == other.value;

  @override
  int get hashCode => value.hashCode;
}

import 'package:uuid/uuid.dart';

class Id {
  final String value;

  Id() : value = const Uuid().v4();

  @override
  String toString() => value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Id && runtimeType == other.runtimeType &&
              value == other.value;

  @override
  int get hashCode => value.hashCode;
}

import 'package:intl/intl.dart';

sealed class DateOfBirth {
  DateTime? get value;

  int get age;

  @override
  String toString();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateOfBirth &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

class DateTimeDateOfBirth extends DateOfBirth {
  @override
  final DateTime value;

  DateTimeDateOfBirth(this.value);

  @override
  int get age {
    final now = DateTime.now();

    int age = now.year - value.year;
    if (now.month < value.month ||
        (now.month == value.month && now.day < value.day)) {
      age--;
    }
    return age > 0 ? age : 0;
  }

  @override
  String toString() => DateFormat("dd/MM/yyyy").format(value);
}

class UndefinedDateOfBirth extends DateOfBirth {
  @override
  DateTime? get value => null;

  @override
  int get age => 0;

  @override
  String toString() => "не указано";
}

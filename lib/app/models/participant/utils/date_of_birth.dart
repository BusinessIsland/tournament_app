import 'package:intl/intl.dart';
import 'package:tournament_app/app/exceptions/invalid_age.dart';

class DateOfBirth {
  final DateTime? value;

  DateOfBirth(this.value);

  factory DateOfBirth.fromString(String? raw) {
    if (raw == null) {
      return DateOfBirth(null);
    }

    DateTime? parsedDate = DateTime.tryParse(raw);

    if (parsedDate == null) {
      final formats = [
        DateFormat("yyyy-MM-dd"),
        DateFormat("dd.MM.yyyy"),
        DateFormat("yyyy/MM/dd"),
      ];

      for (var format in formats) {
        try {
          parsedDate = format.parseStrict(raw);
          break;
        } catch (_) {}
      }
    }

    if (parsedDate == null) {
      return DateOfBirth(null);
    }

    if (parsedDate.isAfter(DateTime.now())) {
      return DateOfBirth(null);
    }

    return DateOfBirth(parsedDate);
  }

  int get age {
    if (value == null) {
      throw InvalidAge(
        "дата рождения указана неверно, поэтому получить возраст участника нельзя",
      );
    }

    final now = DateTime.now();
    int age = now.year - value!.year;
    if (now.month < value!.month ||
        (now.month == value!.month && now.day < value!.day)) {
      age--;
    }
    return age;
  }

  @override
  String toString() {
    if (value == null) {
      return "не указано";
    }
    return DateFormat("dd.MM.yyyy").format(value!);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateOfBirth &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

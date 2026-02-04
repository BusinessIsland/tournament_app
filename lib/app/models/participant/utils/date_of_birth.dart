import 'package:intl/intl.dart';
import 'package:tournament_app/app/exceptions/invalid_data_type.dart';

class DateOfBirth {
  final DateTime value;

  DateOfBirth(this.value);

  factory DateOfBirth.withValidation(String? raw) {
    if (raw == null) {
      throw InvalidDataType(
        "Дата рождения участника '$raw': дата рождения обязательна для заполнения",
      );
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
      throw InvalidDataType(
        "Дата рождения '$raw' не является датой в формате ГГГГ-ММ-ДД или ДД.ММ.ГГГГ или ГГГГ/ММ/ДД",
      );
    }

    if (parsedDate.isAfter(DateTime.now().toUtc())) {
      throw InvalidDataType("Дата рождения '$raw' не может быть в будущем");
    }

    return DateOfBirth(parsedDate);
  }

  int get age {
    final now = DateTime.now();
    int age = now.year - value.year;
    if (now.month < value.month ||
        (now.month == value.month && now.day < value.day)) {
      age--;
    }
    return age;
  }

  @override
  String toString() => DateFormat("dd.MM.yyyy").format(value);

  String toIsoString() => DateFormat("yyyy-MM-dd").format(value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateOfBirth &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

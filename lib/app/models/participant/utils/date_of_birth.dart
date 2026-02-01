import 'package:intl/intl.dart';
import 'package:tournament_app/app/exceptions/invalid_data_type.dart';

class DateOfBirth {
  DateTime dateOfBirth;

  DateOfBirth(this.dateOfBirth);

  factory DateOfBirth.withValidation(String raw) {
    final formats = [
      DateFormat("yyyy-MM-dd"),
      DateFormat("dd.MM.yyyy"),
      DateFormat("yyyy/MM/dd"),
    ];

    DateTime? parsedDate;
    for (var format in formats) {
      try {
        parsedDate = format.parse(raw, true);
        break;
      } catch (_) {}
    }

    if (parsedDate == null) {
      throw InvalidDataType("Дата рождения '$raw' не является датой в формате ГГГГ-ММ-ДД или ДД.ММ.ГГГГ или ГГГГ/ММ/ДД");
    }

    if (parsedDate.isAfter(DateTime.now())) {
      throw InvalidDataType("Дата рождения '$raw' не может быть в будущем");
    }

    return DateOfBirth(parsedDate);
  }
  
  int get age {
    final now = DateTime.now();
    int age = now.year - dateOfBirth.year;
    if (now.month < dateOfBirth.month ||
        (now.month == dateOfBirth.month && now.day < dateOfBirth.day)) {
      age--;
    }
    return age;
  }

  @override
  String toString() => DateFormat("dd.MM.yyyy").format(dateOfBirth);

  String toIsoString() => DateFormat("yyyy-MM-dd").format(dateOfBirth);
}
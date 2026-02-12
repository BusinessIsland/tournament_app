import 'package:intl/intl.dart';
import 'package:tournament_app/app/models/parts/date_of_birth/date_of_birth.dart';

class DateOfBirthParser {
  final List<DateFormat> formats = [
    DateFormat("yyyy-MM-dd"),
    DateFormat("dd.MM.yyyy"),
    DateFormat("yyyy/MM/dd"),
    DateFormat("dd-MM-yyyy"),
    DateFormat("dd/MM/yyyy"),
  ];

  DateOfBirth parse(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return UndefinedDateOfBirth();
    }

    final prepared = _normalize(raw);

    var value = _tryParse(prepared);
    if (value != null) return value;

    return UndefinedDateOfBirth();
  }

  DateTimeDateOfBirth? _tryParse(String raw) {
    final parsed = DateTime.tryParse(raw);

    if (parsed != null) return DateTimeDateOfBirth(parsed);
    return _tryParseWithFormats(raw);
  }

  DateTimeDateOfBirth? _tryParseWithFormats(String raw) {
    for (final format in formats) {
      try {
        return DateTimeDateOfBirth(format.parseStrict(raw));
      } catch (_) {}
    }

    return null;
  }

  String _normalize(String raw) {
    return raw.trim().replaceAll(RegExp(r"\s+"), " ");
  }
}

import 'package:intl/intl.dart';
import 'package:tournament_app/app/domain/parts/date_of_birth/date_of_birth.dart';

class DateOfBirthParser {
  final List<DateFormat> formats = [
    DateFormat("yyyy-MM-dd"),
    DateFormat("dd.MM.yyyy"),
    DateFormat("yyyy/MM/dd"),
    DateFormat("dd-MM-yyyy"),
    DateFormat("dd/MM/yyyy"),
  ];

  DateOfBirth? parse(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return null;
    }

    final prepared = _normalize(raw);

    var value = _tryParse(prepared);
    if (value != null) return value;

    return null;
  }

  DateOfBirth? _tryParse(String raw) {
    final parsed = DateTime.tryParse(raw);

    if (parsed != null) return DateOfBirth(value: parsed);
    return _tryParseWithFormats(raw);
  }

  DateOfBirth? _tryParseWithFormats(String raw) {
    for (final format in formats) {
      try {
        return DateOfBirth(value: format.parseStrict(raw));
      } catch (_) {}
    }

    return null;
  }

  String _normalize(String raw) {
    return raw.trim().replaceAll(RegExp(r"\s+"), " ");
  }
}

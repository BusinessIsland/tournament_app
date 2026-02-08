import 'package:intl/intl.dart';
import 'package:tournament_app/app/models/parts/date_of_birth/date_of_birth.dart';

abstract class DateOfBirthParser {
  DateOfBirthParser? _next;

  DateOfBirthParser setNext(DateOfBirthParser nextParser) {
    _next = nextParser;
    return nextParser;
  }

  DateOfBirth parse(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return _next?.parse(raw) ?? UndefinedDateOfBirth();
    }

    final prepared = raw.trim().replaceAll(RegExp(r"\s+"), " ");

    final result = concreteParse(prepared);
    if (result != null) return result;

    return _next?.parse(raw) ?? UndefinedDateOfBirth();
  }

  DateOfBirth? concreteParse(String raw);
}

class DateTimeDateOfBirthParser extends DateOfBirthParser {
  DateOfBirth? _tryParseDateTime(String raw) {
    final parsed = DateTime.tryParse(raw);

    if (parsed == null) return null;

    return DateTimeDateOfBirth(parsed);
  }

  DateOfBirth? _tryParseDateTimeFromFormats(String raw) {
    final List<DateFormat> formats = [
      DateFormat("yyyy-MM-dd"),
      DateFormat("dd.MM.yyyy"),
      DateFormat("yyyy/MM/dd"),
      DateFormat("dd-MM-yyyy"),
      DateFormat("dd/MM/yyyy"),
    ];

    DateTime? parsed;
    for (final format in formats) {
      try {
        parsed = format.parseStrict(raw);
        break;
      } catch (_) {}
    }

    return parsed == null ? null : DateTimeDateOfBirth(parsed);
  }

  @override
  DateOfBirth? concreteParse(String raw) {
    var value = _tryParseDateTime(raw);
    if (value != null) return value;

    value = _tryParseDateTimeFromFormats(raw);
    if (value != null) return value;

    return null;
  }
}

import 'package:tournament_app/app/models/parts/name/person_name.dart';
import 'package:tournament_app/app/models/parts/name/person_name_regexp.dart';

abstract class PersonNameParser {
  PersonNameParser? _next;

  PersonNameParser setNext(PersonNameParser nextParser) {
    _next = nextParser;
    return nextParser;
  }

  PersonName parse(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return _next?.parse(raw) ?? UndefinedName();
    }

    final result = concreteParse(raw.trim());
    if (result != null) return result;

    return _next?.parse(raw) ?? UndefinedName();
  }

  PersonName? concreteParse(String raw);
}

class FullNameParser extends PersonNameParser {
  PersonName? _tryParseFullNameWithBothFirstNameAndMiddleName(String raw) {
    final match = FullNameRegexp.fullNameWithBothFirstNameAndMiddleName
        .firstMatch(raw);

    return match == null
        ? null
        : FullName(
            lastName: match.namedGroup("last")!,
            firstName: match.namedGroup("first")!,
            middleName: match.namedGroup("middle")!,
          );
  }

  PersonName? _tryParseFullNameWithFirstName(String raw) {
    final match = FullNameRegexp.fullNameWithFirstName.firstMatch(raw);

    return match == null
        ? null
        : FullName(
            lastName: match.namedGroup("last")!,
            firstName: match.namedGroup("first")!,
            middleName: "",
          );
  }

  @override
  PersonName? concreteParse(String raw) {
    var parsed = _tryParseFullNameWithBothFirstNameAndMiddleName(raw);
    if (parsed != null) return parsed;

    parsed = _tryParseFullNameWithFirstName(raw);
    if (parsed != null) return parsed;

    return null;
  }
}

class NameWithInitialsParser extends PersonNameParser {
  PersonName? _tryParseLastNameWithBothInitials(String raw) {
    final match = NameWithInitialsRegexp.lastNameWithBothInitials.firstMatch(
      raw,
    );
    return match == null
        ? null
        : NameWithInitials(
            lastName: match.namedGroup('last')!,
            firstNameInitial: match.namedGroup('f')!,
            middleNameInitial: match.namedGroup('m')!,
          );
  }

  PersonName? _tryParseLastNameWithFirstNameInitial(String raw) {
    final match = NameWithInitialsRegexp.lastNameWithFirstNameInitial
        .firstMatch(raw);

    return match == null
        ? null
        : NameWithInitials(
            lastName: match.namedGroup('last')!,
            firstNameInitial: match.namedGroup('f')!,
            middleNameInitial: "",
          );
  }

  @override
  PersonName? concreteParse(String raw) {
    var value = _tryParseLastNameWithBothInitials(raw);
    if (value != null) return value;

    value = _tryParseLastNameWithFirstNameInitial(raw);
    if (value != null) return value;

    return null;
  }
}

class ShortNameParser extends PersonNameParser {
  PersonName? _tryParseLastNameOnly(String raw) {
    final match = ShortNameRegexp.lastNameOnly.firstMatch(raw);

    return match == null
        ? null
        : ShortName(lastName: match.namedGroup("last")!);
  }

  @override
  PersonName? concreteParse(String raw) {
    var value = _tryParseLastNameOnly(raw);
    if (value != null) return value;

    return null;
  }
}

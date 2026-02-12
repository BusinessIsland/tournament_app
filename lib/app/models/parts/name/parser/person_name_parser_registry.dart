import 'package:tournament_app/app/models/parts/name/parser/person_name_pattern_parser.dart';
import 'package:tournament_app/app/models/parts/name/parser/patterns/full_name_pattern.dart';
import 'package:tournament_app/app/models/parts/name/parser/patterns/name_with_initials_pattern.dart';
import 'package:tournament_app/app/models/parts/name/parser/patterns/short_name_pattern.dart';
import 'package:tournament_app/app/models/parts/name/person_name.dart';

class PersonNameParserRegistry {
  static PersonNamePatternParser fullName() => PersonNamePatternParser([
    (
      FullNamePattern.bothNames,
      (m) => FullName(
        lastName: m.namedGroup("last")!,
        firstName: m.namedGroup("first")!,
        middleName: m.namedGroup("middle")!,
      ),
    ),
    (
      FullNamePattern.firstOnly,
      (m) => FullName(
        lastName: m.namedGroup("last")!,
        firstName: m.namedGroup("first")!,
        middleName: "",
      ),
    ),
  ]);

  static PersonNamePatternParser initials() => PersonNamePatternParser([
    (
      NameWithInitialsPattern.bothInitials,
      (m) => NameWithInitials(
        lastName: m.namedGroup("last")!,
        firstNameInitial: m.namedGroup("f")!,
        middleNameInitial: m.namedGroup("m")!,
      ),
    ),
    (
      NameWithInitialsPattern.firstNameInitialOnly,
      (m) => NameWithInitials(
        lastName: m.namedGroup("last")!,
        firstNameInitial: m.namedGroup("f")!,
        middleNameInitial: "",
      ),
    ),
  ]);

  static PersonNamePatternParser shortName() => PersonNamePatternParser([
    (
      ShortNamePattern.lastNameOnly,
      (m) => ShortName(lastName: m.namedGroup("last")!),
    ),
  ]);
}

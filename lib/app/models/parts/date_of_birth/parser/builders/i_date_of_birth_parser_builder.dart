import 'package:tournament_app/app/models/parts/date_of_birth/parser/date_of_birth_parser.dart';

abstract class IDateOfBirthParserBuilder {
  IDateOfBirthParserBuilder addDateTimeParser();
  DateOfBirthParser build();
}
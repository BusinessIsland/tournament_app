import 'package:tournament_app/app/models/parts/date_of_birth/parser/builders/i_date_of_birth_parser_builder.dart';
import 'package:tournament_app/app/models/parts/date_of_birth/parser/date_of_birth_parser.dart';

class DateOfBirthParserBuilder implements IDateOfBirthParserBuilder {
  DateOfBirthParser? _head;
  DateOfBirthParser? _tail;

  IDateOfBirthParserBuilder _addParser(DateOfBirthParser parser) {
    if (_head == null) {
      _head = _tail = parser;
    } else {
      _tail!.setNext(parser);
      _tail = parser;
    }

    return this;
  }

  @override
  IDateOfBirthParserBuilder addDateTimeParser() =>
      _addParser(DateTimeDateOfBirthParser());

  @override
  DateOfBirthParser build() {
    if (_head == null)
      throw Exception("не удалось получить парсер 'даты рождения'");
    return _head!;
  }
}

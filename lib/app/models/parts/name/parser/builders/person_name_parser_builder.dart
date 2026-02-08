import 'package:tournament_app/app/models/parts/name/parser/builders/i_person_name_builder.dart';
import 'package:tournament_app/app/models/parts/name/parser/person_name_parser.dart';

class PersonNameParserBuilder implements IPersonNameBuilder {
  PersonNameParser? _head;
  PersonNameParser? _tail;

  IPersonNameBuilder _addParser(PersonNameParser parser) {
    if (_head == null) {
      _head = _tail = parser;
    } else {
      _tail!.setNext(parser);
      _tail = parser;
    }

    return this;
  }

  @override
  IPersonNameBuilder addFullNameParser() => _addParser(FullNameParser());

  @override
  IPersonNameBuilder addNameWithInitialsParser() =>
      _addParser(NameWithInitialsParser());

  @override
  IPersonNameBuilder addShortNameParser() => _addParser(ShortNameParser());

  @override
  PersonNameParser build() {
    if (_head == null) throw Exception("не удалось получить парсер 'имени'");
    return _head!;
  }
}

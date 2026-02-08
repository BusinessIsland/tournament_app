import 'package:tournament_app/app/models/parts/gender/parser/builders/i_gender_parser_builder.dart';
import 'package:tournament_app/app/models/parts/gender/parser/gender_parser.dart';

class GenderParserBuilder implements IGenderParserBuilder {
  GenderParser? _head;
  GenderParser? _tail;

  IGenderParserBuilder _addParser(GenderParser parser) {
    if (_head == null) {
      _head = _tail = parser;
    } else {
      _tail!.setNext(parser);
      _tail = parser;
    }

    return this;
  }

  @override
  IGenderParserBuilder addMaleParser() => _addParser(MaleGenderParser());

  @override
  IGenderParserBuilder addFemaleParser() => _addParser(FemaleGenderParser());

  @override
  GenderParser build() {
    if (_head == null) throw Exception("не удалось получить парсер 'пола'");
    return _head!;
  }
}
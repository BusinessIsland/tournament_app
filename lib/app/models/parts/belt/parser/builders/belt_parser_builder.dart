import 'package:tournament_app/app/models/parts/belt/parser/belt_parser.dart';
import 'package:tournament_app/app/models/parts/belt/parser/builders/i_belt_parser_builder.dart';

class BeltParserBuilder implements IBeltParserBuilder {
  BeltParser? _head;
  BeltParser? _tail;

  IBeltParserBuilder _addParser(BeltParser parser) {
    if (_head == null) {
      _head = _tail = parser;
    } else {
      _tail!.setNext(parser);
      _tail = parser;
    }

    return this;
  }

  @override
  IBeltParserBuilder addDanParser() => _addParser(DanBeltParser());

  @override
  IBeltParserBuilder addKuParser() => _addParser(KuBeltParser());

  @override
  BeltParser build() {
    if (_head == null) throw Exception("не удалось получить парсер 'кю, дан'");
    return _head!;
  }
}

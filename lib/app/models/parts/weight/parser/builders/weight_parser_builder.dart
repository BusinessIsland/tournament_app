import 'package:tournament_app/app/models/parts/weight/parser/builders/i_weight_parser_builder.dart';
import 'package:tournament_app/app/models/parts/weight/parser/weight_parser.dart';

class WeightParserBuilder implements IWeightParserBuilder {
  WeightParser? _head;
  WeightParser? _tail;

  IWeightParserBuilder _addParser(WeightParser parser) {
    if (_head == null) {
      _head = _tail = parser;
    } else {
      _tail!.setNext(parser);
      _tail = parser;
    }

    return this;
  }

  @override
  IWeightParserBuilder addStandardParser() =>
      _addParser(StandardWeightParser());

  @override
  WeightParser build() {
    if (_head == null) throw Exception("не удалось получить парсер 'веса'");
    return _head!;
  }
}

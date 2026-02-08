import 'package:tournament_app/app/models/parts/region/parser/builders/i_region_parser_builder.dart';
import 'package:tournament_app/app/models/parts/region/parser/region_parser.dart';

class RegionParserBuilder implements IRegionParserBuilder{
  RegionParser? _head;
  RegionParser? _tail;

  IRegionParserBuilder _addParser(RegionParser parser) {
    if (_head == null) {
      _head = _tail = parser;
    } else {
      _tail!.setNext(parser);
      _tail = parser;
    }

    return this;
  }

  @override
  IRegionParserBuilder addStandardParser() => _addParser(StandardRegionParser());

  @override
  RegionParser build() {
    if (_head == null) throw Exception("не удалось получить парсер 'региона'");
    return _head!;
  }
}
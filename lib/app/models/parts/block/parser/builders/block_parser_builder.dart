import 'package:tournament_app/app/models/parts/block/parser/block_parser.dart';
import 'package:tournament_app/app/models/parts/block/parser/builders/i_block_parser_builder.dart';

class BlockParserBuilder implements IBlockParserBuilder {
  BlockParser? _head;
  BlockParser? _tail;

  IBlockParserBuilder _addParser(BlockParser parser) {
    if (_head == null) {
      _head = _tail = parser;
    } else {
      _tail!.setNext(parser);
      _tail = parser;
    }

    return this;
  }

  @override
  IBlockParserBuilder addStandardParser() => _addParser(StandardBlockParser());

  @override
  BlockParser build() {
    if (_head == null) throw Exception("не удалось получить парсер 'блока'");
    return _head!;
  }
}

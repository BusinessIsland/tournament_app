import 'package:tournament_app/app/models/parts/age_category/parser/age_category_parser.dart';
import 'package:tournament_app/app/models/parts/age_category/parser/builders/age_category_parser_builder.dart';

class AgeCategoryParserBuilderImpl extends AgeCategoryParserBuilder {
  AgeCategoryParser? _head;
  AgeCategoryParser? _tail;

  AgeCategoryParserBuilder _addParser(AgeCategoryParser parser) {
    if (_head == null) {
      _head = _tail = parser;
    } else {
      _tail!.setNext(parser);
      _tail = parser;
    }

    return this;
  }

  @override
  AgeCategoryParserBuilder addAboveAgeCategoryParser() =>
      _addParser(AboveAgeCategoryParser());

  @override
  AgeCategoryParserBuilder addBelowAgeCategoryParser() =>
      _addParser(BelowAgeCategoryParser());

  @override
  AgeCategoryParserBuilder addRangeAgeCategoryParser() =>
      _addParser(RangeAgeCategoryParser());

  @override
  AgeCategoryParserBuilder addAbsoluteAgeCategoryParser() =>
      _addParser(AbsoluteAgeCategoryParser());

  @override
  AgeCategoryParser build() {
    if (_head == null)
      throw Exception("не удалось получить парсер 'возрастной категории'");
    return _head!;
  }
}

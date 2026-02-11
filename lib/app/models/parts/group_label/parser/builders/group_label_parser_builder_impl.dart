import 'package:tournament_app/app/models/parts/group_label/parser/builders/group_label_parser_builder.dart';
import 'package:tournament_app/app/models/parts/group_label/parser/group_label_parser.dart';

class GroupLabelParserBuilderImpl extends GroupLabelParserBuilder {
  GroupLabelParser? _head;
  GroupLabelParser? _tail;

  GroupLabelParserBuilder _addParser(GroupLabelParser parser) {
    if (_head == null) {
      _head = _tail = parser;
    } else {
      _tail!.setNext(parser);
      _tail = parser;
    }

    return this;
  }

  @override
  GroupLabelParserBuilder addStandardParser() =>
      _addParser(StandardGroupLabelParser());

  @override
  GroupLabelParser build() {
    if (_head == null)
      throw Exception("не удалось получить парсер 'названия группы'");
    return _head!;
  }
}

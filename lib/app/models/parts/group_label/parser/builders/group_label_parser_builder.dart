import 'package:tournament_app/app/models/parts/group_label/parser/group_label_parser.dart';

abstract class GroupLabelParserBuilder {
  GroupLabelParserBuilder addStandardParser();

  GroupLabelParser build();
}

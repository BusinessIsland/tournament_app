import 'package:tournament_app/app/models/parts/belt/parser/belt_parser.dart';

abstract class IBeltParserBuilder {
  IBeltParserBuilder addKuParser();
  IBeltParserBuilder addDanParser();
  BeltParser build();
}
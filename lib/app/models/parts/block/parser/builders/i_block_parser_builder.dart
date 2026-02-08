import 'package:tournament_app/app/models/parts/block/parser/block_parser.dart';

abstract class IBlockParserBuilder {
  IBlockParserBuilder addStandardParser();
  BlockParser build();
}
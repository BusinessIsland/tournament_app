import 'package:tournament_app/app/models/parts/region/parser/region_parser.dart';

abstract class IRegionParserBuilder {
  IRegionParserBuilder addStandardParser();
  RegionParser build();
}
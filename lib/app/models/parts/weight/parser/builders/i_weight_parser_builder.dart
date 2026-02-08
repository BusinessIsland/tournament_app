

import 'package:tournament_app/app/models/parts/weight/parser/weight_parser.dart';

abstract class IWeightParserBuilder {
  IWeightParserBuilder addStandardParser();
  WeightParser build();
}
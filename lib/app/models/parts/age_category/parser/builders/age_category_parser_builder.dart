

import 'package:tournament_app/app/models/parts/age_category/parser/age_category_parser.dart';

abstract class AgeCategoryParserBuilder {
  AgeCategoryParserBuilder addAboveAgeCategoryParser();
  AgeCategoryParserBuilder addBelowAgeCategoryParser();
  AgeCategoryParserBuilder addRangeAgeCategoryParser();
  AgeCategoryParserBuilder addAbsoluteAgeCategoryParser();

  AgeCategoryParser build();
}
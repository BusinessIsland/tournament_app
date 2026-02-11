import 'package:tournament_app/app/models/parts/gender/parser/gender_parser.dart';
import 'package:tournament_app/app/models/parts/group_label/parser/group_label_parser.dart';
import 'package:tournament_app/app/models/parts/weight_category/parser/weight_category_parser.dart';

class SportsCategorySetParser {
  final GroupLabelParser groupLabelParser;
  final GenderParser genderParser;
  final AgeCategoryParser ageCategoryParser;
  final WeightCategoryParser weightCategoryParser;

  SportsCategorySetParser({
    required this.groupLabelParser,
    required this.genderParser,
    required this.ageCategoryParser,
    required this.weightCategoryParser,
  });
}

import 'package:tournament_app/app/models/parts/age_category/parser/age_category_parser.dart';
import 'package:tournament_app/app/models/parts/gender/parser/gender_pipeline_builder.dart';
import 'package:tournament_app/app/models/parts/group_label/parser/group_label_parser.dart';
import 'package:tournament_app/app/models/parts/weight_category/parser/weight_category_parser.dart';
import 'package:tournament_app/app/models/sports_category/parser/sports_category_set_parser.dart';

class SportsCategorySetParserFactory {
  static SportsCategorySetParser createDefaultParser() {
    return SportsCategorySetParser(
      groupLabelParser: GroupLabelParser(),
      genderParser: GenderPipelineBuilder().addMale().addFemale().build(),
      ageCategoryParser: AgeCategoryParser(),
      weightCategoryParser: WeightCategoryParser(),
    );
  }
}

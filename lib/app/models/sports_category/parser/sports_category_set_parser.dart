import 'package:tournament_app/app/models/parts/age_category/parser/age_category_parser.dart';
import 'package:tournament_app/app/models/parts/gender/parser/gender_pipeline.dart';
import 'package:tournament_app/app/models/parts/group_label/parser/group_label_parser.dart';
import 'package:tournament_app/app/models/parts/id/id.dart';
import 'package:tournament_app/app/models/parts/weight_category/parser/weight_category_parser.dart';
import 'package:tournament_app/app/models/parts/weight_category/weight_category.dart';
import 'package:tournament_app/app/models/sports_category/sports_category_set.dart';

class SportsCategorySetParser {
  final GroupLabelParser groupLabelParser;
  final GenderPipeline genderParser;
  final AgeCategoryParser ageCategoryParser;
  final WeightCategoryParser weightCategoryParser;

  SportsCategorySetParser({
    required this.groupLabelParser,
    required this.genderParser,
    required this.ageCategoryParser,
    required this.weightCategoryParser,
  });

  SportsCategorySet parse(
    String? rawGroupLabel,
    String? rawGender,
    String? rawMinAge,
    String? rawMaxAge,
    List<(String? rawMinWeight, String? rawMaxWeight)> rawWeights,
  ) {
    final groupLabel = groupLabelParser.parse(rawGroupLabel);
    final gender = genderParser.parse(rawGender);
    final ageCategory = ageCategoryParser.parse(rawMinAge, rawMaxAge);

    List<WeightCategory> weightCategories = rawWeights
        .map((w) => weightCategoryParser.parse(w.$1, w.$2))
        .toList();

    return SportsCategorySet(
      id: Id(),
      groupLabel: groupLabel,
      ageCategory: ageCategory,
      weightCategories: weightCategories,
      gender: gender,
    );
  }
}

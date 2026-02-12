import 'package:tournament_app/app/models/parts/gender/gender.dart';
import 'package:tournament_app/app/models/parts/gender/parser/gender_pattern_parser.dart';
import 'package:tournament_app/app/models/parts/gender/parser/patterns/female_gender_pattern.dart';
import 'package:tournament_app/app/models/parts/gender/parser/patterns/male_gender_pattern.dart';

class GenderParserRegistry {
  static GenderPatternParser male = GenderPatternParser([
    (MaleGenderPattern.male, () => MaleGender()),
  ]);

  static GenderPatternParser female = GenderPatternParser([
    (FemaleGenderPattern.female, () => FemaleGender()),
  ]);
}

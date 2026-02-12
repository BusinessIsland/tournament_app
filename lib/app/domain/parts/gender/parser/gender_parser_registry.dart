import 'package:tournament_app/app/domain/parts/gender/gender.dart';
import 'package:tournament_app/app/domain/parts/gender/parser/gender_pattern_parser.dart';
import 'package:tournament_app/app/domain/parts/gender/parser/patterns/female_gender_pattern.dart';
import 'package:tournament_app/app/domain/parts/gender/parser/patterns/male_gender_pattern.dart';

class GenderParserRegistry {
  static GenderPatternParser male = GenderPatternParser([
    (MaleGenderPattern.male, () => Gender.male),
  ]);

  static GenderPatternParser female = GenderPatternParser([
    (FemaleGenderPattern.female, () => Gender.female),
  ]);
}

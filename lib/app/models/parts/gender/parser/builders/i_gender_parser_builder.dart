import 'package:tournament_app/app/models/parts/gender/parser/gender_parser.dart';

abstract class IGenderParserBuilder {
  IGenderParserBuilder addMaleParser();
  IGenderParserBuilder addFemaleParser();
  GenderParser build();
}
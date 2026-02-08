import 'package:tournament_app/app/models/parts/name/parser/person_name_parser.dart';

abstract class IPersonNameBuilder {
  IPersonNameBuilder addFullNameParser();
  IPersonNameBuilder addNameWithInitialsParser();
  IPersonNameBuilder addShortNameParser();
  PersonNameParser build();
}
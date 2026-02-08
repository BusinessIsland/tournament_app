import 'package:tournament_app/app/models/parts/name/parser/builders/person_name_parser_builder.dart';
import 'package:tournament_app/app/models/trainer/parser/trainer_parser.dart';

class TrainerParserFactory {
  TrainerParser createDefaultParser() {
    return TrainerParser(
      PersonNameParserBuilder()
          .addFullNameParser()
          .addNameWithInitialsParser()
          .addShortNameParser()
          .build(),
    );
  }
}

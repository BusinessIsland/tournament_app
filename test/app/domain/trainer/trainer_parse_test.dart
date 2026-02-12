import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/domain/parts/name/parser/person_name_pipeline_builder.dart';
import 'package:tournament_app/app/domain/trainer/container/trainers_list.dart';
import 'package:tournament_app/app/domain/trainer/parser/trainer_parser.dart';

void main() {
  late TrainerParser parser;

  setUp(() {
    final pipeline = PersonNamePipelineBuilder()
        .addFullName()
        .addInitials()
        .addShortName()
        .build();

    parser = TrainerParser(pipeline);
  });

  group("TrainerParser_Success", () {
    test("parse trainer from string, where there is only one trainer", () {
      final given = "Мисяченко Я.М.";
      TrainersList got = parser.parse(given);

      expect(got.size, 1);
    });

    test("parse trainer from string, where there are 2 trainers", () {
      final given = "Мисяченко Я.М., Журавлев Д.В.";
      TrainersList got = parser.parse(given);

      expect(got.size, 2);
    });
  });
}

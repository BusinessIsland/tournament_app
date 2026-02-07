import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/parts/name/person_name_parser.dart';
import 'package:tournament_app/app/models/trainer/parser/trainer_parser.dart';
import 'package:tournament_app/app/models/trainer/trainers_list.dart';

void main() {
  late TrainerParser parser;

  setUp(() {
    parser = TrainerParser(NameWithInitialsParser());
  });

  group("TrainerParser_Success", () {
    test("parse trainer from string, where there is only one trainer", () {
      final given = "Мисяченко Я.М.";
      TrainersList got = parser.parse(given);

      expect(got.toString(), "Мисяченко Я.М.");
    });

    test("parse trainer from string, where there are 2 trainers", () {
      final given = "Мисяченко Я.М., Журавлев Д.В.";
      TrainersList got = parser.parse(given);

      expect(got.toString(), "Мисяченко Я.М., Журавлев Д.В.");
    });
  });
}
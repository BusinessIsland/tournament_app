import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/parts/id/id.dart';
import 'package:tournament_app/app/models/parts/name/parser/person_name_pipeline.dart';
import 'package:tournament_app/app/models/parts/name/parser/person_name_pipeline_builder.dart';
import 'package:tournament_app/app/models/trainer/trainer.dart';
import 'package:tournament_app/app/models/trainer/trainers_list.dart';

void main() {
  late TrainersList trainersList;
  late PersonNamePipeline pipeline;

  setUp(() {
    trainersList = TrainersListBasicImpl();
    pipeline = PersonNamePipelineBuilder()
        .addFullName()
        .addInitials()
        .addShortName()
        .build();
  });

  group("TrainersList_Success", () {
    test("creating trainers list should return instance with size 0", () {
      final trainersList = TrainersListBasicImpl();

      expect(trainersList.size, 0);
    });

    group("add", () {
      test("add trainer to list should add trainer and increment size", () {
        final id = Id();
        final given = Trainer(id: id, name: pipeline.parse("Пупкин И.А."));

        trainersList.add(given);

        expect(trainersList.size, 1);
      });

      test(
        "add trainer twice to list should add trainer twice and increment size by 2",
        () {
          final id = Id();
          final given = Trainer(id: id, name: pipeline.parse("Пупкин И.А."));

          trainersList.add(given);
          trainersList.add(given);

          expect(trainersList.size, 2);
        },
      );
    });

    group("findById", () {
      test(
        "findById should return Trainer if trainer with provided id exists",
        () {
          final id = Id();
          final given = Trainer(id: id, name: pipeline.parse("Пупкин И.А."));

          trainersList.add(given);
          final found = trainersList.findById(id);

          expect(found, isNotNull);
        },
      );

      test(
        "findById should return null if trainer with provided id not exists",
        () {
          final given = Trainer(id: Id(), name: pipeline.parse("Пупкин И.А."));

          trainersList.add(given);

          final found = trainersList.findById(Id());

          expect(found, isNull);
        },
      );
    });

    group("delete", () {
      test(
        "delete by id should return void and decrease size by 1 if trainer was deleted",
        () {
          final id = Id();
          final given = Trainer(id: id, name: pipeline.parse("Пупкин И.А."));

          trainersList.add(given);
          trainersList.delete(id);

          expect(trainersList.size, 0);
        },
      );

      test(
        "delete by id should return void and delete all instances with provided id and decrease size with deleted count",
        () {
          final id = Id();
          final given = Trainer(id: id, name: pipeline.parse("Пупкин И.А."));

          trainersList.add(given);
          trainersList.add(given);
          trainersList.delete(id);

          expect(trainersList.size, 0);
        },
      );
    });

    group("toString", () {
      test(
        "toString should return string of all trainers name, concatenated with ','",
        () {
          final trainersList = TrainersListBasicImpl();

          final given1 = Trainer(id: Id(), name: pipeline.parse("Пупкин И.А."));
          final given2 = Trainer(id: Id(), name: pipeline.parse("Васильев В.В."));

          trainersList.add(given1);
          trainersList.add(given2);

          expect(trainersList.toString(), "Пупкин И.А., Васильев В.В.");
        },
      );
    });
  });
}

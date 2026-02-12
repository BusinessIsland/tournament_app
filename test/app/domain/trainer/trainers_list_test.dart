import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/domain/parts/id/id.dart';
import 'package:tournament_app/app/domain/parts/name/person_name.dart';
import 'package:tournament_app/app/domain/trainer/container/impl/trainers_list_basic_impl.dart';
import 'package:tournament_app/app/domain/trainer/container/trainers_list.dart';
import 'package:tournament_app/app/domain/trainer/trainer.dart';

void main() {
  late TrainersList trainersList;

  setUp(() {
    trainersList = TrainersListBasicImpl([]);
  });

  Trainer createTrainer(Id id) {
    return Trainer(
        id: id,
        name: NameWithInitials(
            lastName: "Иванов", firstNameInitial: "И", middleNameInitial: "И"));
  }

  group("TrainersList_Success", () {
    test("creating trainers list should return instance with size 0", () {
      final trainersList = TrainersListBasicImpl([]);

      expect(trainersList.size, 0);
    });

    group("add", () {
      test("add trainer to list should add trainer and increment size", () {
        final given = createTrainer(Id.fromInt(1));

        trainersList.add(given);

        expect(trainersList.size, 1);
      });

      test(
        "add trainer twice to list should add trainer twice and increment size by 2",
        () {
          trainersList.add(createTrainer(Id.fromInt(1)));
          trainersList.add(createTrainer(Id.fromInt(2)));

          expect(trainersList.size, 2);
        },
      );
    });

    group("findById", () {
      test(
        "findById should return Trainer if trainer with provided id exists",
        () {
          final id = Id.fromInt(1);

          trainersList.add(createTrainer(id));
          final found = trainersList.findById(id);

          expect(found, isNotNull);
        },
      );

      test(
        "findById should return null if trainer with provided id not exists",
        () {
          final given = createTrainer(Id.fromInt(1));

          trainersList.add(given);

          final found = trainersList.findById(Id.fromInt(2));

          expect(found, isNull);
        },
      );
    });

    group("delete", () {
      test(
        "delete by id should return void and decrease size by 1 if trainer was deleted",
        () {
          final id = Id.fromInt(1);
          final given = createTrainer(id);

          trainersList.add(given);
          trainersList.delete(id);

          expect(trainersList.size, 0);
        },
      );

      test(
        "delete by id should return void and delete all instances with provided id and decrease size with deleted count",
        () {
          final id = Id.fromInt(1);

          trainersList.add(createTrainer(id));
          trainersList.add(createTrainer(Id.newId(2)));
          trainersList.delete(id);

          expect(trainersList.size, 1);
        },
      );
    });
  });
}

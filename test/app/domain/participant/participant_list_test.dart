import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/domain/participant/container/impl/participant_list_basic_impl.dart';
import 'package:tournament_app/app/domain/participant/container/participant_list.dart';
import 'package:tournament_app/app/domain/participant/participant.dart';
import 'package:tournament_app/app/domain/parts/belt/belt.dart';
import 'package:tournament_app/app/domain/parts/block/block.dart';
import 'package:tournament_app/app/domain/parts/date_of_birth/date_of_birth.dart';
import 'package:tournament_app/app/domain/parts/gender/gender.dart';
import 'package:tournament_app/app/domain/parts/id/id.dart';
import 'package:tournament_app/app/domain/parts/name/person_name.dart';
import 'package:tournament_app/app/domain/parts/region/region.dart';
import 'package:tournament_app/app/domain/parts/sports_qualification/sports_qualification.dart';
import 'package:tournament_app/app/domain/parts/weight/weight.dart';
import 'package:tournament_app/app/domain/trainer/container/impl/trainers_list_basic_impl.dart';
import 'package:tournament_app/app/domain/trainer/trainer.dart';

void main() {
  late ParticipantList participantList;

  setUp(() {
    participantList = ParticipantListBasicImpl([]);
  });

  Participant createParticipant(Id id) {
    final trainersList = TrainersListBasicImpl([]);
    trainersList.add(
      Trainer(
        id: Id.newId(123),
        name: NameWithInitials(
          lastName: "Мисяченко",
          firstNameInitial: "Я",
          middleNameInitial: "М",
        ),
      ),
    );

    return Participant(
      id: id,
      gender: Gender.male,
      name: FullName(
        lastName: "Журавлев",
        firstName: "Данил",
        middleName: "Владимирович",
      ),
      dateOfBirth: DateOfBirth(value: DateTime(2004, 1, 2)),
      belt: DanBelt(rank: 2),
      sportsQualification: SportsQualification(label: "мастер спорта", sortWeight: 100, masks: []),
      weight: Weight(value: 55),
      region: Region(label: "Хабаровский край"),
      trainers: trainersList,
      block: Block(label: "А"),
    );
  }

  Participant createParticipantForReplace(Id id) {
    final trainersList = TrainersListBasicImpl([]);
    trainersList.add(
      Trainer(
        id: Id.newId(1),
        name: NameWithInitials(
          lastName: "Мисяченко",
          firstNameInitial: "Я",
          middleNameInitial: "М",
        ),
      ),
    );

    return Participant(
      id: id,
      gender: Gender.male,
      name: FullName(
        lastName: "Пупкин",
        firstName: "Иван",
        middleName: "Иванович",
      ),
      dateOfBirth: DateOfBirth(value: DateTime(2004, 1, 2)),
      belt: DanBelt(rank: 2),
      sportsQualification: SportsQualification(label: "мастер спорта", sortWeight: 100, masks: []),
      weight: Weight(value: 55),
      region: Region(label: "Хабаровский край"),
      trainers: trainersList,
      block: Block(label: "А"),
    );
  }

  group("size", () {
    test("created instance of list should have size 0", () {
      expect(participantList.size, 0);
    });
  });

  group("findById", () {
    test(
      "should return Participant, if list contains participant with provided id",
      () {
        final id = Id.newId(1);
        final given = createParticipant(id);

        participantList.add(given);
        final found = participantList.findById(Id.fromInt(1));

        expect(found, isNotNull);
      },
    );

    test(
      "should return null, if list doesn't contains participant with provided id",
      () {
        final given = createParticipant(Id.newId(1));

        participantList.add(given);
        final found = participantList.findById(Id.newId(2));

        expect(found, isNull);
      },
    );
  });

  group("add", () {
    test(
      "add should add Participant to list, size should be increased by 1",
          () {
        final given = createParticipant(Id.fromInt(1));

        participantList.add(given);

        expect(participantList.size, 1);
      },
    );
  });

  group("replace", () {
    test("replace should change row in list", () {
      final id = Id.newId(1);
      final replacedId = Id.newId(2);
      final given = createParticipant(id);
      final forReplace = createParticipantForReplace(replacedId);

      participantList.add(given);
      expect(participantList.findById(id)!.name.formatted, "Журавлев Данил Владимирович");

      participantList.replace(forReplace, id);
      expect(participantList.findById(replacedId)!.name.formatted, "Пупкин Иван Иванович");

      expect(participantList.size, 1);
    });
  });

  group("delete", () {
    test(
      "delete should return void if list contains participant with provided id and decrease size of list by 1",
      () {
        final id = Id.newId(1);
        final given = createParticipant(id);

        participantList.add(given);
        participantList.delete(id);

        expect(participantList.size, 0);
      },
    );

    test(
      "delete should return void if list doesn't contain participant with provided id",
      () {
        final given = createParticipant(Id.newId(1));

        participantList.add(given);
        participantList.delete(Id.newId(2));

        expect(participantList.size, 1);
      },
    );

    test(
      "delete should return void; if participant deleted successfully, size should be decreased by number of deleted participants",
      () {
        participantList.add(createParticipant(Id.newId(1)));
        participantList.add(createParticipant(Id.newId(2)));
        participantList.add(createParticipant(Id.newId(3)));
        participantList.add(createParticipant(Id.newId(4)));
        participantList.delete(Id.newId(1));

        expect(participantList.size, 3);
      },
    );
  });
}

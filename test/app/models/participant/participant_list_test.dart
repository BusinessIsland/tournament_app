import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/participant/participant.dart';
import 'package:tournament_app/app/models/participant/participant_list.dart';
import 'package:tournament_app/app/models/parts/belt/belt.dart';
import 'package:tournament_app/app/models/parts/block/block.dart';
import 'package:tournament_app/app/models/parts/date_of_birth/date_of_birth.dart';
import 'package:tournament_app/app/models/parts/gender/gender.dart';
import 'package:tournament_app/app/models/parts/id/id.dart';
import 'package:tournament_app/app/models/parts/name/person_name.dart';
import 'package:tournament_app/app/models/parts/region/region.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_titles/sports_title.dart';
import 'package:tournament_app/app/models/parts/weight/weight.dart';
import 'package:tournament_app/app/models/trainer/trainer.dart';
import 'package:tournament_app/app/models/trainer/trainers_list.dart';

void main() {
  late ParticipantList participantList;

  setUp(() {
    participantList = ParticipantListBasicImpl();
  });

  Participant createParticipant(Id id) {
    final trainersList = TrainersListBasicImpl();
    trainersList.add(
      Trainer(
        id: Id(),
        name: NameWithInitials(
          lastName: "Мисяченко",
          firstNameInitial: "Я",
          middleNameInitial: "М",
        ),
      ),
    );

    return Participant(
      id: id,
      gender: MaleGender(),
      name: FullName(
        lastName: "Журавлев",
        firstName: "Данил",
        middleName: "Владимирович",
      ),
      dateOfBirth: DateTimeDateOfBirth(DateTime.now()),
      belt: DanBelt(rank: 2),
      sportsQualification: MasterOfSportsInternational(),
      weight: StandardWeight(55),
      region: StandardRegion("Хабаровский край"),
      trainers: trainersList,
      block: StandardBlock("А"),
    );
  }

  Participant createParticipantForReplace(Id id) {
    final trainersList = TrainersListBasicImpl();
    trainersList.add(
      Trainer(
        id: Id(),
        name: NameWithInitials(
          lastName: "Мисяченко",
          firstNameInitial: "Я",
          middleNameInitial: "М",
        ),
      ),
    );

    return Participant(
      id: id,
      gender: MaleGender(),
      name: FullName(
        lastName: "Пупкин",
        firstName: "Иван",
        middleName: "Иванович",
      ),
      dateOfBirth: DateTimeDateOfBirth(DateTime.now()),
      belt: DanBelt(rank: 2),
      sportsQualification: MasterOfSportsInternational(),
      weight: StandardWeight(55),
      region: StandardRegion("Хабаровский край"),
      trainers: trainersList,
      block: StandardBlock("А"),
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
        final id = Id();
        final given = createParticipant(id);

        participantList.add(given);
        final found = participantList.findById(id.toString());

        expect(found, isNotNull);
      },
    );

    test(
      "should return null, if list doesn't contains participant with provided id",
      () {
        final given = createParticipant(Id());

        participantList.add(given);
        final found = participantList.findById(Id().toString());

        expect(found, isNull);
      },
    );
  });

  group("add", () {
    test(
      "add should add Participant to list, size should be increased by 1",
          () {
        final given = createParticipant(Id());

        participantList.add(given);

        expect(participantList.size, 1);
      },
    );
  });

  group("replace", () {
    test("replace should change row in list", () {
      final id = Id();
      final replacedId = Id();
      final given = createParticipant(id);
      final forReplace = createParticipantForReplace(replacedId);

      participantList.add(given);
      expect(participantList.findById(id.toString())!.name.formatted, "Журавлев Данил Владимирович");

      participantList.replace(forReplace, id.toString());
      expect(participantList.findById(replacedId.toString())!.name.formatted, "Пупкин Иван Иванович");

      expect(participantList.size, 1);
    });
  });

  group("delete", () {
    test(
      "delete should return void if list contains participant with provided id and decrease size of list by 1",
      () {
        final id = Id();
        final given = createParticipant(id);

        participantList.add(given);
        participantList.delete(id.toString());

        expect(participantList.size, 0);
      },
    );

    test(
      "delete should return void if list doesn't contain participant with provided id",
      () {
        final given = createParticipant(Id());

        participantList.add(given);
        participantList.delete(Id().toString());

        expect(participantList.size, 1);
      },
    );

    test(
      "delete should return void; if participant deleted successfully, size should be decreased by number of deleted participants",
      () {
        final id = Id();
        final given = createParticipant(id);

        participantList.add(given);
        participantList.add(given);
        participantList.add(given);
        participantList.add(given);
        participantList.delete(id.toString());

        expect(participantList.size, 0);
      },
    );
  });
}

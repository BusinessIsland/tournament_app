import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/domain/participant/participant.dart';
import 'package:tournament_app/app/domain/parts/age_category/age_category.dart';
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
  group("AgeCategory.label", () {
    test("InnerAgeCategory returns min-max age text", () {
      final category = RangeAgeCategory(minAge: 7, maxAge: 9);

      expect(category.label, "7-9 лет");
    });

    test("BelowAgeCategory returns min-age text", () {
      final category = BelowAgeCategory(maxAge: 7);

      expect(category.label, "7 лет и младше");
    });

    test("AboveAgeCategory returns max-age text", () {
      final category = AboveAgeCategory(minAge: 20);

      expect(category.label, "20 лет и старше");
    });

    test("AbsoluteAgeCategory returns absolute text", () {
      final category = AbsoluteAgeCategory.instance;

      expect(category.label, "абсолютная");
    });
  });

  group("AgeCategory.matchesParticipant", () {
    final participant = Participant(
        id: Id.newId(123),
        gender: Gender.male,
        name: ShortName(lastName: "Журавлев"),
        dateOfBirth: DateOfBirth(value: DateTime(2015, 5, 20)),
        belt: DanBelt(rank: 10),
        sportsQualification: SportsQualification(
            label: "мастер спорта", sortWeight: 100, masks: []),
        weight: Weight(value: 50),
        region: Region(label: "Хабаровский край"),
        trainers: TrainersListBasicImpl(
            [Trainer(id: Id.newId(111), name: ShortName(lastName: "Иванов"))]),
        block: Block(label: "А"));

    test("InnerAgeCategory returns true, if age between min and max age", () {
      final category = RangeAgeCategory(minAge: 10, maxAge: 20);

      expect(
          category.matchesParticipant(participant, DateTime(2026, 5, 2)), true);
    });

    test("BelowAgeCategory returns true, if age lte max age", () {
      final category = BelowAgeCategory(maxAge: 10);

      expect(category.matchesParticipant(participant, DateTime(2023, 2, 20)),
          true);
    });

    test("AboveAgeCategory returns true, if age gte min age", () {
      final category = AboveAgeCategory(minAge: 4);

      expect(category.matchesParticipant(participant, DateTime(2025, 1, 20)),
          true);
    });

    test("AbsoluteAgeCategory returns true always", () {
      final category = AbsoluteAgeCategory.instance;

      expect(category.matchesParticipant(participant, DateTime(2020, 1, 20)),
          true);
    });
  });
}

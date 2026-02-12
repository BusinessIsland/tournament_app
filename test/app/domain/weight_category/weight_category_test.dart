import 'package:flutter_test/flutter_test.dart';
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
import 'package:tournament_app/app/domain/parts/weight_category/weight_category.dart';
import 'package:tournament_app/app/domain/trainer/container/impl/trainers_list_basic_impl.dart';
import 'package:tournament_app/app/domain/trainer/trainer.dart';

void main() {

  group("WeightCategory.label", () {
    test("BelowWeightCategory returns max weight text", () {
      final category = BelowWeightCategory(maxWeight: 50);

      expect(category.label, "50.0 кг");
    });

    test("AboveWeightCategory returns min weight text", () {
      final category = AboveWeightCategory(minWeight: 100);

      expect(category.label, "100.0+ кг");
    });

    test("AbsoluteWeightCategory returns absolute text", () {
      final category = AbsoluteWeightCategory.instance;

      expect(category.label, "абсолютная");
    });
  });

  group("WeightCategory.matchesParticipant", () {
    final participant = Participant(
        id: Id.newId(123),
        gender: Gender.male,
        name: ShortName(lastName: "Журавлев"),
        dateOfBirth: DateOfBirth(value: DateTime(2015, 5, 20)),
        belt: DanBelt(rank: 10),
        sportsQualification: SportsQualification(
            label: "мастер спорта", sortWeight: 100, masks: []),
        weight: Weight(value: 20),
        region: Region(label: "Хабаровский край"),
        trainers: TrainersListBasicImpl(
            [Trainer(id: Id.newId(111), name: ShortName(lastName: "Иванов"))]),
        block: Block(label: "А"));

    test("BelowWeightCategory returns true if weight lte max weight", () {
      final category = BelowWeightCategory(maxWeight: 50);

      expect(category.matchesParticipant(participant), true);
    });

    test("AboveWeightCategory returns true if weight gt min weight", () {
      final category = AboveWeightCategory(minWeight: 100);

      expect(category.matchesParticipant(participant), false);
    });

    test("AbsoluteWeightCategory returns true always", () {
      final category = AbsoluteWeightCategory.instance;

      expect(category.matchesParticipant(participant), true);
    });
  });
}
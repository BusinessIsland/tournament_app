import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/domain/competition_judge/competition_judge.dart';
import 'package:tournament_app/app/domain/competition_judge/container/competition_judge_list.dart';
import 'package:tournament_app/app/domain/competition_judge/container/impl/competition_judge_list_basic_impl.dart';
import 'package:tournament_app/app/domain/parts/belt/belt.dart';
import 'package:tournament_app/app/domain/parts/id/id.dart';
import 'package:tournament_app/app/domain/parts/name/person_name.dart';
import 'package:tournament_app/app/domain/parts/region/region.dart';
import 'package:tournament_app/app/domain/parts/sports_qualification/sports_qualification.dart';

void main() {
  late CompetitionJudgeList competitionJudgeList;

  setUp(() {
    competitionJudgeList = CompetitionJudgeListBasicImpl([]);
  });

  CompetitionJudge createJudge(
    Id id,
  ) {
    return CompetitionJudge(
        id: id,
        name: FullName(
            lastName: "Иванов", firstName: "Иван", middleName: "Иванович"),
        belt: KuBelt(rank: 10),
        sportsQualification: SportsQualification(
            label: "мастер спорта", sortWeight: 100, masks: []),
        region: Region(label: "Хабаровский край"));
  }

  group("CompetitionJudgeList_Success", () {
    group("size", () {
      test("created instance of list should have size equals to 0", () {
        expect(competitionJudgeList.size, 0);
      });
    });

    group("add", () {
      test("add judge returns void and size of container equals 1", () {
        final given = createJudge(Id.newId(1));

        competitionJudgeList.add(given);

        expect(competitionJudgeList.size, 1);
      });

      test("add 3 judges returns void and size of container equals 3", () {
        competitionJudgeList.add(createJudge(Id.newId(1)));
        competitionJudgeList.add(createJudge(Id.newId(2)));
        competitionJudgeList.add(createJudge(Id.newId(3)));

        expect(competitionJudgeList.size, 3);
      });
    });

    group("findById", () {
      test(
        "findById should return judge if list contains judge with provided id",
        () {
          competitionJudgeList.add(createJudge(Id.newId(1)));
          final found = competitionJudgeList.findById(Id.fromInt(1));

          expect(found, isNotNull);
        },
      );

      test(
        "findById should return null if list doesn't contain judge with provided id",
        () {
          competitionJudgeList.add(createJudge(Id.newId(1)));
          final found = competitionJudgeList.findById(Id.fromInt(5));

          expect(found, isNull);
        },
      );
    });

    group("delete", () {
      test(
        "delete should return null if judge with provided id was deleted, size should decrease by 1",
        () {
          competitionJudgeList.add(createJudge(Id.newId(1)));
          competitionJudgeList.delete(Id.fromInt(1));

          expect(competitionJudgeList.size, 0);
        },
      );

      test(
        "delete should return null and delete all judges with provided id",
        () {
          competitionJudgeList.add(createJudge(Id.newId(1)));
          competitionJudgeList.add(createJudge(Id.newId(2)));
          competitionJudgeList.add(createJudge(Id.newId(3)));
          competitionJudgeList.add(createJudge(Id.newId(4)));
          competitionJudgeList.delete(Id.fromInt(1));

          expect(competitionJudgeList.size, 3);
        },
      );

      test(
          "delete should return no error if list doesn't contain any judge with provided id",
          () {
        competitionJudgeList.add(createJudge(Id.newId(1)));
        competitionJudgeList.delete(Id.fromInt(1));

        expect(competitionJudgeList.size, 0);
      });
    });
  });
}

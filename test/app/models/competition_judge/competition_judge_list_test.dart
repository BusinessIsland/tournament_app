import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/competition_judge/competition_judge.dart';
import 'package:tournament_app/app/models/competition_judge/competition_judge_list.dart';
import 'package:tournament_app/app/models/parts/belt/parser/belt_parser.dart';
import 'package:tournament_app/app/models/parts/id/id.dart';
import 'package:tournament_app/app/models/parts/name/parser/person_name_parser.dart';
import 'package:tournament_app/app/models/parts/region/parser/region_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/judge_ranks_parser.dart';

void main() {
  late CompetitionJudgeList competitionJudgeList;

  setUp(() {
    competitionJudgeList = CompetitionJudgeListBasicImpl();
  });

  CompetitionJudge createJudge(
    Id id,
    String name,
    String belt,
    String sportsQualification,
    String region,
  ) {
    final nameParser = FullNameParser();
    final beltParser = KuBeltParser();
    beltParser.setNext(DanBeltParser());

    final sportsQualificationParser = AllSportsCategoryJudgeParser();
    sportsQualificationParser
        .setNext(FirstCategoryJudgeParser())
        .setNext(SecondCategoryJudgeParser())
        .setNext(ThirdCategoryJudgeParser())
        .setNext(YouthCategoryJudgeParser());

    final regionParser = StandardRegionParser();

    return CompetitionJudge(
      id: id,
      name: nameParser.parse(name),
      belt: beltParser.parse(belt),
      qualification: sportsQualificationParser.parse(sportsQualification),
      region: regionParser.parse(region),
    );
  }

  group("CompetitionJudgeList_Success", () {
    group("size", () {
      test("created instance of list should have size equals to 0", () {
        expect(competitionJudgeList.size, 0);
      });
    });

    group("add", () {
      test("add judge returns void and size of container equals 1", () {
        final given = createJudge(
          Id(),
          "Винокуров Станислав Витальевич",
          "7 дан",
          "1К",
          "Хабаровский край",
        );

        competitionJudgeList.add(given);

        expect(competitionJudgeList.size, 1);
      });

      test("add 3 judges returns void and size of container equals 3", () {
        final given = createJudge(
          Id(),
          "Винокуров Станислав Витальевич",
          "7 дан",
          "1К",
          "Хабаровский край",
        );

        competitionJudgeList.add(given);
        competitionJudgeList.add(given);
        competitionJudgeList.add(given);

        expect(competitionJudgeList.size, 3);
      });
    });

    group("findById", () {
      test(
        "findById should return judge if list contains judge with provided id",
        () {
          final id = Id();
          final given = createJudge(
            id,
            "Винокуров Станислав Витальевич",
            "7 дан",
            "1К",
            "Хабаровский край",
          );

          competitionJudgeList.add(given);
          final found = competitionJudgeList.findById(id);

          expect(found, isNotNull);
        },
      );

      test(
        "findById should return null if list doesn't contain judge with provided id",
        () {
          final given = createJudge(
            Id(),
            "Винокуров Станислав Витальевич",
            "7 дан",
            "1К",
            "Хабаровский край",
          );

          competitionJudgeList.add(given);
          final found = competitionJudgeList.findById(Id());

          expect(found, isNull);
        },
      );
    });

    group("delete", () {
      test(
        "delete should return null if judge with provided id was deleted, size should decrease by 1",
        () {
          final id = Id();
          final given = createJudge(
            id,
            "Винокуров Станислав Витальевич",
            "7 дан",
            "1К",
            "Хабаровский край",
          );

          competitionJudgeList.add(given);
          competitionJudgeList.delete(id);

          expect(competitionJudgeList.size, 0);
        },
      );

      test(
        "delete should return null and delete all judges with provided id",
        () {
          final id = Id();
          final given = createJudge(
            id,
            "Винокуров Станислав Витальевич",
            "7 дан",
            "1К",
            "Хабаровский край",
          );

          competitionJudgeList.add(given);
          competitionJudgeList.add(given);
          competitionJudgeList.add(given);
          competitionJudgeList.add(given);
          competitionJudgeList.delete(id);

          expect(competitionJudgeList.size, 0);
        },
      );

      test("delete should return no error if list doesn't contain any judge with provided id", () {
        final id = Id();

        competitionJudgeList.delete(id);

        expect(competitionJudgeList.size, 0);
      });
    });
  });
}

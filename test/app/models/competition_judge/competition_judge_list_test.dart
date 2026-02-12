import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/competition_judge/competition_judge.dart';
import 'package:tournament_app/app/models/competition_judge/competition_judge_list.dart';
import 'package:tournament_app/app/models/competition_judge/parser/competition_judge_parser.dart';
import 'package:tournament_app/app/models/competition_judge/parser/factory/competition_judge_parser_factory.dart';
import 'package:tournament_app/app/models/parts/id/id.dart';

void main() {
  late CompetitionJudgeParser parser;
  late CompetitionJudgeList competitionJudgeList;

  setUp(() {
    competitionJudgeList = CompetitionJudgeListBasicImpl();
    parser = CompetitionJudgeParserFactory.createDefaultParser();
  });

  CompetitionJudge createJudge(
    String name,
    String belt,
    String sportsQualification,
    String region,
  ) {
    return parser.parse(name, belt, sportsQualification, region);
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
          final given = createJudge(
            "Винокуров Станислав Витальевич",
            "7 дан",
            "1К",
            "Хабаровский край",
          );

          competitionJudgeList.add(given);
          final found = competitionJudgeList.findById(given.id.toString());

          expect(found, isNotNull);
        },
      );

      test(
        "findById should return null if list doesn't contain judge with provided id",
        () {
          final given = createJudge(
            "Винокуров Станислав Витальевич",
            "7 дан",
            "1К",
            "Хабаровский край",
          );

          competitionJudgeList.add(given);
          final found = competitionJudgeList.findById(Id().toString());

          expect(found, isNull);
        },
      );
    });

    group("delete", () {
      test(
        "delete should return null if judge with provided id was deleted, size should decrease by 1",
        () {
          final given = createJudge(
            "Винокуров Станислав Витальевич",
            "7 дан",
            "1К",
            "Хабаровский край",
          );

          competitionJudgeList.add(given);
          competitionJudgeList.delete(given.id.toString());

          expect(competitionJudgeList.size, 0);
        },
      );

      test(
        "delete should return null and delete all judges with provided id",
        () {
          final given = createJudge(
            "Винокуров Станислав Витальевич",
            "7 дан",
            "1К",
            "Хабаровский край",
          );

          competitionJudgeList.add(given);
          competitionJudgeList.add(given);
          competitionJudgeList.add(given);
          competitionJudgeList.add(given);
          competitionJudgeList.delete(given.id.toString());

          expect(competitionJudgeList.size, 0);
        },
      );

      test("delete should return no error if list doesn't contain any judge with provided id", () {
        final id = Id();

        competitionJudgeList.delete(id.toString());

        expect(competitionJudgeList.size, 0);
      });
    });
  });
}

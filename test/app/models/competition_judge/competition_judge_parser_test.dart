import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/competition_judge/competition_judge.dart';
import 'package:tournament_app/app/models/competition_judge/parser/factory/competition_judge_parser_factory.dart';

void main() {
  CompetitionJudge parseJudge(String name, String belt, String qualification,
      String region) {
    final parser = CompetitionJudgeParserFactory.createDefaultParser();

    return parser.parse(name, belt, qualification, region);
  }

  group("CompetitionJudgeParser_Success", () {
    test("should create judge from String input values", () {
      final name = "Дыбский Владислав Максимович";
      final belt = "2 дан";
      final qualification = "1К";
      final region = "Хабаровский край";

      final got = parseJudge(name, belt, qualification, region);

      expect(got.name.formatted, "Дыбский Владислав Максимович");
      expect(got.belt.toString(), "2 дан");
      expect(got.sportsQualification.toString(), "спортивный судья первой категории");
      expect(got.region.toString(), "Хабаровский край");
    });
  });
}
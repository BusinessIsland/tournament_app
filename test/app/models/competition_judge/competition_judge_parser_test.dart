import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/competition_judge/competition_judge.dart';
import 'package:tournament_app/app/models/competition_judge/parser/competition_judge_parser.dart';
import 'package:tournament_app/app/models/parts/belt/parser/belt_parser.dart';
import 'package:tournament_app/app/models/parts/name/parser/person_name_parser.dart';
import 'package:tournament_app/app/models/parts/region/parser/region_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/judge_ranks_parser.dart';

void main() {
  CompetitionJudge parseJudge(String name, String belt, String qualification,
      String region) {
    final personNameParser = FullNameParser();
    final beltParser = KuBeltParser();
    beltParser.setNext(DanBeltParser());

    final ranksParser = AllSportsCategoryJudgeParser();
    ranksParser
        .setNext(FirstCategoryJudgeParser())
        .setNext(SecondCategoryJudgeParser())
        .setNext(ThirdCategoryJudgeParser())
        .setNext(YouthCategoryJudgeParser());

    final regionParser = StandardRegionParser();

    final parser = CompetitionJudgeParser(personNameParser: personNameParser,
        beltParser: beltParser,
        sportsQualificationParser: ranksParser,
        regionParser: regionParser);

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
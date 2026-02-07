import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/competition_judge/competition_judge.dart';
import 'package:tournament_app/app/models/competition_judge/competition_judge_parser.dart';
import 'package:tournament_app/app/models/parts/belt/belt_parser.dart';
import 'package:tournament_app/app/models/parts/name/person_name_parser.dart';
import 'package:tournament_app/app/models/parts/region/region_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/judge_ranks/judge_ranks_parser.dart';

void main() {
  CompetitionJudge parseJudge(String name, String belt, String qualification,
      String region) {
    final personNameParser = FullNameParser();
    final beltParser = KuBeltParser();
    beltParser.setNext(DanBeltParser());

    final ranksParser = AllSportsJudgeRankParser();
    ranksParser
        .setNext(FirstCategoryJudgeRankParser())
        .setNext(SecondCategoryJudgeRankParser())
        .setNext(ThirdCategoryJudgeRankParser())
        .setNext(YouthCategoryJudgeRankParser());

    final regionParser = StandardRegionParser();

    final parser = CompetitionJudgeParser(personNameParser: personNameParser,
        beltParser: beltParser,
        ranksParser: ranksParser,
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
      expect(got.qualification.toString(), "спортивный судья первой категории");
      expect(got.region.toString(), "Хабаровский край");
    });
  });
}
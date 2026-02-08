import 'package:tournament_app/app/models/competition_judge/competition_judge.dart';
import 'package:tournament_app/app/models/parts/belt/parser/belt_parser.dart';
import 'package:tournament_app/app/models/parts/id/id.dart';
import 'package:tournament_app/app/models/parts/name/parser/person_name_parser.dart';
import 'package:tournament_app/app/models/parts/region/parser/region_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/sports_qualification_parser.dart';

class CompetitionJudgeParser {
  final PersonNameParser personNameParser;
  final BeltParser beltParser;
  final SportsQualificationParser sportsQualificationParser;
  final RegionParser regionParser;

  CompetitionJudgeParser({
    required this.personNameParser,
    required this.beltParser,
    required this.sportsQualificationParser,
    required this.regionParser,
  });

  CompetitionJudge parse(
    String? name,
    String? belt,
    String? qualification,
    String? region,
  ) {
    final parsedName = personNameParser.parse(name);
    final parsedBelt = beltParser.parse(belt);
    final parsedSportsQualification = sportsQualificationParser.parse(qualification);
    final parsedRegion = regionParser.parse(region);

    return CompetitionJudge(
      id: Id(),
      name: parsedName,
      belt: parsedBelt,
      sportsQualification: parsedSportsQualification,
      region: parsedRegion,
    );
  }
}

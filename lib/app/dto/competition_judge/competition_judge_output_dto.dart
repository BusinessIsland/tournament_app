import 'package:tournament_app/app/models/competition_judge/competition_judge.dart';

class CompetitionJudgeOutputDto {
  final String id;
  final String name;
  final String belt;
  final String sportsQualification;
  final String region;

  const CompetitionJudgeOutputDto({
    required this.id,
    required this.name,
    required this.belt,
    required this.sportsQualification,
    required this.region,
  });

  CompetitionJudgeOutputDto.fromModel(CompetitionJudge judge)
      : id = judge.id.toString(),
        name = judge.name.formatted,
        belt = judge.belt.toString(),
        sportsQualification = judge.sportsQualification.toString(),
        region = judge.region.toString();
}

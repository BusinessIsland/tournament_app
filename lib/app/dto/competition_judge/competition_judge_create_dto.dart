class CompetitionJudgeCreateDto {
  final String name;
  final String belt;
  final String sportsQualification;
  final String region;

  const CompetitionJudgeCreateDto({
    required this.name,
    required this.belt,
    required this.sportsQualification,
    required this.region,
  });
}

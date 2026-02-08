class ParticipantCreateDto {
  String gender;
  String name;
  String dateOfBirth;
  String belt;
  String sportsQualification;
  String weight;
  String region;
  String trainers;
  String block;

  ParticipantCreateDto({
    required this.gender,
    required this.name,
    required this.dateOfBirth,
    required this.belt,
    required this.sportsQualification,
    required this.weight,
    required this.region,
    required this.trainers,
    required this.block,
  });
}

import 'package:tournament_app/app/models/participant/participant.dart';

class ParticipantOutputDto {
  final String id;
  final String gender;
  final String name;
  final String dateOfBirth;
  final String belt;
  final String sportsQualification;
  final double weight;
  final String region;
  final String trainers;
  final String block;
  final int age;

  ParticipantOutputDto({
    required this.id,
    required this.gender,
    required this.name,
    required this.dateOfBirth,
    required this.belt,
    required this.sportsQualification,
    required this.weight,
    required this.region,
    required this.trainers,
    required this.block,
    required this.age,
  });

  ParticipantOutputDto.fromModel(Participant participant)
    : id = participant.id.toString(),
      gender = participant.gender.shortLabel,
      name = participant.name.formatted,
      dateOfBirth = participant.dateOfBirth.toString(),
      belt = participant.belt.toString(),
      sportsQualification = participant.sportsQualification.toString(),
      weight = participant.weight.value,
      region = participant.region.toString(),
      trainers = participant.trainers.toString(),
      block = participant.block.toString(),
      age = participant.dateOfBirth.age;
}

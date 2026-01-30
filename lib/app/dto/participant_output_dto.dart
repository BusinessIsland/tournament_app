import 'package:tournament_app/app/models/participant/participant.dart';

class ParticipantOutputDto {
  String gender;
  String fullname;
  DateTime dateOfBirth;
  String belt;
  String sportsTitle;
  double weight;
  String region;
  List<String> trainers;
  String block;
  int age;

  ParticipantOutputDto(this.gender, this.fullname, this.dateOfBirth, this.belt,
      this.sportsTitle, this.weight, this.region, this.trainers, this.block,
      this.age);

  factory ParticipantOutputDto.fromParticipantModel(Participant participant) {
    final firstname = participant.firstname;
    final lastname = participant.lastname;
    final middlename = participant.middlename;
    
    final trainers = List<String>.empty(growable: true);
    
    for (final t in participant.trainers) {
      trainers.add(t.toString());
    }

    return ParticipantOutputDto(
        participant.gender.toString(),
        "$lastname $firstname $middlename",
        participant.dateOfBirth,
        participant.belt.toString(),
        participant.sportsTitle.toString(),
        participant.weight,
        participant.region,
        trainers,
        participant.block.toString(),
        participant.age);
  }

  @override
  String toString() {
    return 'ParticipantOutputDto{gender: $gender, fullname: $fullname, dateOfBirth: $dateOfBirth, belt: $belt, sportsTitle: $sportsTitle, weight: $weight, region: $region, trainers: $trainers, block: $block, age: $age}';
  }


}
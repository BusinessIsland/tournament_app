import 'package:tournament_app/app/dto/participant_input_dto.dart';
import 'package:tournament_app/app/models/participant/utils/belt.dart';
import 'package:tournament_app/app/models/participant/utils/gender.dart';
import 'package:tournament_app/app/models/participant/utils/sports_title.dart';
import 'package:tournament_app/app/models/trainer/trainer.dart';

// сущность участника соревнований
class Participant {
  Gender gender;
  String firstname;
  String lastname;
  String middlename;
  DateTime dateOfBirth;
  Belt belt;
  SportsTitle sportsTitle;
  double weight;
  String region;
  List<Trainer> trainers;
  String block;
  int age;

  Participant(this.gender, this.firstname, this.lastname, this.middlename,
      this.dateOfBirth, this.belt, this.sportsTitle, this.weight, this.region,
      this.trainers, this.block, this.age);

  factory Participant.fromDto(ParticipantInputDto dto) {
    final gender = Gender.fromSheet(dto.gender);
    final nameParts = dto.fullname.trim().split(" ");

    String lastname = "";
    String firstname = "";
    String middlename = "";

    if (nameParts.length == 3) {
      lastname = nameParts[0];
      firstname = nameParts[1];
      middlename = nameParts[2];
    } else if (nameParts.length == 2) {
      lastname = nameParts[0];
      firstname = nameParts[1];
    } else {
      lastname = nameParts[0];
    }

    final belt = Belt.fromSheet(dto.belt);
    final sportsTitle = SportsTitle.fromSheet(dto.sportsTitle);

    final trainers = List<Trainer>.empty(growable: true);

    for (final t in dto.trainers) {
      trainers.add(Trainer.fromSheet(t));
    }

    return Participant(
        gender,
        firstname,
        lastname,
        middlename,
        dto.dateOfBirth,
        belt,
        sportsTitle,
        dto.weight,
        dto.region,
        trainers,
        dto.block,
        dto.age);
  }

  @override
  String toString() {
    return 'Participant{gender: $gender, firstname: $firstname, lastname: $lastname, middlename: $middlename, dateOfBirth: $dateOfBirth, belt: $belt, sportsTitle: $sportsTitle, weight: $weight, region: $region, trainers: $trainers, block: $block, age: $age}';
  }


}
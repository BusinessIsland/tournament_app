import 'package:tournament_app/app/models/participant/utils/belt.dart';
import 'package:tournament_app/app/models/participant/utils/block.dart';
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
  Block block;
  int age;

  Participant(this.gender, this.firstname, this.lastname, this.middlename,
      this.dateOfBirth, this.belt, this.sportsTitle, this.weight, this.region,
      this.trainers, this.block, this.age);
}
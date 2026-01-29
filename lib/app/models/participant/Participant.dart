import 'package:tournament_app/app/models/participant/utils/Belt.dart';
import 'package:tournament_app/app/models/participant/utils/Block.dart';
import 'package:tournament_app/app/models/participant/utils/Gender.dart';
import 'package:tournament_app/app/models/participant/utils/SportsCategory.dart';
import 'package:tournament_app/app/models/participant/utils/SportsQualification.dart';
import 'package:tournament_app/app/models/participant/utils/SportsTitle.dart';
import 'package:tournament_app/app/models/trainer/Trainer.dart';

// сущность участника соревнований
class Participant {
  Gender gender;
  String firstname;
  String lastname;
  String middlename;
  DateTime dateOfBirth;
  Belt beltType;
  int beltRank;
  SportsQualification qualification;
  SportsTitle sportsTitle;
  SportsCategory sportsCategory;
  double weight;
  String region;
  List<Trainer> trainers;
  Block block;
  int age;

  Participant(this.gender, this.firstname, this.lastname, this.middlename,
      this.dateOfBirth, this.beltType, this.beltRank, this.qualification,
      this.sportsTitle, this.sportsCategory, this.weight, this.region,
      this.trainers, this.block, this.age);
}
import 'package:tournament_app/app/models/participant/utils/belt.dart';
import 'package:tournament_app/app/models/participant/utils/date_of_birth.dart';
import 'package:tournament_app/app/models/participant/utils/gender.dart';
import 'package:tournament_app/app/models/participant/utils/participant_name.dart';
import 'package:tournament_app/app/models/participant/utils/sports_title.dart';
import 'package:tournament_app/app/models/trainer/trainer.dart';

// сущность участника соревнований
class Participant {
  String id;
  int rowId;
  Gender gender;
  ParticipantName name;
  DateOfBirth dateOfBirth;
  Belt belt;
  SportsTitle sportsTitle;
  double weight;
  String region;
  List<Trainer> trainers;
  String block;

  Participant(
    this.id,
    this.rowId,
    this.gender,
    this.name,
    this.dateOfBirth,
    this.belt,
    this.sportsTitle,
    this.weight,
    this.region,
    this.trainers,
    this.block,
  );

  @override
  String toString() {
    return 'Participant{id: $id, rowId: $rowId, gender: $gender, name: $name, dateOfBirth: $dateOfBirth, belt: $belt, sportsTitle: $sportsTitle, weight: $weight, region: $region, trainers: $trainers, block: $block}';
  }
}

import 'package:tournament_app/app/domain/parts/belt/belt.dart';
import 'package:tournament_app/app/domain/parts/block/block.dart';
import 'package:tournament_app/app/domain/parts/date_of_birth/date_of_birth.dart';
import 'package:tournament_app/app/domain/parts/gender/gender.dart';
import 'package:tournament_app/app/domain/parts/id/id.dart';
import 'package:tournament_app/app/domain/parts/name/person_name.dart';
import 'package:tournament_app/app/domain/parts/region/region.dart';
import 'package:tournament_app/app/domain/parts/sports_qualification/sports_qualification.dart';
import 'package:tournament_app/app/domain/parts/weight/weight.dart';
import 'package:tournament_app/app/domain/trainer/container/trainers_list.dart';

class Participant {
  final Id id;
  final Gender gender;
  final PersonName name;
  final DateOfBirth dateOfBirth;
  final Belt belt;
  final SportsQualification sportsQualification;
  final Weight weight;
  final Region region;
  final TrainersList trainers;
  final Block block;

  const Participant({
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
  });

  int ageAt(DateTime tournamentDate) {
    return dateOfBirth.ageAt(tournamentDate);
  }

  @override
  String toString() {
    return 'Participant{id: $id, gender: $gender, name: $name, dateOfBirth: $dateOfBirth, belt: $belt, sportsQualification: $sportsQualification, weight: $weight, region: $region, trainers: $trainers, block: $block}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Participant && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

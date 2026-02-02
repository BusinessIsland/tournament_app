import 'package:tournament_app/app/exceptions/invalid_age.dart';
import 'package:tournament_app/app/models/participant/utils/age_category.dart';
import 'package:tournament_app/app/models/participant/utils/belt.dart';
import 'package:tournament_app/app/models/participant/utils/date_of_birth.dart';
import 'package:tournament_app/app/models/participant/utils/gender.dart';
import 'package:tournament_app/app/models/participant/utils/participant_name.dart';
import 'package:tournament_app/app/models/participant/utils/sports_title.dart';
import 'package:tournament_app/app/models/participant/utils/weight_category.dart';
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

  AgeCategory get ageCategory {
    final age = dateOfBirth.age;

    if (age == 10 || age == 11) {
      return AgeCategory.u12;
    } else if (age == 12 || age == 13) {
      return AgeCategory.u14;
    } else if (age == 14 || age == 15) {
      return AgeCategory.u16;
    } else if (age == 16 || age == 17) {
      return AgeCategory.u18;
    } else if (age >= 18) {
      return AgeCategory.u18;
    }

    throw InvalidAge("минимальный возраст участника 10 лет");
  }

  WeightCategory get weightCategory {
    final ageCat = ageCategory;

    if (gender.isMale) {

    }
  }

  @override
  String toString() {
    return 'Participant{id: $id, rowId: $rowId, gender: $gender, name: $name, dateOfBirth: $dateOfBirth, belt: $belt, sportsTitle: $sportsTitle, weight: $weight, region: $region, trainers: $trainers, block: $block}';
  }
}

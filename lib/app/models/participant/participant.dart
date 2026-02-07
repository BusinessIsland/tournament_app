import 'package:tournament_app/app/models/parts/belt/belt.dart';
import 'package:tournament_app/app/models/parts/block/block.dart';
import 'package:tournament_app/app/models/parts/date_of_birth/date_of_birth.dart';
import 'package:tournament_app/app/models/parts/gender/gender.dart';
import 'package:tournament_app/app/models/parts/id/id.dart';
import 'package:tournament_app/app/models/parts/name/person_name.dart';
import 'package:tournament_app/app/models/parts/region/region.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_qualification.dart';
import 'package:tournament_app/app/models/parts/weight/weight.dart';
import 'package:tournament_app/app/models/trainer/trainers_list.dart';

class Participant {
  Id id;
  Gender gender;
  PersonName name;
  DateOfBirth dateOfBirth;
  Belt belt;
  SportsQualification sportsQualification;
  Weight weight;
  Region region;
  TrainersList trainers;
  Block block;

  Participant({
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

  @override
  String toString() {
    return 'Participant{id: $id, gender: $gender, name: $name, dateOfBirth: $dateOfBirth, belt: $belt, sportsQualification: $sportsQualification, weight: $weight, region: $region, trainers: $trainers, block: $block}';
  }

  // AgeCategory get ageCategory {
  //   final age = dateOfBirth.age;
  //   final category = AgeCategory.fromAge(age);
  //
  //   if (category == null) {
  //     throw InvalidAge(
  //       "возраст участника '$age' не подходит ни для одной категории соревнований",
  //     );
  //   }
  //
  //   return category;
  // }
  //
  // WeightCategory? get weightCategory {
  //   final category = WeightCategoryValidator.findWeightCategory(
  //     age: ageCategory,
  //     gender: gender,
  //     weight: weight.value,
  //   );
  //
  //   if (category != null) return category;
  //   throw InvalidWeight("вес участника '${weight.value}' не подходит ни для одной весовой категории");
  // }


}

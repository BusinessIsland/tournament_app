import 'package:tournament_app/app/exceptions/invalid_age.dart';
import 'package:tournament_app/app/exceptions/invalid_weight.dart';
import 'package:tournament_app/app/models/name/person_name.dart';
import 'package:tournament_app/app/models/participant/utils/age_category.dart';
import 'package:tournament_app/app/models/participant/utils/belt.dart';
import 'package:tournament_app/app/models/parts/block/block.dart';
import 'package:tournament_app/app/models/participant/utils/date_of_birth.dart';
import 'package:tournament_app/app/models/participant/utils/gender.dart';
import 'package:tournament_app/app/models/parts/id/id.dart';
import 'package:tournament_app/app/models/participant/utils/region.dart';
import 'package:tournament_app/app/models/participant/utils/sports_title.dart';
import 'package:tournament_app/app/models/parts/weight/weight.dart';
import 'package:tournament_app/app/models/participant/utils/weight_category.dart';
import 'package:tournament_app/app/models/participant/utils/weight_category_validator.dart';
import 'package:tournament_app/app/models/trainer/trainer.dart';

// сущность участника соревнований
class Participant {
  Id id;
  Gender gender;
  PersonName name;
  DateOfBirth dateOfBirth;
  Belt belt;
  SportsTitle sportsTitle;
  Weight weight;
  Region region;
  List<Trainer> trainers;
  Block block;

  Participant(
    this.id,
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
    final category = AgeCategory.fromAge(age);

    if (category == null) {
      throw InvalidAge(
        "возраст участника '$age' не подходит ни для одной категории соревнований",
      );
    }

    return category;
  }

  WeightCategory? get weightCategory {
    final category = WeightCategoryValidator.findWeightCategory(
      age: ageCategory,
      gender: gender,
      weight: weight.value,
    );

    if (category != null) return category;
    throw InvalidWeight("вес участника '${weight.value}' не подходит ни для одной весовой категории");
  }

  @override
  String toString() {
    return 'Participant{id: $id, gender: $gender, name: $name, dateOfBirth: $dateOfBirth, belt: $belt, sportsTitle: $sportsTitle, weight: $weight, region: $region, trainers: $trainers, block: $block}';
  }
}

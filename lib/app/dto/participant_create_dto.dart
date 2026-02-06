import 'package:tournament_app/app/models/participant/utils/belt.dart';
import 'package:tournament_app/app/models/parts/block/block.dart';
import 'package:tournament_app/app/models/participant/utils/date_of_birth.dart';
import 'package:tournament_app/app/models/participant/utils/gender.dart';
import 'package:tournament_app/app/models/participant/utils/name.dart';
import 'package:tournament_app/app/models/participant/utils/region.dart';
import 'package:tournament_app/app/models/participant/utils/row_id.dart';
import 'package:tournament_app/app/models/participant/utils/sports_title.dart';
import 'package:tournament_app/app/models/parts/weight/weight.dart';
import 'package:tournament_app/app/models/trainer/trainer.dart';

class ParticipantCreateDto {
  Gender gender;
  Name name;
  DateOfBirth dateOfBirth;
  Belt belt;
  SportsTitle sportsTitle;
  Weight weight;
  Region region;
  List<Trainer> trainers;
  Block block;

  ParticipantCreateDto({
    required this.gender,
    required this.name,
    required this.dateOfBirth,
    required this.belt,
    required this.sportsTitle,
    required this.weight,
    required this.region,
    required this.trainers,
    required this.block,
  });

  factory ParticipantCreateDto.fromInput({
    String? rawGender,
    String? rawName,
    String? rawDateOfBirth,
    String? rawBelt,
    String? rawSportsTitle,
    String? rawWeight,
    String? rawRegion,
    String? rawTrainers,
    String? rawBlock,
  }) {
    final gender = Gender.fromString(rawGender);
    final name = Name.fromString(rawName);
    final dateOfBirth = DateOfBirth.fromString(rawDateOfBirth);
    final belt = Belt.fromString(rawBelt);
    final sportsTitle = SportsTitle.fromString(rawSportsTitle);
    final weight = Weight.fromString(rawWeight);
    final region = Region.withValidation(rawRegion);
    final trainers = Trainer.parseList(rawTrainers);
    final block = Block.fromString(rawBlock);

    return ParticipantCreateDto(
      gender: gender,
      name: name,
      dateOfBirth: dateOfBirth,
      belt: belt,
      sportsTitle: sportsTitle,
      weight: weight,
      region: region,
      trainers: trainers,
      block: block,
    );
  }
}

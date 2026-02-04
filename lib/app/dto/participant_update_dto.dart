import 'package:tournament_app/app/models/participant/utils/belt.dart';
import 'package:tournament_app/app/models/participant/utils/block.dart';
import 'package:tournament_app/app/models/participant/utils/date_of_birth.dart';
import 'package:tournament_app/app/models/participant/utils/gender.dart';
import 'package:tournament_app/app/models/participant/utils/id.dart';
import 'package:tournament_app/app/models/participant/utils/participant_name.dart';
import 'package:tournament_app/app/models/participant/utils/region.dart';
import 'package:tournament_app/app/models/participant/utils/sports_title.dart';
import 'package:tournament_app/app/models/participant/utils/weight.dart';
import 'package:tournament_app/app/models/trainer/trainer.dart';

class ParticipantUpdateDto {
  Id id;
  Gender gender;
  ParticipantName name;
  DateOfBirth dateOfBirth;
  Belt belt;
  SportsTitle sportsTitle;
  Weight weight;
  Region region;
  List<Trainer> trainers;
  Block block;

  ParticipantUpdateDto({
    required this.id,
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

  factory ParticipantUpdateDto.fromInput({
    String? rawId,
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
    final id = Id.withValidation(rawId);
    final gender = Gender.withValidation(rawGender);
    final name = ParticipantName.withValidation(rawName);
    final dateOfBirth = DateOfBirth.withValidation(rawDateOfBirth);
    final belt = Belt.withValidation(rawBelt);
    final sportsTitle = SportsTitle.withValidation(rawSportsTitle);
    final weight = Weight.withValidation(rawWeight);
    final region = Region.withValidation(rawRegion);
    final trainers = Trainer.parseList(rawTrainers);
    final block = Block.withValidation(rawBlock);

    return ParticipantUpdateDto(
      id: id,
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

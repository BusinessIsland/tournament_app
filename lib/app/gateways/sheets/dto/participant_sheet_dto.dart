import 'package:tournament_app/app/dto/participant_create_dto.dart';
import 'package:tournament_app/app/dto/participant_update_dto.dart';
import 'package:tournament_app/app/models/participant/participant.dart';
import 'package:tournament_app/app/models/parts/id/id.dart';
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

class ParticipantSheetDto {
  Id id;
  RowId rowId;
  Gender gender;
  Name name;
  DateOfBirth dateOfBirth;
  Belt belt;
  SportsTitle sportsTitle;
  Weight weight;
  Region region;
  List<Trainer> trainers;
  Block block;

  ParticipantSheetDto({
    required this.id,
    required this.rowId,
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

  ParticipantSheetDto.withValidation({
    String? rawId,
    String? rawRowId,
    String? rawGender,
    String? rawFullname,
    String? rawDateOfBirth,
    String? rawBelt,
    String? rawSportsTitle,
    String? rawWeight,
    String? rawRegion,
    String? rawTrainers,
    String? rawBlock,
  }) : id = Id.withValidation(rawId),
       rowId = RowId.withValidation(rawRowId),
       gender = Gender.fromString(rawGender),
       name = Name.fromString(rawFullname),
       dateOfBirth = DateOfBirth.fromString(rawDateOfBirth),
       belt = Belt.fromString(rawBelt),
       sportsTitle = SportsTitle.fromString(rawSportsTitle),
       weight = Weight.fromString(rawWeight),
       region = Region.withValidation(rawRegion),
       trainers = Trainer.parseList(rawTrainers),
       block = Block.fromString(rawBlock);

  ParticipantSheetDto.fromModel(Participant participant)
    : id = participant.id,
      rowId = participant.rowId,
      gender = participant.gender,
      name = participant.name,
      dateOfBirth = participant.dateOfBirth,
      belt = participant.belt,
      sportsTitle = participant.sportsQualification,
      weight = participant.weight,
      region = participant.region,
      trainers = participant.trainers,
      block = participant.block;

  ParticipantSheetDto.fromCreateDto(ParticipantCreateDto dto)
    : id = Id.withValidation(null),
      rowId = RowId.withValidation(null),
      gender = dto.gender,
      name = dto.name,
      dateOfBirth = dto.dateOfBirth,
      belt = dto.belt,
      sportsTitle = dto.sportsQualification,
      weight = dto.weight,
      region = dto.region,
      trainers = dto.trainers,
      block = dto.block;

  ParticipantSheetDto.fromUpdateDto(ParticipantUpdateDto dto)
    : id = dto.id,
      rowId = RowId.withValidation(null),
      gender = dto.gender,
      name = dto.name,
      dateOfBirth = dto.dateOfBirth,
      belt = dto.belt,
      sportsTitle = dto.sportsQualification,
      weight = dto.weight,
      region = dto.region,
      trainers = dto.trainers,
      block = dto.block;

  @override
  String toString() {
    return 'ParticipantSheetDto{id: $id, rowId: $rowId, gender: $gender, fullname: $name, dateOfBirth: $dateOfBirth, belt: $belt, sportsTitle: $sportsTitle, weight: $weight, region: $region, trainers: $trainers, block: $block}';
  }
}

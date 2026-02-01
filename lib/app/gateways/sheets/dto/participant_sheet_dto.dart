import 'package:tournament_app/app/exceptions/invalid_data_type.dart';
import 'package:tournament_app/app/models/participant/participant.dart';
import 'package:tournament_app/app/models/participant/utils/belt.dart';
import 'package:tournament_app/app/models/participant/utils/date_of_birth.dart';
import 'package:tournament_app/app/models/participant/utils/gender.dart';
import 'package:tournament_app/app/models/participant/utils/participant_name.dart';
import 'package:tournament_app/app/models/participant/utils/sports_title.dart';
import 'package:tournament_app/app/models/trainer/trainer.dart';
import 'package:uuid/uuid.dart';

class ParticipantSheetDto {
  String id;
  int rowId;
  Gender gender;
  ParticipantName fullname;
  DateOfBirth dateOfBirth;
  Belt belt;
  SportsTitle sportsTitle;
  double weight;
  String region;
  List<Trainer> trainers;
  String block;

  ParticipantSheetDto(
    this.id,
    this.rowId,
    this.gender,
    this.fullname,
    this.dateOfBirth,
    this.belt,
    this.sportsTitle,
    this.weight,
    this.region,
    this.trainers,
    this.block,
  );

  factory ParticipantSheetDto.withValidation(
    String rawId,
    String rawRowId,
    String rawGender,
    String rawFullname,
    String rawDateOfBirth,
    String rawBelt,
    String rawSportsTitle,
    String rawWeight,
    String rawRegion,
    String rawTrainers,
    String rawBlock,
  ) {
    late String id;

    if (rawId.isEmpty) {
      final uuid = Uuid();
      id = uuid.v4();
    } else {
      id = rawId;
    }

    final rowId = int.tryParse(rawRowId, radix: 10);
    if (rowId == null) {
      throw InvalidDataType("№ п/п '$rawRowId' не является числом");
    }

    final gender = Gender.withValidation(rawGender);
    final fullname = ParticipantName.withValidation(rawFullname);
    final dateOfBirth = DateOfBirth.withValidation(rawDateOfBirth);
    final belt = Belt.withValidation(rawBelt);
    final sportsTitle = SportsTitle.withValidation(rawSportsTitle);

    final weight = double.tryParse(rawWeight);
    if (weight == null) {
      throw InvalidDataType("Вес '$rawWeight' не является вещественным числом");
    }

    final region = rawRegion;
    final trainers = Trainer.parseList(rawTrainers);
    final block = rawBlock;

    return ParticipantSheetDto(
      id,
      rowId,
      gender,
      fullname,
      dateOfBirth,
      belt,
      sportsTitle,
      weight,
      region,
      trainers,
      block,
    );
  }

  factory ParticipantSheetDto.fromModel(Participant participant) {
    return ParticipantSheetDto(
      participant.id,
      participant.rowId,
      participant.gender,
      participant.name,
      participant.dateOfBirth,
      participant.belt,
      participant.sportsTitle,
      participant.weight,
      participant.region,
      participant.trainers,
      participant.block,
    );
  }
}

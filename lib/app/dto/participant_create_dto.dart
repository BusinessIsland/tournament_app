import 'package:tournament_app/app/exceptions/invalid_data_type.dart';
import 'package:tournament_app/app/models/participant/utils/belt.dart';
import 'package:tournament_app/app/models/participant/utils/date_of_birth.dart';
import 'package:tournament_app/app/models/participant/utils/gender.dart';
import 'package:tournament_app/app/models/participant/utils/participant_name.dart';
import 'package:tournament_app/app/models/participant/utils/sports_title.dart';
import 'package:tournament_app/app/models/trainer/trainer.dart';

class ParticipantCreateDto {
  Gender gender;
  ParticipantName name;
  DateOfBirth dateOfBirth;
  Belt belt;
  SportsTitle sportsTitle;
  double weight;
  String region;
  List<Trainer> trainers;
  String block;

  ParticipantCreateDto(
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

  factory ParticipantCreateDto.fromInput(
    String rawGender,
    String rawName,
    String rawDateOfBirth,
    String rawBelt,
    String rawSportsTitle,
    String rawWeight,
    String rawRegion,
    String rawTrainers,
    String rawBlock,
  ) {
    final gender = Gender.withValidation(rawGender);
    final name = ParticipantName.withValidation(rawName);
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

    return ParticipantCreateDto(
      gender,
      name,
      dateOfBirth,
      belt,
      sportsTitle,
      weight,
      region,
      trainers,
      block
    );
  }
}

// dto участника из таблицы Excel
import 'package:intl/intl.dart';

class ParticipantInputDto {
  String gender;
  String fullname;
  DateTime dateOfBirth;
  String belt;
  String sportsTitle;
  double weight;
  String region;
  List<String> trainers;
  String block;
  int age;

  ParticipantInputDto(
    this.gender,
    this.fullname,
    this.dateOfBirth,
    this.belt,
    this.sportsTitle,
    this.weight,
    this.region,
    this.trainers,
    this.block,
    this.age,
  );

  factory ParticipantInputDto.fromSheet(
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
    final formatter = DateFormat("yyyy-MM-dd");
    final dateOfBirth = formatter.parse(rawDateOfBirth, true);

    final now = DateTime.now();
    int age = now.year - dateOfBirth.year;
    if (now.month < dateOfBirth.month ||
        (now.month == dateOfBirth.month && now.day < dateOfBirth.day)) {
      age--;
    }

    final weight = double.parse(rawWeight);

    final trainersList = rawTrainers.trim().split(", ");

    for (var t in trainersList) {
      t = t.trim();
    }

    return ParticipantInputDto(
      rawGender,
      rawFullname,
      dateOfBirth,
      rawBelt,
      rawSportsTitle,
      weight,
      rawRegion,
      trainersList,
      rawBlock,
      age,
    );
  }

  @override
  String toString() {
    return 'ParticipantInputDto{gender: $gender, fullname: $fullname, dateOfBirth: $dateOfBirth, belt: $belt, sportsTitle: $sportsTitle, weight: $weight, region: $region, trainers: $trainers, block: $block, age: $age}';
  }
}

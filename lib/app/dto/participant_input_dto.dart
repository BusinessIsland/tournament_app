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
    String gender,
    String fullname,
    DateTime dateOfBirth,
    String belt,
    String sportsTitle,
    double weight,
    String region,
    String trainers,
    String block,
  ) {
    print(dateOfBirth);

    final now = DateTime.now();
    int age = now.year - dateOfBirth.year;
    if (now.month < dateOfBirth.month ||
        (now.month == dateOfBirth.month && now.day < dateOfBirth.day)) {
      age--;
    }

    final trainersList = trainers.trim().split(", ");

    for (var t in trainersList) {
      t = t.trim();
    }

    return ParticipantInputDto(
      gender,
      fullname,
      dateOfBirth,
      belt,
      sportsTitle,
      weight,
      region,
      trainersList,
      block,
      age,
    );
  }

  @override
  String toString() {
    return 'ParticipantInputDto{gender: $gender, fullname: $fullname, dateOfBirth: $dateOfBirth, belt: $belt, sportsTitle: $sportsTitle, weight: $weight, region: $region, trainers: $trainers, block: $block, age: $age}';
  }
}

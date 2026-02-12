import 'package:isar/isar.dart';

@collection
class Participant {
  Id id;
  String lastName;
  String? firstName;
  String? middleName;
  String gender;
  DateTime dateOfBirth;
  String? belt;
  String? sportsQualification;
  double weight;
  String region;
  List<String> trainersNames;
  String block;

  Participant(
      this.id,
      this.lastName,
      this.firstName,
      this.middleName,
      this.gender,
      this.dateOfBirth,
      this.belt,
      this.sportsQualification,
      this.weight,
      this.region,
      this.trainersNames,
      this.block);
}

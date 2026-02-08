import 'package:tournament_app/app/gateways/sheets/configs/participant/karate/fields/participant_field.dart';

class ParticipantKarateSheetColumns {
  static const Map<ParticipantField, int> standardChampionship = {
    ParticipantField.number: 0,
    ParticipantField.gender: 1,
    ParticipantField.name: 2,
    ParticipantField.dateOfBirth: 3,
    ParticipantField.belt: 4,
    ParticipantField.sportsQualification: 5,
    ParticipantField.weight: 6,
    ParticipantField.region: 7,
    ParticipantField.trainers: 8,
    ParticipantField.block: 9,
    ParticipantField.ageFull: 10,
  };

  static const Map<ParticipantField, int> primacyChampionship = {
    ParticipantField.number: 0,
    ParticipantField.gender: 1,
    ParticipantField.name: 2,
    ParticipantField.dateOfBirth: 3,
    ParticipantField.belt: 4,
    ParticipantField.sportsQualification: 5,
    ParticipantField.weight: 6,
    ParticipantField.region: 7,
    ParticipantField.trainers: 8,
    ParticipantField.block: 9,
    ParticipantField.ageFull: 10,
  };

  static const Map<ParticipantField, int> massSportsEvent = {
    ParticipantField.number: 0,
    ParticipantField.gender: 1,
    ParticipantField.name: 2,
    ParticipantField.dateOfBirth: 3,
    ParticipantField.belt: 4,
    ParticipantField.weight: 5,
    ParticipantField.region: 6,
    ParticipantField.trainers: 7,
    ParticipantField.block: 8,
    ParticipantField.ageFull: 9,
  };
}

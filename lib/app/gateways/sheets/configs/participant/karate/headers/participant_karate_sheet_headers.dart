import 'package:tournament_app/app/gateways/sheets/configs/participant/karate/fields/participant_field.dart';

class ParticipantKarateSheetHeaders {
  static const Map<ParticipantField, String> standardChampionship = {
    ParticipantField.number: "№ п/п",
    ParticipantField.gender: "Пол",
    ParticipantField.name: "ФИО",
    ParticipantField.dateOfBirth: "Дата рождения",
    ParticipantField.belt: "Кю, дан",
    ParticipantField.sportsQualification: "Разряд",
    ParticipantField.weight: "Вес",
    ParticipantField.region: "Регион",
    ParticipantField.trainers: "Тренер(ы)",
    ParticipantField.block: "Блок",
    ParticipantField.ageFull: "Полных лет",
  };

  static const Map<ParticipantField, String> primacyChampionship = {
    ParticipantField.number: "№ п/п",
    ParticipantField.gender: "Пол",
    ParticipantField.name: "ФИО",
    ParticipantField.dateOfBirth: "Дата рождения",
    ParticipantField.belt: "Кю, дан",
    ParticipantField.sportsQualification: "Разряд",
    ParticipantField.weight: "Вес",
    ParticipantField.region: "Регион",
    ParticipantField.trainers: "Тренер(ы)",
    ParticipantField.block: "Блок",
    ParticipantField.ageFull: "Полных лет",
  };

  static const Map<ParticipantField, String> massSportsEvent = {
    ParticipantField.number: "№ п/п",
    ParticipantField.gender: "Пол",
    ParticipantField.name: "ФИО",
    ParticipantField.dateOfBirth: "Дата рождения",
    ParticipantField.belt: "Кю, дан",
    ParticipantField.weight: "Вес",
    ParticipantField.region: "Регион",
    ParticipantField.trainers: "Тренер(ы)",
    ParticipantField.block: "Блок",
    ParticipantField.ageFull: "Полных лет",
  };
}

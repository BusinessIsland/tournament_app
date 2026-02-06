import 'dart:io';

import 'package:excel/excel.dart';
import 'package:tournament_app/app/dto/participant_create_dto.dart';
import 'package:tournament_app/app/dto/participant_get_all_filter.dart';
import 'package:tournament_app/app/dto/participant_update_dto.dart';
import 'package:tournament_app/app/gateways/repositories/participant/participant_repository.dart';
import 'package:tournament_app/app/gateways/sheets/dto/participant_sheet_dto.dart';
import 'package:tournament_app/app/gateways/sheets/participant_sheet_parser.dart';
import 'package:tournament_app/app/models/participant/participant.dart';

class ParticipantSheetRepository extends ParticipantRepository {
  String pathToFile;
  ParticipantSheetParser parser;

  ParticipantSheetRepository(this.pathToFile, this.parser);

  Excel _getExcel() {
    final bytes = File(pathToFile).readAsBytesSync();
    return Excel.decodeBytes(bytes);
  }

  @override
  List<Participant> getAll(ParticipantGetAllFilter filter) {
    final excel = _getExcel();
    final rows = parser.readAll(excel);

    final filteredRows = rows.where((row) {
      final matchesRegion =
        filter.region == null || filter.region == row.region.label;

      final matchesTrainer =
          filter.trainerName == null ||
          row.trainers.any((t) => t.toString() == filter.trainerName);

      return matchesRegion && matchesTrainer;
    });

    return filteredRows
        .map(
          (row) => Participant(
            row.id,
            row.rowId,
            row.gender,
            row.name,
            row.dateOfBirth,
            row.belt,
            row.sportsTitle,
            row.weight,
            row.region,
            row.trainers,
            row.block,
          ),
        )
        .toList();
  }

  @override
  Participant getById(String id) {
    final oldExcel = _getExcel();
    final row = parser.getById(oldExcel, id);

    return Participant(
      row.id,
      row.rowId,
      row.gender,
      row.name,
      row.dateOfBirth,
      row.belt,
      row.sportsTitle,
      row.weight,
      row.region,
      row.trainers,
      row.block,
    );
  }

  @override
  Participant create(ParticipantCreateDto createDto) {
    final oldExcel = _getExcel();
    final newExcel = Excel.createExcel();

    final dto = ParticipantSheetDto.fromCreateDto(createDto);
    final row = parser.create(oldExcel, newExcel, dto);

    final fileBytes = newExcel.save();
    if (fileBytes != null) {
      File(pathToFile).writeAsBytesSync(fileBytes);
    }

    return Participant(
      row.id,
      row.rowId,
      row.gender,
      row.name,
      row.dateOfBirth,
      row.belt,
      row.sportsTitle,
      row.weight,
      row.region,
      row.trainers,
      row.block,
    );
  }

  @override
  Participant update(ParticipantUpdateDto updateDto) {
    final oldExcel = _getExcel();
    final newExcel = Excel.createExcel();

    final dto = ParticipantSheetDto.fromUpdateDto(updateDto);
    final row = parser.update(oldExcel, newExcel, dto.id.value, dto);

    final fileBytes = newExcel.save();
    if (fileBytes != null) {
      File(pathToFile).writeAsBytesSync(fileBytes);
    }

    return Participant(
      row.id,
      row.rowId,
      row.gender,
      row.name,
      row.dateOfBirth,
      row.belt,
      row.sportsTitle,
      row.weight,
      row.region,
      row.trainers,
      row.block,
    );
  }

  @override
  void delete(List<String> ids) {
    final oldExcel = _getExcel();
    final newExcel = Excel.createExcel();

    parser.delete(oldExcel, newExcel, ids);

    final fileBytes = newExcel.save();
    if (fileBytes != null) {
      File(pathToFile).writeAsBytesSync(fileBytes);
    }
  }
}

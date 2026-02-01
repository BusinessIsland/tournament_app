import 'dart:io';

import 'package:excel/excel.dart';
import 'package:tournament_app/app/gateways/repositories/participant/participant_repository.dart';
import 'package:tournament_app/app/gateways/sheets/dto/participant_sheet_dto.dart';
import 'package:tournament_app/app/gateways/sheets/participant_sheet_parser.dart';
import 'package:tournament_app/app/models/participant/participant.dart';

class ParticipantSheetRepository extends ParticipantRepository {
  String pathToFile;
  ParticipantSheetParser reader;

  ParticipantSheetRepository(this.pathToFile, this.reader);

  Excel _getExcel() {
    final bytes = File(pathToFile).readAsBytesSync();
    return Excel.decodeBytes(bytes);
  }

  @override
  List<Participant> getAll() {
    final excel = _getExcel();
    final rows = reader.readAll(excel);

    final participants = List<Participant>.empty(growable: true);

    for (final row in rows) {
      participants.add(
        Participant(
          row.id,
          row.rowId,
          row.gender,
          row.fullname,
          row.dateOfBirth,
          row.belt,
          row.sportsTitle,
          row.weight,
          row.region,
          row.trainers,
          row.block,
        ),
      );
    }

    return participants;
  }

  @override
  Participant create(Participant participant) {
    final oldExcel = _getExcel();
    final newExcel = Excel.createExcel();

    final dto = ParticipantSheetDto.fromModel(participant);
    final row = reader.create(oldExcel, newExcel, dto);

    var fileBytes = newExcel.save();
    if (fileBytes != null) {
      File(pathToFile).writeAsBytesSync(fileBytes);
    }

    return Participant(
      row.id,
      row.rowId,
      row.gender,
      row.fullname,
      row.dateOfBirth,
      row.belt,
      row.sportsTitle,
      row.weight,
      row.region,
      row.trainers,
      row.block,
    );
  }
}

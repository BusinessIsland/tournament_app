import 'dart:io';
import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:tournament_app/app/dto/participant_input_dto.dart';
import 'package:tournament_app/app/gateways/repositories/participant/participant_repository.dart';
import 'package:tournament_app/app/gateways/sheets/sheet_data_reader.dart';
import 'package:tournament_app/app/models/participant/participant.dart';

class ParticipantSheetRepository extends ParticipantRepository {
  String pathToFile;
  SheetDataReader<ParticipantInputDto> reader;

  ParticipantSheetRepository(this.pathToFile, this.reader);

  Excel _getExcel() {
    final bytes = File(pathToFile).readAsBytesSync();
    return Excel.decodeBytes(bytes);
  }

  @override
  List<ParticipantInputDto> getAll() {
    return reader.readAll(_getExcel());
  }

  @override
  ParticipantInputDto save(ParticipantInputDto dto) {
    final excel = _getExcel();
    final saved = reader.save(excel, dto);

    var fileBytes = excel.save();
    if (fileBytes != null) {
      File(pathToFile)
        ..createSync(recursive: true)
        ..writeAsBytesSync(fileBytes);
    }

    return saved;
  }
}
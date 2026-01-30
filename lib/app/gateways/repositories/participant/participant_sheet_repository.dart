import 'dart:io';
import 'dart:typed_data';

import 'package:tournament_app/app/dto/participant_input_dto.dart';
import 'package:tournament_app/app/gateways/repositories/participant/participant_repository.dart';
import 'package:tournament_app/app/gateways/sheets/sheet_data_reader.dart';

class ParticipantSheetRepository extends ParticipantRepository {
  String pathToFile;
  SheetDataReader<ParticipantInputDto> reader;

  ParticipantSheetRepository(this.pathToFile, this.reader);

  Uint8List _getFileContents() {
    return File(pathToFile).readAsBytesSync();
  }

  @override
  List<ParticipantInputDto> getAll() {
    return reader.readAll(_getFileContents());
  }
}
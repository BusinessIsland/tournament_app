import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:tournament_app/app/dto/participant_input_dto.dart';
import 'package:tournament_app/app/exceptions/sheet_not_found_exception.dart';
import 'package:tournament_app/app/gateways/excel/excel_data_reader.dart';

class ApplicationFarEasternReader extends ExcelDataReader<ParticipantInputDto> {
  final String sheetName = "Первенство ДФО";

  @override
  List<ParticipantInputDto> readAll(Uint8List data) {
    var excel = Excel.decodeBytes(data);

    final List<ParticipantInputDto> dtos = List.empty(growable: true);

    if (!excel.sheets.containsKey(sheetName)) {
      throw SheetNotFoundException(sheetName);
    }

    var sheet = excel[sheetName];

    for (int i = 2; i <= sheet.rows.length; i++) {
      final rawId = sheet.cell(CellIndex.indexByString("A$i")).value;
      if (rawId == null) {
        return dtos;
      }

      final rawGender =
          sheet.cell(CellIndex.indexByString("B$i")).value;

      final rawFullname =
          sheet.cell(CellIndex.indexByString("C$i")).value;

      final rawDateOfBirth =
          sheet.cell(CellIndex.indexByString("D$i")).value;

      final rawBelt =
          sheet.cell(CellIndex.indexByString("E$i")).value;

      final rawSportsTitle =
          sheet.cell(CellIndex.indexByString("F$i")).value;

      final rawWeight =
          sheet.cell(CellIndex.indexByString("G$i")).value;

      final rawRegion =
          sheet.cell(CellIndex.indexByString("H$i")).value;

      final rawTrainers =
          sheet.cell(CellIndex.indexByString("I$i")).value;

      final rawBlock =
          sheet.cell(CellIndex.indexByString("J$i")).value;

      dtos.add(
        ParticipantInputDto.fromSheet(
          rawGender.toRawString(),
          rawFullname.toRawString(),
          rawDateOfBirth.toRawString(),
          rawBelt.toRawString(),
          rawSportsTitle.toRawString(),
          rawWeight.toRawString(),
          rawRegion.toRawString(),
          rawTrainers.toRawString(),
          rawBlock.toRawString(),
        ),
      );
    }

    return dtos;
  }
}

extension CellValueRetriever on CellValue? {
  String toRawString() {
    final value = this;

    switch (value) {
      case TextCellValue():
      case IntCellValue():
      case BoolCellValue():
      case DoubleCellValue():
        return value.toString();
      case DateCellValue():
        final date = value.toString();
        return date.replaceAll(".", "-");
      default:
        return value.toString();
    }
  }
}
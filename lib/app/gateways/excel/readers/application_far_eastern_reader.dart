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
      final rawGenderCell =
          sheet.cell(CellIndex.indexByString("B$i")).value as TextCellValue;

      final rawFullnameCell =
          sheet.cell(CellIndex.indexByString("C$i")).value as TextCellValue;

      final rawDateOfBirthCell =
          sheet.cell(CellIndex.indexByString("D$i")).value as DateCellValue;

      final rawBeltCell =
          sheet.cell(CellIndex.indexByString("E$i")).value.toString();

      final rawSportsTitleCell =
          sheet.cell(CellIndex.indexByString("F$i")).value as TextCellValue;

      final rawWeightCell =
          double.parse(sheet.cell(CellIndex.indexByString("G$i")).value.toString());

      final rawRegionCell =
          sheet.cell(CellIndex.indexByString("H$i")).value as TextCellValue;

      final rawTrainersCell =
          sheet.cell(CellIndex.indexByString("I$i")).value as TextCellValue;

      final rawBlockCell =
          sheet.cell(CellIndex.indexByString("J$i")).value as TextCellValue;

      dtos.add(
        ParticipantInputDto.fromSheet(
          _ifEmptySetDefault(rawGenderCell.value.text, ""),
          _ifEmptySetDefault(rawFullnameCell.value.text, ""),
          rawDateOfBirthCell.asDateTimeUtc(),
          _ifEmptySetDefault(rawBeltCell, ""),
          _ifEmptySetDefault(rawSportsTitleCell.value.text, ""),
          rawWeightCell,
          _ifEmptySetDefault(rawRegionCell.value.text, ""),
          _ifEmptySetDefault(rawTrainersCell.value.text, ""),
          _ifEmptySetDefault(rawBlockCell.value.text, ""),
        ),
      );
    }

    return dtos;
  }

  String _ifEmptySetDefault(String? value, String defaultValue) {
    if (value == null) {
      return defaultValue;
    }

    return value;
  }
}

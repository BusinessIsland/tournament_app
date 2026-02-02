import 'package:excel/excel.dart';
import 'package:tournament_app/app/exceptions/entity_not_found.dart';
import 'package:tournament_app/app/exceptions/sheet_not_found_exception.dart';
import 'package:tournament_app/app/gateways/sheets/dto/participant_sheet_dto.dart';
import 'package:tournament_app/app/gateways/sheets/excel/cell_creator/excel_cell_creator.dart';
import 'package:tournament_app/app/gateways/sheets/excel/excel_data_reader.dart';
import 'package:tournament_app/app/models/trainer/trainer.dart';

class ApplicationFarEasternReader extends ExcelDataReader {
  final String mainSheetName = "Первенство ДФО";
  final String applicationSheetName = "Служебное";

  final List<String> headers = [
    "№ п/п",
    "Пол",
    "ФИО",
    "Дата рождения",
    "Кю, дан",
    "Разряд",
    "Вес",
    "Регион",
    "Тренер(ы)",
    "Блок",
    "Полных лет",
    "Служебные идентификаторы",
  ];

  ExcelCellCreator cellCreator = ExcelCellCreator();

  @override
  List<ParticipantSheetDto> readAll(Excel excel) {
    if (!excel.sheets.containsKey(mainSheetName)) {
      throw SheetNotFoundException(mainSheetName);
    }

    final List<ParticipantSheetDto> rows = List.empty(growable: true);
    final mainSheet = excel[mainSheetName];
    final applicationSheet = excel[applicationSheetName];

    for (int i = 2; i <= mainSheet.rows.length; i++) {
      final idCell = mainSheet.cell(CellIndex.indexByString("A$i"));

      if (idCell.value == null) {
        return rows;
      }

      final rawId = extractValueFromCell(applicationSheet, "B$i");
      final rawRowId = extractValueFromCell(mainSheet, "A$i");
      final rawGender = extractValueFromCell(mainSheet, "B$i");
      final rawFullname = extractValueFromCell(mainSheet, "C$i");
      final rawDateOfBirth = extractValueFromCell(mainSheet, "D$i");
      final rawBelt = extractValueFromCell(mainSheet, "E$i");
      final rawSportsTitle = extractValueFromCell(mainSheet, "F$i");
      final rawWeight = extractValueFromCell(mainSheet, "G$i");
      final rawRegion = extractValueFromCell(mainSheet, "H$i");
      final rawTrainers = extractValueFromCell(mainSheet, "I$i");
      final rawBlock = extractValueFromCell(mainSheet, "J$i");

      final row = ParticipantSheetDto.withValidation(
        rawId,
        rawRowId,
        rawGender,
        rawFullname,
        rawDateOfBirth,
        rawBelt,
        rawSportsTitle,
        rawWeight,
        rawRegion,
        rawTrainers,
        rawBlock,
      );

      rows.add(row);
    }

    return rows;
  }

  @override
  ParticipantSheetDto getById(Excel excel, String id) {
    final mainSheet = excel[mainSheetName];
    final applicationSheet = excel[applicationSheetName];

    for (int i = 2; i <= applicationSheet.rows.length; i++) {
      final idCell = mainSheet.cell(CellIndex.indexByString("A$i"));

      if (idCell.value == null) {
        throw EntityNotFound("запись с идентификатором $id не найдена");
      }

      final rawId = extractValueFromCell(applicationSheet, "B$i");
      final rawRowId = extractValueFromCell(mainSheet, "A$i");

      if (rawId != id) {
        continue;
      }

      final rawGender = extractValueFromCell(mainSheet, "B$i");
      final rawFullname = extractValueFromCell(mainSheet, "C$i");
      final rawDateOfBirth = extractValueFromCell(mainSheet, "D$i");
      final rawBelt = extractValueFromCell(mainSheet, "E$i");
      final rawSportsTitle = extractValueFromCell(mainSheet, "F$i");
      final rawWeight = extractValueFromCell(mainSheet, "G$i");
      final rawRegion = extractValueFromCell(mainSheet, "H$i");
      final rawTrainers = extractValueFromCell(mainSheet, "I$i");
      final rawBlock = extractValueFromCell(mainSheet, "J$i");

      return ParticipantSheetDto.withValidation(
        rawId,
        rawRowId,
        rawGender,
        rawFullname,
        rawDateOfBirth,
        rawBelt,
        rawSportsTitle,
        rawWeight,
        rawRegion,
        rawTrainers,
        rawBlock,
      );
    }

    throw EntityNotFound("запись с идентификатором $id не найдена");
  }

  @override
  ParticipantSheetDto create(Excel src, Excel dest, ParticipantSheetDto dto) {
    copyTo(src, dest, null);
    final newMainSheet = dest[mainSheetName];
    final newApplicationSheet = dest[applicationSheetName];
    final lastRowId = newMainSheet.maxRows + 1;

    cellCreator.createIntegerCell(
      newApplicationSheet,
      "A$lastRowId",
      lastRowId - 1,
      cellCreator.rowCellStyle,
    );
    cellCreator.createTextCell(
      newApplicationSheet,
      "B$lastRowId",
      dto.id,
      cellCreator.rowCellStyle,
    );
    cellCreator.createIntegerCell(
      newMainSheet,
      "A$lastRowId",
      lastRowId - 1,
      cellCreator.rowCellStyle,
    );
    cellCreator.createTextCell(
      newMainSheet,
      "B$lastRowId",
      dto.gender.shortLabel,
      cellCreator.rowCellStyle,
    );
    cellCreator.createTextCell(
      newMainSheet,
      "C$lastRowId",
      dto.name.getFullName(),
      cellCreator.rowCellStyle,
    );
    cellCreator.createDateCell(
      newMainSheet,
      "D$lastRowId",
      DateTime.parse(dto.dateOfBirth.toIsoString()),
      cellCreator.rowDateCellStyle,
    );
    cellCreator.createTextCell(
      newMainSheet,
      "E$lastRowId",
      dto.belt.stringified,
      cellCreator.rowCellStyle,
    );
    cellCreator.createTextCell(
      newMainSheet,
      "F$lastRowId",
      dto.sportsTitle.sheetAlias,
      cellCreator.rowCellStyle,
    );
    cellCreator.createDoubleCell(
      newMainSheet,
      "G$lastRowId",
      dto.weight,
      cellCreator.rowCellStyle,
    );
    cellCreator.createTextCell(
      newMainSheet,
      "H$lastRowId",
      dto.region,
      cellCreator.rowCellStyle,
    );
    cellCreator.createTextCell(
      newMainSheet,
      "I$lastRowId",
      dto.trainers.stringify(),
      cellCreator.rowCellStyle,
    );
    cellCreator.createTextCell(
      newMainSheet,
      "J$lastRowId",
      dto.block,
      cellCreator.rowCellStyle,
    );
    cellCreator.createFormulaCell(
      newMainSheet,
      "K$lastRowId",
      "=INT(YEARFRAC(D$lastRowId,\$L\$2,1))",
      cellCreator.rowCellStyle,
    );

    dto.rowId = lastRowId;
    return dto;
  }

  @override
  ParticipantSheetDto update(
    Excel src,
    Excel dest,
    String id,
    ParticipantSheetDto dto,
  ) {
    copyTo(src, dest, null);
    final newMainSheet = dest[mainSheetName];
    final newApplicationSheet = dest[applicationSheetName];

    final found = getById(src, id);

    int rowId = found.rowId + 1;

    cellCreator.createIntegerCell(
      newApplicationSheet,
      "A$rowId",
      found.rowId,
      cellCreator.rowCellStyle,
    );
    cellCreator.createTextCell(
      newApplicationSheet,
      "B$rowId",
      found.id,
      cellCreator.rowCellStyle,
    );
    cellCreator.createIntegerCell(
      newMainSheet,
      "A$rowId",
      found.rowId,
      cellCreator.rowCellStyle,
    );
    cellCreator.createTextCell(
      newMainSheet,
      "B$rowId",
      dto.gender.shortLabel,
      cellCreator.rowCellStyle,
    );
    cellCreator.createTextCell(
      newMainSheet,
      "C$rowId",
      dto.name.getFullName(),
      cellCreator.rowCellStyle,
    );
    cellCreator.createDateCell(
      newMainSheet,
      "D$rowId",
      DateTime.parse(dto.dateOfBirth.toIsoString()),
      cellCreator.rowDateCellStyle,
    );
    cellCreator.createTextCell(
      newMainSheet,
      "E$rowId",
      dto.belt.stringified,
      cellCreator.rowCellStyle,
    );
    cellCreator.createTextCell(
      newMainSheet,
      "F$rowId",
      dto.sportsTitle.sheetAlias,
      cellCreator.rowCellStyle,
    );
    cellCreator.createDoubleCell(
      newMainSheet,
      "G$rowId",
      dto.weight,
      cellCreator.rowCellStyle,
    );
    cellCreator.createTextCell(
      newMainSheet,
      "H$rowId",
      dto.region,
      cellCreator.rowCellStyle,
    );
    cellCreator.createTextCell(
      newMainSheet,
      "I$rowId",
      dto.trainers.stringify(),
      cellCreator.rowCellStyle,
    );
    cellCreator.createTextCell(
      newMainSheet,
      "J$rowId",
      dto.block,
      cellCreator.rowCellStyle,
    );
    cellCreator.createFormulaCell(
      newMainSheet,
      "K$rowId",
      "=INT(YEARFRAC(D$rowId,\$L\$2,1))",
      cellCreator.rowCellStyle,
    );

    return ParticipantSheetDto(
      found.id,
      found.rowId,
      dto.gender,
      dto.name,
      dto.dateOfBirth,
      dto.belt,
      dto.sportsTitle,
      dto.weight,
      dto.region,
      dto.trainers,
      dto.block,
    );
  }

  @override
  void delete(Excel src, Excel dest, List<String> ids) {
    copyTo(src, dest, ids);
  }

  void copyTo(Excel src, Excel dest, List<String>? skipRowIds) {
    final oldMainSheet = src[mainSheetName];
    final oldApplicationSheet = src[applicationSheetName];

    final newMainSheet = dest[mainSheetName];
    final newApplicationSheet = dest[applicationSheetName];

    dest.delete("Sheet1");

    cellCreator.createTextCell(
      newMainSheet,
      "A1",
      headers[0],
      cellCreator.headerCellStyle,
    );
    cellCreator.createTextCell(
      newMainSheet,
      "B1",
      headers[1],
      cellCreator.headerCellStyle,
    );
    cellCreator.createTextCell(
      newMainSheet,
      "C1",
      headers[2],
      cellCreator.headerCellStyle,
    );
    cellCreator.createTextCell(
      newMainSheet,
      "D1",
      headers[3],
      cellCreator.headerCellStyle,
    );
    cellCreator.createTextCell(
      newMainSheet,
      "E1",
      headers[4],
      cellCreator.headerCellStyle,
    );
    cellCreator.createTextCell(
      newMainSheet,
      "F1",
      headers[5],
      cellCreator.headerCellStyle,
    );
    cellCreator.createTextCell(
      newMainSheet,
      "G1",
      headers[6],
      cellCreator.headerCellStyle,
    );
    cellCreator.createTextCell(
      newMainSheet,
      "H1",
      headers[7],
      cellCreator.headerCellStyle,
    );
    cellCreator.createTextCell(
      newMainSheet,
      "I1",
      headers[8],
      cellCreator.headerCellStyle,
    );
    cellCreator.createTextCell(
      newMainSheet,
      "J1",
      headers[9],
      cellCreator.headerCellStyle,
    );
    cellCreator.createTextCell(
      newMainSheet,
      "K1",
      headers[10],
      cellCreator.headerCellStyle,
    );
    cellCreator.createTextCell(
      newMainSheet,
      "L1",
      "Текущая дата",
      cellCreator.headerCellStyle,
    );
    cellCreator.createFormulaCell(
      newMainSheet,
      "L2",
      "=TODAY()",
      cellCreator.rowDateCellStyle,
    );
    cellCreator.createTextCell(
      newApplicationSheet,
      "A1",
      headers[0],
      cellCreator.headerCellStyle,
    );
    cellCreator.createTextCell(
      newApplicationSheet,
      "B1",
      headers[11],
      cellCreator.headerCellStyle,
    );

    int rowIndex = 2;
    int recordIndex = 1;

    for (int i = 2; i <= oldMainSheet.rows.length; i++) {
      final idCell = oldMainSheet.cell(CellIndex.indexByString("A$i"));

      if (idCell.value == null) {
        return;
      }

      final oldIdValue = extractValueFromCell(oldApplicationSheet, "B$i");

      if (skipRowIds != null) {
        if (skipRowIds.contains(oldIdValue)) {
          continue;
        }
      }

      final oldGender = extractValueFromCell(oldMainSheet, "B$i");
      final oldFullname = extractValueFromCell(oldMainSheet, "C$i");
      final oldDateOfBirth = extractValueFromCell(oldMainSheet, "D$i");
      final oldBelt = extractValueFromCell(oldMainSheet, "E$i");
      final oldSportsTitle = extractValueFromCell(oldMainSheet, "F$i");
      final oldWeight = extractValueFromCell(oldMainSheet, "G$i");
      final oldRegion = extractValueFromCell(oldMainSheet, "H$i");
      final oldTrainers = extractValueFromCell(oldMainSheet, "I$i");
      final oldBlock = extractValueFromCell(oldMainSheet, "J$i");

      final row = ParticipantSheetDto.withValidation(
        oldIdValue,
        rowIndex.toString(),
        oldGender,
        oldFullname,
        oldDateOfBirth,
        oldBelt,
        oldSportsTitle,
        oldWeight,
        oldRegion,
        oldTrainers,
        oldBlock,
      );

      cellCreator.createIntegerCell(
        newApplicationSheet,
        "A$rowIndex",
        recordIndex,
        cellCreator.rowCellStyle,
      );
      cellCreator.createTextCell(
        newApplicationSheet,
        "B$rowIndex",
        row.id,
        cellCreator.rowCellStyle,
      );
      cellCreator.createIntegerCell(
        newMainSheet,
        "A$rowIndex",
        recordIndex,
        cellCreator.rowCellStyle,
      );
      cellCreator.createTextCell(
        newMainSheet,
        "B$rowIndex",
        row.gender.shortLabel,
        cellCreator.rowCellStyle,
      );
      cellCreator.createTextCell(
        newMainSheet,
        "C$rowIndex",
        row.name.getFullName(),
        cellCreator.rowCellStyle,
      );
      cellCreator.createDateCell(
        newMainSheet,
        "D$rowIndex",
        DateTime.parse(row.dateOfBirth.toIsoString()),
        cellCreator.rowDateCellStyle,
      );
      cellCreator.createTextCell(
        newMainSheet,
        "E$rowIndex",
        row.belt.stringified,
        cellCreator.rowCellStyle,
      );
      cellCreator.createTextCell(
        newMainSheet,
        "F$rowIndex",
        row.sportsTitle.sheetAlias,
        cellCreator.rowCellStyle,
      );
      cellCreator.createDoubleCell(
        newMainSheet,
        "G$rowIndex",
        row.weight,
        cellCreator.rowCellStyle,
      );
      cellCreator.createTextCell(
        newMainSheet,
        "H$rowIndex",
        row.region,
        cellCreator.rowCellStyle,
      );
      cellCreator.createTextCell(
        newMainSheet,
        "I$rowIndex",
        row.trainers.stringify(),
        cellCreator.rowCellStyle,
      );
      cellCreator.createTextCell(
        newMainSheet,
        "J$rowIndex",
        row.block,
        cellCreator.rowCellStyle,
      );
      cellCreator.createFormulaCell(
        newMainSheet,
        "K$rowIndex",
        "=INT(YEARFRAC(D$rowIndex,\$L\$2,1))",
        cellCreator.rowCellStyle,
      );

      rowIndex++;
      recordIndex++;
    }
  }

  String extractValueFromCell(Sheet sheet, String position) {
    final cell = sheet.cell(CellIndex.indexByString(position));

    if (cell.value == null) {
      return "";
    }

    return cell.value.toString();
  }
}

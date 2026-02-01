import 'package:excel/excel.dart';
import 'package:tournament_app/app/exceptions/sheet_not_found_exception.dart';
import 'package:tournament_app/app/gateways/sheets/dto/participant_sheet_dto.dart';
import 'package:tournament_app/app/gateways/sheets/excel/cell_creator/excel_cell_creator.dart';
import 'package:tournament_app/app/gateways/sheets/excel/excel_data_reader.dart';
import 'package:tournament_app/app/models/trainer/trainer.dart';

class ApplicationFarEasternReader extends ExcelDataReader {
  final String sheetName = "Первенство ДФО";
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
  ];

  ExcelCellCreator cellCreator = ExcelCellCreator();

  @override
  List<ParticipantSheetDto> readAll(Excel excel) {
    if (!excel.sheets.containsKey(sheetName)) {
      throw SheetNotFoundException(sheetName);
    }

    final List<ParticipantSheetDto> rows = List.empty(growable: true);
    var sheet = excel[sheetName];

    for (int i = 2; i <= sheet.rows.length; i++) {
      final idCell = sheet.cell(CellIndex.indexByString("A$i"));

      if (idCell.value == null) {
        return rows;
      }

      final rawId = extractValueFromCell(sheet, "AA$i");
      final rawRowId = extractValueFromCell(sheet, "A$i");
      final rawGender = extractValueFromCell(sheet, "B$i");
      final rawFullname = extractValueFromCell(sheet, "C$i");
      final rawDateOfBirth = extractValueFromCell(sheet, "D$i");
      final rawBelt = extractValueFromCell(sheet, "E$i");
      final rawSportsTitle = extractValueFromCell(sheet, "F$i");
      final rawWeight = extractValueFromCell(sheet, "G$i");
      final rawRegion = extractValueFromCell(sheet, "H$i");
      final rawTrainers = extractValueFromCell(sheet, "I$i");
      final rawBlock = extractValueFromCell(sheet, "J$i");

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
  ParticipantSheetDto create(Excel src, Excel dest, ParticipantSheetDto dto) {
    copyTo(src, dest, null);
    final newSheet = dest[sheetName];
    final lastRowId = newSheet.maxRows + 1;

    cellCreator.createTextCell(
      newSheet,
      "AA$lastRowId",
      dto.id,
      cellCreator.rowCellStyle,
    );
    cellCreator.createIntegerCell(
      newSheet,
      "A$lastRowId",
      lastRowId,
      cellCreator.rowCellStyle,
    );
    cellCreator.createTextCell(
      newSheet,
      "B$lastRowId",
      dto.gender.shortLabel,
      cellCreator.rowCellStyle,
    );
    cellCreator.createTextCell(
      newSheet,
      "C$lastRowId",
      dto.fullname.getFullName(),
      cellCreator.rowCellStyle,
    );
    cellCreator.createDateCell(
      newSheet,
      "D$lastRowId",
      DateTime.parse(dto.dateOfBirth.toIsoString()),
      cellCreator.rowDateCellStyle,
    );
    cellCreator.createTextCell(
      newSheet,
      "E$lastRowId",
      dto.belt.stringified,
      cellCreator.rowCellStyle,
    );
    cellCreator.createTextCell(
      newSheet,
      "F$lastRowId",
      dto.sportsTitle.sheetAlias,
      cellCreator.rowCellStyle,
    );
    cellCreator.createDoubleCell(
      newSheet,
      "G$lastRowId",
      dto.weight,
      cellCreator.rowCellStyle,
    );
    cellCreator.createTextCell(
      newSheet,
      "H$lastRowId",
      dto.region,
      cellCreator.rowCellStyle,
    );
    cellCreator.createTextCell(
      newSheet,
      "I$lastRowId",
      dto.trainers.stringify(),
      cellCreator.rowCellStyle,
    );
    cellCreator.createTextCell(
      newSheet,
      "J$lastRowId",
      dto.block,
      cellCreator.rowCellStyle,
    );
    cellCreator.createFormulaCell(
      newSheet,
      "K$lastRowId",
      "=INT(YEARFRAC(D$lastRowId,\$L\$2,1))",
      cellCreator.rowCellStyle,
    );

    return dto;
  }

  @override
  void delete(Excel src, Excel dest, List<int> deleteRowIds) {
    copyTo(src, dest, deleteRowIds);
  }

  void copyTo(Excel src, Excel dest, List<int>? skipRowIds) {
    final oldSheet = src[sheetName];
    final newSheet = dest[sheetName];

    dest.delete("Sheet1");

    cellCreator.createTextCell(
      newSheet,
      "A1",
      headers[0],
      cellCreator.headerCellStyle,
    );
    cellCreator.createTextCell(
      newSheet,
      "B1",
      headers[1],
      cellCreator.headerCellStyle,
    );
    cellCreator.createTextCell(
      newSheet,
      "C1",
      headers[2],
      cellCreator.headerCellStyle,
    );
    cellCreator.createTextCell(
      newSheet,
      "D1",
      headers[3],
      cellCreator.headerCellStyle,
    );
    cellCreator.createTextCell(
      newSheet,
      "E1",
      headers[4],
      cellCreator.headerCellStyle,
    );
    cellCreator.createTextCell(
      newSheet,
      "F1",
      headers[5],
      cellCreator.headerCellStyle,
    );
    cellCreator.createTextCell(
      newSheet,
      "G1",
      headers[6],
      cellCreator.headerCellStyle,
    );
    cellCreator.createTextCell(
      newSheet,
      "H1",
      headers[7],
      cellCreator.headerCellStyle,
    );
    cellCreator.createTextCell(
      newSheet,
      "I1",
      headers[8],
      cellCreator.headerCellStyle,
    );
    cellCreator.createTextCell(
      newSheet,
      "J1",
      headers[9],
      cellCreator.headerCellStyle,
    );
    cellCreator.createTextCell(
      newSheet,
      "K1",
      headers[10],
      cellCreator.headerCellStyle,
    );
    cellCreator.createTextCell(
      newSheet,
      "L1",
      "Текущая дата",
      cellCreator.headerCellStyle,
    );
    cellCreator.createFormulaCell(
      newSheet,
      "L2",
      "=TODAY()",
      cellCreator.rowDateCellStyle,
    );

    int rowIndex = 2;

    for (int i = 2; i <= oldSheet.rows.length; i++) {
      if (skipRowIds != null) {
        if (skipRowIds.contains(i)) {
          continue;
        }
      }

      final idCell = oldSheet.cell(CellIndex.indexByString("A$i"));

      if (idCell.value == null) {
        return;
      }

      final oldIdValue = extractValueFromCell(oldSheet, "A$i");
      final oldGender = extractValueFromCell(oldSheet, "B$i");
      final oldFullname = extractValueFromCell(oldSheet, "C$i");
      final oldDateOfBirth = extractValueFromCell(oldSheet, "D$i");
      final oldBelt = extractValueFromCell(oldSheet, "E$i");
      final oldSportsTitle = extractValueFromCell(oldSheet, "F$i");
      final oldWeight = extractValueFromCell(oldSheet, "G$i");
      final oldRegion = extractValueFromCell(oldSheet, "H$i");
      final oldTrainers = extractValueFromCell(oldSheet, "I$i");
      final oldBlock = extractValueFromCell(oldSheet, "J$i");

      cellCreator.createIntegerCell(
        newSheet,
        "A$rowIndex",
        int.parse(oldIdValue),
        cellCreator.rowCellStyle,
      );
      cellCreator.createTextCell(
        newSheet,
        "B$rowIndex",
        oldGender,
        cellCreator.rowCellStyle,
      );
      cellCreator.createTextCell(
        newSheet,
        "C$rowIndex",
        oldFullname,
        cellCreator.rowCellStyle,
      );
      cellCreator.createDateCell(
        newSheet,
        "D$rowIndex",
        DateTime.parse(oldDateOfBirth),
        cellCreator.rowDateCellStyle,
      );
      cellCreator.createTextCell(
        newSheet,
        "E$rowIndex",
        oldBelt,
        cellCreator.rowCellStyle,
      );
      cellCreator.createTextCell(
        newSheet,
        "F$rowIndex",
        oldSportsTitle,
        cellCreator.rowCellStyle,
      );
      cellCreator.createDoubleCell(
        newSheet,
        "G$rowIndex",
        double.parse(oldWeight),
        cellCreator.rowCellStyle,
      );
      cellCreator.createTextCell(
        newSheet,
        "H$rowIndex",
        oldRegion,
        cellCreator.rowCellStyle,
      );
      cellCreator.createTextCell(
        newSheet,
        "I$rowIndex",
        oldTrainers,
        cellCreator.rowCellStyle,
      );
      cellCreator.createTextCell(
        newSheet,
        "J$rowIndex",
        oldBlock,
        cellCreator.rowCellStyle,
      );
      cellCreator.createFormulaCell(
        newSheet,
        "K$rowIndex",
        "=INT(YEARFRAC(D$i,\$L\$2,1))",
        cellCreator.rowCellStyle,
      );

      rowIndex++;
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

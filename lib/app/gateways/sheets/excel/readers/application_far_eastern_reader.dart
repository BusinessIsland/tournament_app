import 'package:excel/excel.dart';
import 'package:tournament_app/app/exceptions/entity_not_found.dart';
import 'package:tournament_app/app/exceptions/sheet_not_found_exception.dart';
import 'package:tournament_app/app/gateways/sheets/dto/participant_sheet_dto.dart';
import 'package:tournament_app/app/gateways/sheets/excel/cell_creator/excel_cell_creator.dart';
import 'package:tournament_app/app/gateways/sheets/excel/cell_creator/excel_cell_type.dart';
import 'package:tournament_app/app/gateways/sheets/excel/excel_data_reader.dart';
import 'package:tournament_app/app/gateways/sheets/excel/excel_row/excel_row.dart';
import 'package:tournament_app/app/models/trainer/trainer.dart';

class ApplicationFarEasternReader extends ExcelDataReader {
  final String mainSheetName = "Первенство ДФО";
  final String appSheetName = "Служебное";

  // заголовки для листа "Первенство ДФО"
  final List<String> mainHeaders = [
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
    "Текущая дата",
  ];

  // заголовки для листа "Служебное"
  final List<String> appHeaders = ["№ п/п", "Служебные идентификаторы"];

  // номера столбцов для листа "Первенство ДФО"
  final int mainColRowId = 0;
  final int mainColGender = 1;
  final int mainColFullname = 2;
  final int mainColDateOfBirth = 3;
  final int mainColBelt = 4;
  final int mainColSportsTitle = 5;
  final int mainColWeight = 6;
  final int mainColRegion = 7;
  final int mainColTrainers = 8;
  final int mainColBlock = 9;
  final int mainColAge = 10;
  final int mainColCurrentDate = 11;

  // номера столбцов для листа "Служебное"
  final int appColRowId = 0;
  final int appColId = 1;

  ExcelCellCreator cellCreator = ExcelCellCreator();

  @override
  List<ParticipantSheetDto> readAll(Excel excel) {
    _sheetExistsOrThrow(excel, mainSheetName);

    final mainSheet = excel[mainSheetName];
    final appSheet = excel[appSheetName];

    final List<ParticipantSheetDto> rows = List.empty(growable: true);

    for (int i = 1; i < mainSheet.maxRows; i++) {
      final mainRowData = mainSheet.rows[i];

      if (mainRowData[mainColFullname]?.value == null) break;

      final dto = _mapRowToDto(mainSheet, appSheet, i);
      rows.add(dto);
    }

    return rows;
  }

  @override
  ParticipantSheetDto getById(Excel excel, String id) {
    _sheetExistsOrThrow(excel, mainSheetName);

    final mainSheet = excel[mainSheetName];
    final appSheet = excel[appSheetName];

    if (!excel.sheets.containsKey(mainSheetName)) {
      throw SheetNotFoundException(mainSheetName);
    }

    for (int i = 1; i < appSheet.maxRows; i++) {
      final currentId = appSheet
          .cell(CellIndex.indexByColumnRow(columnIndex: appColId, rowIndex: i))
          .value;

      if (currentId == null) {
        throw EntityNotFound("участник с идентификатором '$id' не найден");
      }

      if (currentId.toString() == id) {
        return _mapRowToDto(mainSheet, appSheet, i);
      }
    }

    throw EntityNotFound("участник с идентификатором $id не найден");
  }

  @override
  ParticipantSheetDto create(Excel src, Excel dest, ParticipantSheetDto dto) {
    _sheetExistsOrThrow(src, mainSheetName);

    _copyTo(src, dest, null);

    final mainSheet = dest[mainSheetName];
    final appSheet = dest[appSheetName];
    final lastRowId = _findSheetEnd(mainSheet);

    final toSave = ParticipantSheetDto(
      id: dto.id,
      rowId: RowId(lastRowId),
      gender: dto.gender,
      name: dto.name,
      dateOfBirth: dto.dateOfBirth,
      belt: dto.belt,
      sportsTitle: dto.sportsTitle,
      weight: dto.weight,
      region: dto.region,
      trainers: dto.trainers,
      block: dto.block,
    );

    _mapDtoToRow(mainSheet, appSheet, lastRowId, toSave);

    return toSave;
  }

  @override
  ParticipantSheetDto update(
    Excel src,
    Excel dest,
    String id,
    ParticipantSheetDto dto,
  ) {
    _sheetExistsOrThrow(src, mainSheetName);

    _copyTo(src, dest, null);

    final mainSheet = dest[mainSheetName];
    final appSheet = dest[appSheetName];

    final found = getById(src, id);

    final toSave = ParticipantSheetDto(
      id: found.id,
      rowId: found.rowId,
      gender: dto.gender,
      name: dto.name,
      dateOfBirth: dto.dateOfBirth,
      belt: dto.belt,
      sportsTitle: dto.sportsTitle,
      weight: dto.weight,
      region: dto.region,
      trainers: dto.trainers,
      block: dto.block,
    );
    _mapDtoToRow(mainSheet, appSheet, toSave.rowId.label, toSave);

    return toSave;
  }

  @override
  void delete(Excel src, Excel dest, List<String> ids) {
    _copyTo(src, dest, ids);
  }

  int _findSheetEnd(Sheet sheet) {
    int i = 0;
    for (; i < sheet.maxRows; i++) {
      final mainRowData = sheet.rows[i];

      if (mainRowData[mainColFullname]?.value == null) return i;
    }

    return i;
  }

  void _copyTo(Excel src, Excel dest, List<String>? skipRowIds) {
    _sheetExistsOrThrow(src, mainSheetName);
    _sheetExistsOrThrow(src, appSheetName);

    final oldMainSheet = src[mainSheetName];
    final oldAppSheet = src[appSheetName];

    final newMainSheet = dest[mainSheetName];
    final newAppSheet = dest[appSheetName];
    dest.delete("Sheet1");

    _mapHeadersToRow(newMainSheet, newAppSheet);

    int rowIndex = 1;
    int recordIndex = 1;

    for (int i = 1; i < oldMainSheet.maxRows; i++) {
      final oldId = oldAppSheet
          .cell(CellIndex.indexByColumnRow(columnIndex: appColId, rowIndex: i))
          .value;

      if (oldId != null && skipRowIds != null) {
        if (skipRowIds.contains(oldId.toString())) {
          continue;
        }
      }

      final dto = _mapRowToDto(oldMainSheet, oldAppSheet, i);
      final toSave = ParticipantSheetDto(
        id: dto.id,
        rowId: RowId(recordIndex),
        gender: dto.gender,
        name: dto.name,
        dateOfBirth: dto.dateOfBirth,
        belt: dto.belt,
        sportsTitle: dto.sportsTitle,
        weight: dto.weight,
        region: dto.region,
        trainers: dto.trainers,
        block: dto.block,
      );
      _mapDtoToRow(newMainSheet, newAppSheet, rowIndex, toSave);

      rowIndex++;
      recordIndex++;
    }
  }

  void _sheetExistsOrThrow(Excel excel, String sheetName) {
    if (!excel.sheets.containsKey(sheetName)) {
      throw SheetNotFoundException(sheetName);
    }
  }

  ParticipantSheetDto _mapRowToDto(
    Sheet mainSheet,
    Sheet appSheet,
    int rowIndex,
  ) {
    String? getValue(Sheet sheet, int colIndex, int rowIndex) {
      return sheet
          .cell(
            CellIndex.indexByColumnRow(
              columnIndex: colIndex,
              rowIndex: rowIndex,
            ),
          )
          .value
          ?.toString();
    }

    return ParticipantSheetDto.withValidation(
      rawId: getValue(appSheet, appColId, rowIndex),
      rawRowId: getValue(mainSheet, mainColRowId, rowIndex),
      rawGender: getValue(mainSheet, mainColGender, rowIndex),
      rawFullname: getValue(mainSheet, mainColFullname, rowIndex),
      rawDateOfBirth: getValue(mainSheet, mainColDateOfBirth, rowIndex),
      rawBelt: getValue(mainSheet, mainColBelt, rowIndex),
      rawSportsTitle: getValue(mainSheet, mainColSportsTitle, rowIndex),
      rawWeight: getValue(mainSheet, mainColWeight, rowIndex),
      rawRegion: getValue(mainSheet, mainColRegion, rowIndex),
      rawTrainers: getValue(mainSheet, mainColTrainers, rowIndex),
      rawBlock: getValue(mainSheet, mainColBlock, rowIndex),
    );
  }

  void _mapHeadersToRow(Sheet mainSheet, Sheet appSheet) {
    ExcelRow(mainSheet, 0)
      ..add(mainColRowId, mainHeaders[0], ExcelCellType.headerText)
      ..add(mainColGender, mainHeaders[1], ExcelCellType.headerText)
      ..add(mainColFullname, mainHeaders[2], ExcelCellType.headerText)
      ..add(mainColDateOfBirth, mainHeaders[3], ExcelCellType.headerText)
      ..add(mainColBelt, mainHeaders[4], ExcelCellType.headerText)
      ..add(mainColSportsTitle, mainHeaders[5], ExcelCellType.headerText)
      ..add(mainColWeight, mainHeaders[6], ExcelCellType.headerText)
      ..add(mainColRegion, mainHeaders[7], ExcelCellType.headerText)
      ..add(mainColTrainers, mainHeaders[8], ExcelCellType.headerText)
      ..add(mainColBlock, mainHeaders[9], ExcelCellType.headerText)
      ..add(mainColAge, mainHeaders[10], ExcelCellType.headerText)
      ..add(mainColCurrentDate, mainHeaders[11], ExcelCellType.headerText);

    ExcelRow(appSheet, 0)
      ..add(appColRowId, appHeaders[0], ExcelCellType.text)
      ..add(appColId, appHeaders[1], ExcelCellType.text);

    ExcelRow(
      mainSheet,
      1,
    ).add(mainColCurrentDate, DateTime.now(), ExcelCellType.date);
  }

  void _mapDtoToRow(
    Sheet mainSheet,
    Sheet appSheet,
    int rowIndex,
    ParticipantSheetDto dto,
  ) {
    ExcelRow(mainSheet, rowIndex)
      ..add(mainColRowId, dto.rowId.label, ExcelCellType.int)
      ..add(mainColGender, dto.gender.shortLabel, ExcelCellType.text)
      ..add(mainColFullname, dto.name.getFullName(), ExcelCellType.text)
      ..add(mainColDateOfBirth, dto.dateOfBirth.label, ExcelCellType.date)
      ..add(mainColBelt, dto.belt.stringified, ExcelCellType.text)
      ..add(mainColSportsTitle, dto.sportsTitle.sheetAlias, ExcelCellType.text)
      ..add(mainColWeight, dto.weight.value, ExcelCellType.double)
      ..add(mainColRegion, dto.region.label, ExcelCellType.text)
      ..add(mainColTrainers, dto.trainers.stringify(), ExcelCellType.text)
      ..add(mainColBlock, dto.block.label, ExcelCellType.text)
      ..add(
        mainColAge,
        _buildAgeFormula(dto.rowId.label),
        ExcelCellType.formula,
      );

    ExcelRow(appSheet, rowIndex)
      ..add(appColRowId, dto.rowId.label, ExcelCellType.int)
      ..add(appColId, dto.id.value, ExcelCellType.text);
  }

  String _buildAgeFormula(int excelRowIndex) =>
      "=INT(YEARFRAC(D$excelRowIndex,\$L\$2,1))";
}

import 'package:excel/excel.dart';
import 'package:tournament_app/app/gateways/sheets/excel/cell_creator/excel_cell_type.dart';
import 'package:tournament_app/app/gateways/sheets/excel/cell_styler/excel_cell_styler.dart';

class ExcelCellCreator {
  final styler = ExcelCellStyler();

  void create(
    Sheet sheet,
    int colIndex,
    int rowIndex,
    dynamic value,
    ExcelCellType type,
  ) {
    final cell = sheet.cell(
      CellIndex.indexByColumnRow(columnIndex: colIndex, rowIndex: rowIndex),
    );

    switch (type) {
      case ExcelCellType.int:
        cell.value = IntCellValue(value as int);
        cell.cellStyle = styler.rowCellStyle;
      case ExcelCellType.double:
        cell.value = DoubleCellValue(value as double);
        cell.cellStyle = styler.rowCellStyle;
      case ExcelCellType.date:
        cell.value = DateCellValue.fromDateTime(value as DateTime);
        cell.cellStyle = styler.rowDateCellStyle;
      case ExcelCellType.formula:
        cell.value = FormulaCellValue(value as String);
        cell.cellStyle = styler.rowCellStyle;
      case ExcelCellType.headerText:
        cell.value = TextCellValue(value as String);
        cell.cellStyle = styler.headerCellStyle;
      case ExcelCellType.text:
        cell.value = TextCellValue(value as String);
        cell.cellStyle = styler.rowCellStyle;
    }
  }
}

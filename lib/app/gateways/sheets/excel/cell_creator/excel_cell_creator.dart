import 'package:excel/excel.dart';

class ExcelCellCreator {
  final CellStyle rowCellStyle = CellStyle(
    bottomBorder: Border(
      borderStyle: BorderStyle.Thin,
      borderColorHex: ExcelColor.black,
    ),
    topBorder: Border(
      borderStyle: BorderStyle.Thin,
      borderColorHex: ExcelColor.black,
    ),
    leftBorder: Border(
      borderStyle: BorderStyle.Thin,
      borderColorHex: ExcelColor.black,
    ),
    rightBorder: Border(
      borderStyle: BorderStyle.Thin,
      borderColorHex: ExcelColor.black,
    ),
    fontFamily: getFontFamily(FontFamily.Arial),
    fontSize: 12,
    horizontalAlign: HorizontalAlign.Center,
    verticalAlign: VerticalAlign.Center,
  );

  final CellStyle rowDateCellStyle = CellStyle(
    bottomBorder: Border(
      borderStyle: BorderStyle.Thin,
      borderColorHex: ExcelColor.black,
    ),
    topBorder: Border(
      borderStyle: BorderStyle.Thin,
      borderColorHex: ExcelColor.black,
    ),
    leftBorder: Border(
      borderStyle: BorderStyle.Thin,
      borderColorHex: ExcelColor.black,
    ),
    rightBorder: Border(
      borderStyle: BorderStyle.Thin,
      borderColorHex: ExcelColor.black,
    ),
    fontFamily: getFontFamily(FontFamily.Arial),
    fontSize: 12,
    horizontalAlign: HorizontalAlign.Center,
    verticalAlign: VerticalAlign.Center,
    numberFormat: NumFormat.standard_14,
  );

  final CellStyle headerCellStyle = CellStyle(
    bottomBorder: Border(
      borderStyle: BorderStyle.Thin,
      borderColorHex: ExcelColor.black,
    ),
    topBorder: Border(
      borderStyle: BorderStyle.Thin,
      borderColorHex: ExcelColor.black,
    ),
    leftBorder: Border(
      borderStyle: BorderStyle.Thin,
      borderColorHex: ExcelColor.black,
    ),
    rightBorder: Border(
      borderStyle: BorderStyle.Thin,
      borderColorHex: ExcelColor.black,
    ),
    fontFamily: getFontFamily(FontFamily.Arial),
    fontSize: 12,
    bold: true,
    horizontalAlign: HorizontalAlign.Center,
    verticalAlign: VerticalAlign.Center,
  );

  Data createTextCell(Sheet sheet, String position, String value, CellStyle style) {
    final cell = sheet.cell(CellIndex.indexByString(position));
    cell.value = TextCellValue(value);
    cell.cellStyle = style;

    return cell;
  }

  Data createFormulaCell(Sheet sheet, String position, String formula, CellStyle style) {
    final cell = sheet.cell(CellIndex.indexByString(position));
    cell.value = FormulaCellValue(formula);
    cell.cellStyle = style;

    return cell;
  }

  Data createIntegerCell(Sheet sheet, String position, int value, CellStyle style) {
    final cell = sheet.cell(CellIndex.indexByString(position));
    cell.value = IntCellValue(value);
    cell.cellStyle = style;

    return cell;
  }

  Data createDateCell(Sheet sheet, String position, DateTime date, CellStyle style) {
    final cell = sheet.cell(CellIndex.indexByString(position));
    cell.value = DateCellValue.fromDateTime(date);
    cell.cellStyle = style;

    return cell;
  }

  Data createDoubleCell(Sheet sheet, String position, double value, CellStyle style) {
    final cell = sheet.cell(CellIndex.indexByString(position));
    cell.value = DoubleCellValue(value);
    cell.cellStyle = style;

    return cell;
  }
}
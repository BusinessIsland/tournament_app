import 'package:excel/excel.dart';
import 'package:tournament_app/app/gateways/sheets/cell_styler/xlsx_cell_styler.dart';

class XlsxCompetitionJudgeCellStyler implements XlsxCellStyler {
  CellStyle get _baseStyle => CellStyle(
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

  @override
  CellStyle createHeaderCellStyle() {
    final style = _baseStyle;
    style.isBold = true;

    return style;
  }

  @override
  CellStyle createRowCellStyle({required bool bold}) {
    final style = _baseStyle;
    style.isBold = bold;

    return style;
  }
}

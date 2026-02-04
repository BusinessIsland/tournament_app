import 'package:excel/excel.dart';

class ExcelCellStyler {
  CellStyle get _baseStyle => CellStyle(
    bottomBorder: Border(borderStyle: BorderStyle.Thin, borderColorHex: ExcelColor.black),
    topBorder: Border(borderStyle: BorderStyle.Thin, borderColorHex: ExcelColor.black),
    leftBorder: Border(borderStyle: BorderStyle.Thin, borderColorHex: ExcelColor.black),
    rightBorder: Border(borderStyle: BorderStyle.Thin, borderColorHex: ExcelColor.black),
    fontFamily: getFontFamily(FontFamily.Arial),
    fontSize: 12,
    horizontalAlign: HorizontalAlign.Center,
    verticalAlign: VerticalAlign.Center,
  );

  late final CellStyle rowCellStyle = _baseStyle;
  late final CellStyle rowDateCellStyle = _createStyle(
    numberFormat: NumFormat.standard_14,
  );
  late final CellStyle headerCellStyle = _createStyle(
    bold: true,
  );

  CellStyle _createStyle({bool bold = false, NumFormat? numberFormat}) {
    final style = _baseStyle;
    style.isBold = bold;
    if (numberFormat != null) {
      style.numberFormat = numberFormat;
    }
    return style;
  }
}
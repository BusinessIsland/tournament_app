import 'package:excel/excel.dart';

abstract class XlsxCellStyler {
  CellStyle createHeaderCellStyle();
  CellStyle createRowCellStyle({required bool bold});
}
import 'package:excel/excel.dart';

abstract class IXlsxCellStyler {
  CellStyle createHeaderCellStyle();
  CellStyle createRowCellStyle({required bool bold});
}
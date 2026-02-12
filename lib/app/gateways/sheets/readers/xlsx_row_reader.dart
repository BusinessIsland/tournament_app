import 'package:excel/excel.dart';

abstract class XlsxRowReader {
  dynamic read(Sheet sheet, int rowIndex);
}
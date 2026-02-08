import 'package:excel/excel.dart';

abstract class IXlsxRowReader {
  dynamic read(Sheet sheet, int rowIndex);
}
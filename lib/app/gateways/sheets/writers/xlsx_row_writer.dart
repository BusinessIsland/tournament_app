import 'package:excel/excel.dart';

abstract class XlsxRowWriter {
  void writeHeaders(Sheet sheet);
  void writeData(Sheet sheet, dynamic value, int rowIndex);
}
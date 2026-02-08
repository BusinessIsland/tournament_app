import 'package:excel/excel.dart';

abstract class IXlsxRowWriter {
  void writeHeaders(Sheet sheet);
  void writeData(Sheet sheet, dynamic value, int rowIndex);
}
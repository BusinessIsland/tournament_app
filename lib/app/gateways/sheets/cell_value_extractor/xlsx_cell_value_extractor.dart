import 'package:excel/excel.dart';

abstract class XlsxCellValueExtractor {
  dynamic extract({
    required Sheet sheet,
    required int rowIndex,
    required int colIndex,
  });
}

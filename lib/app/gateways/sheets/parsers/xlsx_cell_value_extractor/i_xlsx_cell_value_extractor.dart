import 'package:excel/excel.dart';

abstract class IXlsxCellValueExtractor {
  dynamic extract({
    required Sheet sheet,
    required int rowIndex,
    required int colIndex,
  });
}

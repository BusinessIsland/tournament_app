import 'package:excel/excel.dart';
import 'package:tournament_app/app/gateways/sheets/parsers/xlsx_cell_value_extractor/i_xlsx_cell_value_extractor.dart';

class XlsxTextCellValueExtractor implements IXlsxCellValueExtractor {
  @override
  extract({required Sheet sheet, required int rowIndex, required int colIndex}) {
    final cell = sheet.cell(CellIndex.indexByColumnRow(columnIndex: colIndex, rowIndex: rowIndex));

    return cell.value == null ? "" : cell.value.toString();
  }
}
import 'package:tournament_app/app/gateways/sheets/cell_styler/xlsx_cell_styler.dart';
import 'package:tournament_app/app/gateways/sheets/cell_value_extractor/xlsx_cell_value_extractor.dart';
import 'package:tournament_app/app/gateways/sheets/readers/xlsx_row_reader.dart';
import 'package:tournament_app/app/gateways/sheets/sheet_cell_mapping/sheet_cell_mapping.dart';
import 'package:tournament_app/app/gateways/sheets/writers/xlsx_row_writer.dart';

abstract class SheetConfigFactory {
  String createSheetName();

  SheetCellMapping createHeaders();

  SheetCellMapping createColumns();

  XlsxCellStyler createStyler();

  XlsxCellValueExtractor createCellValueExtractor();

  XlsxRowWriter createRowWriter();

  XlsxRowReader createRowReader();
}

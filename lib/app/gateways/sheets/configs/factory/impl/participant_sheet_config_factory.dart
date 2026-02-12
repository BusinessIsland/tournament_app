import 'package:tournament_app/app/gateways/sheets/cell_styler/xlsx_cell_styler.dart';
import 'package:tournament_app/app/gateways/sheets/cell_value_extractor/xlsx_cell_value_extractor.dart';
import 'package:tournament_app/app/gateways/sheets/configs/factory/sheet_config_factory.dart';
import 'package:tournament_app/app/gateways/sheets/readers/xlsx_row_reader.dart';
import 'package:tournament_app/app/gateways/sheets/sheet_cell_mapping/sheet_cell_mapping.dart';
import 'package:tournament_app/app/gateways/sheets/writers/xlsx_row_writer.dart';

class ParticipantSheetConfigFactory implements SheetConfigFactory {
  @override
  XlsxCellValueExtractor createCellValueExtractor() {
    // TODO: implement createCellValueExtractor
    throw UnimplementedError();
  }

  @override
  SheetCellMapping<dynamic, dynamic> createColumns() {
    // TODO: implement createColumns
    throw UnimplementedError();
  }

  @override
  SheetCellMapping<dynamic, dynamic> createHeaders() {
    // TODO: implement createHeaders
    throw UnimplementedError();
  }

  @override
  XlsxRowReader createRowReader() {
    // TODO: implement createRowReader
    throw UnimplementedError();
  }

  @override
  XlsxRowWriter createRowWriter() {
    // TODO: implement createRowWriter
    throw UnimplementedError();
  }

  @override
  String createSheetName() {
    throw UnimplementedError();
  }

  @override
  XlsxCellStyler createStyler() {
    // TODO: implement createStyler
    throw UnimplementedError();
  }
}

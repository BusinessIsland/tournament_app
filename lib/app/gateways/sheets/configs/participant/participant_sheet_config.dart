import 'package:tournament_app/app/gateways/sheets/configs/participant/kyokushin/fields/participant_field.dart';
import 'package:tournament_app/app/gateways/sheets/parsers/cell_styler/xlsx_cell_styler.dart';
import 'package:tournament_app/app/gateways/sheets/parsers/xlsx_cell_value_extractor/xlsx_cell_value_extractor.dart';
import 'package:tournament_app/app/gateways/sheets/readers/xlsx_row_reader.dart';
import 'package:tournament_app/app/gateways/sheets/writers/xlsx_row_writer.dart';

class ParticipantSheetConfig {
  final String sheetName;
  final Map<ParticipantField, int> columns;
  final Map<ParticipantField, String> headers;
  final IXlsxCellStyler styler;
  final XlsxRowWriter writer;
  final XlsxRowReader reader;
  final IXlsxCellValueExtractor extractor;

  ParticipantSheetConfig({
    required this.sheetName,
    required this.columns,
    required this.headers,
    required this.styler,
    required this.writer,
    required this.reader,
    required this.extractor,
  });
}

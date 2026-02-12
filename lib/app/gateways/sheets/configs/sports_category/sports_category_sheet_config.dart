import 'package:tournament_app/app/gateways/sheets/cell_styler/xlsx_cell_styler.dart';
import 'package:tournament_app/app/gateways/sheets/cell_value_extractor/xlsx_cell_value_extractor.dart';
import 'package:tournament_app/app/gateways/sheets/readers/xlsx_row_reader.dart';
import 'package:tournament_app/app/gateways/sheets/writers/xlsx_row_writer.dart';

class SportsCategorySheetConfig {
  final String mainSheetName;
  final String weightSheetName;
  final Map<ParticipantField, int> mainColumns;
  final Map<ParticipantField, String> mainHeaders;
  final Map<ParticipantField, int> weightColumns;
  final Map<ParticipantField, String> weightHeaders;
  final XlsxCellStyler styler;
  final XlsxRowWriter writer;
  final XlsxRowReader reader;
  final XlsxCellValueExtractor extractor;

  SportsCategorySheetConfig({
    required this.mainSheetName,
    required this.weightSheetName,
    required this.mainColumns,
    required this.mainHeaders,
    required this.weightColumns,
    required this.weightHeaders,
    required this.styler,
    required this.writer,
    required this.reader,
    required this.extractor,
  });
}

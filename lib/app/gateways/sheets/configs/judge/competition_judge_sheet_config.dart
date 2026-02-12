import 'package:tournament_app/app/gateways/sheets/configs/judge/kyokushin/fields/competition_judge_field.dart';
import 'package:tournament_app/app/gateways/sheets/parsers/cell_styler/xlsx_cell_styler.dart';
import 'package:tournament_app/app/gateways/sheets/parsers/xlsx_cell_value_extractor/xlsx_cell_value_extractor.dart';
import 'package:tournament_app/app/gateways/sheets/readers/xlsx_row_reader.dart';
import 'package:tournament_app/app/gateways/sheets/writers/xlsx_row_writer.dart';

class CompetitionJudgeSheetConfig {
  final String sheetName;
  final Map<CompetitionJudgeField, int> columns;
  final Map<CompetitionJudgeField, String> headers;
  final IXlsxCellStyler styler;
  final XlsxRowWriter writer;
  final XlsxRowReader reader;
  final IXlsxCellValueExtractor extractor;

  const CompetitionJudgeSheetConfig({
    required this.sheetName,
    required this.columns,
    required this.headers,
    required this.styler,
    required this.writer,
    required this.reader,
    required this.extractor,
  });
}

import 'package:tournament_app/app/gateways/sheets/configs/judge/kyokushin/fields/competition_judge_field.dart';
import 'package:tournament_app/app/gateways/sheets/parsers/cell_styler/i_xlsx_cell_styler.dart';
import 'package:tournament_app/app/gateways/sheets/parsers/xlsx_cell_value_extractor/i_xlsx_cell_value_extractor.dart';
import 'package:tournament_app/app/gateways/sheets/readers/i_xlsx_row_reader.dart';
import 'package:tournament_app/app/gateways/sheets/writers/i_xlsx_row_writer.dart';

class CompetitionJudgeSheetConfig {
  final String sheetName;
  final Map<CompetitionJudgeField, int> columns;
  final Map<CompetitionJudgeField, String> headers;
  final IXlsxCellStyler styler;
  final IXlsxRowWriter writer;
  final IXlsxRowReader reader;
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

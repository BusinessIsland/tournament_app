import 'package:excel/excel.dart';
import 'package:tournament_app/app/gateways/sheets/cell_value_extractor/impl/xlsx_text_cell_value_extractor.dart';
import 'package:tournament_app/app/gateways/sheets/cell_value_extractor/xlsx_cell_value_extractor.dart';
import 'package:tournament_app/app/gateways/sheets/configs/judge/kyokushin/fields/competition_judge_field.dart';
import 'package:tournament_app/app/gateways/sheets/parsers/impl/xlsx_competition_judge_parser.dart';
import 'package:tournament_app/app/gateways/sheets/readers/xlsx_row_reader.dart';
import 'package:tournament_app/app/gateways/sheets/sheet_cell_mapping/sheet_cell_mapping.dart';
import 'package:tournament_app/app/models/competition_judge/competition_judge.dart';
import 'package:tournament_app/app/models/competition_judge/parser/competition_judge_parser.dart';

class XlsxCompetitionJudgeRowReader implements XlsxRowReader {
  final XlsxCellValueExtractor extractor;
  final Map<CompetitionJudgeField, int> columns;
  final CompetitionJudgeParser parser;

  const XlsxCompetitionJudgeRowReader({
    required this.extractor,
    required this.columns,
    required this.parser,
  });

  @override
  dynamic read(Sheet sheet, int rowIndex) {
    final extractedValues = _extractColumnsValues(sheet, rowIndex);
    return _parseColumnsValues(extractedValues);
  }

  Map<CompetitionJudgeField, String> _extractColumnsValues(Sheet sheet, int rowIndex) {
    final Map<CompetitionJudgeField, String> values = {};

    for (final entry in columns.entries) {
      final header = entry.key;
      final colIndex = entry.value;

      values[header] = extractor.extract(
        sheet: sheet,
        rowIndex: rowIndex,
        colIndex: colIndex,
      );
    }

    return values;
  }

  CompetitionJudge _parseColumnsValues(Map<CompetitionJudgeField, String> values) {
    return parser.parse(
      values[CompetitionJudgeField.name],
      values[CompetitionJudgeField.belt],
      values[CompetitionJudgeField.sportsQualification],
      values[CompetitionJudgeField.region],
    );
  }
}

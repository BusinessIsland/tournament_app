import 'package:excel/excel.dart';
import 'package:tournament_app/app/gateways/sheets/cell_styler/xlsx_cell_styler.dart';
import 'package:tournament_app/app/gateways/sheets/configs/judge/kyokushin/fields/competition_judge_field.dart';
import 'package:tournament_app/app/gateways/sheets/writers/xlsx_row_writer.dart';
import 'package:tournament_app/app/models/competition_judge/competition_judge.dart';

class XlsxCompetitionJudgeRowWriter implements XlsxRowWriter {
  final Map<CompetitionJudgeField, String> headers;
  final Map<CompetitionJudgeField, int> columns;
  final XlsxCellStyler styler;

  const XlsxCompetitionJudgeRowWriter({
    required this.headers,
    required this.columns,
    required this.styler,
  });

  @override
  void writeHeaders(Sheet sheet) {
    for (final entry in headers.entries) {
      final key = entry.key;
      final value = entry.value;

      final cellIndex = CellIndex.indexByColumnRow(
        columnIndex: columns[key]!,
        rowIndex: 0,
      );
      final cell = sheet.cell(cellIndex);

      cell.value = TextCellValue(value);
      cell.cellStyle = styler.createHeaderCellStyle();
    }
  }

  @override
  void writeData(Sheet sheet, value, int rowIndex) {
    CompetitionJudge judge = value;

    void createCell(dynamic value, CompetitionJudgeField field) {
      final columnIndex = columns[field];
      if (columnIndex == null) return;

      final cellIndex = CellIndex.indexByColumnRow(
        columnIndex: columnIndex,
        rowIndex: rowIndex,
      );
      final cell = sheet.cell(cellIndex);

      cell.value = TextCellValue(value.toString());
      cell.cellStyle = styler.createRowCellStyle(bold: false);
    }

    createCell(rowIndex, CompetitionJudgeField.number);
    createCell(judge.name.formatted, CompetitionJudgeField.name);
    createCell(judge.belt.toString(), CompetitionJudgeField.belt);
    createCell(judge.sportsQualification.label, CompetitionJudgeField.sportsQualification);
    createCell(judge.region.label, CompetitionJudgeField.region);
  }
}

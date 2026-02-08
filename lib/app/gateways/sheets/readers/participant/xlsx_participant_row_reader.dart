import 'package:excel/excel.dart';
import 'package:tournament_app/app/gateways/sheets/parsers/xlsx_cell_value_extractor/i_xlsx_cell_value_extractor.dart';
import 'package:tournament_app/app/gateways/sheets/readers/i_xlsx_row_reader.dart';
import 'package:tournament_app/app/models/participant/parser/participant_parser.dart';
import 'package:tournament_app/app/models/participant/participant.dart';

class XlsxParticipantRowReader implements IXlsxRowReader {
  final IXlsxCellValueExtractor extractor;
  final Map<String, int> columns;
  final ParticipantParser parser;

  const XlsxParticipantRowReader({required this.extractor, required this.columns, required this.parser});

  @override
  dynamic read(Sheet sheet, int rowIndex) {
    final extractedValues = _extractColumnsValues(sheet, rowIndex);
    return _parseColumnsValues(extractedValues);
  }

  Map<String, String> _extractColumnsValues(Sheet sheet, int rowIndex) {
    final Map<String, String> values = {};

    for (final entry in columns.entries) {
      values[entry.key] = extractor.extract(
        sheet: sheet,
        rowIndex: rowIndex,
        colIndex: entry.value,
      );
    }

    return values;
  }

  Participant _parseColumnsValues(Map<String, String> values) {
    return parser.parse(
      values["Пол"],
      values["ФИО"],
      values["Дата рождения"],
      values["Кю, дан"],
      values["Разряд"],
      values["Вес"],
      values["Регион"],
      values["Тренер(ы)"],
      values["Блок"],
    );
  }
}

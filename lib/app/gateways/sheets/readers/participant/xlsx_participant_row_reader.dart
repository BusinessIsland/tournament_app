import 'package:excel/excel.dart';
import 'package:tournament_app/app/gateways/sheets/configs/participant/karate/fields/participant_field.dart';
import 'package:tournament_app/app/gateways/sheets/parsers/xlsx_cell_value_extractor/i_xlsx_cell_value_extractor.dart';
import 'package:tournament_app/app/gateways/sheets/readers/i_xlsx_row_reader.dart';
import 'package:tournament_app/app/models/participant/parser/participant_parser.dart';
import 'package:tournament_app/app/models/participant/participant.dart';

class XlsxParticipantRowReader implements IXlsxRowReader {
  final IXlsxCellValueExtractor extractor;
  final Map<ParticipantField, int> columns;
  final ParticipantParser parser;

  const XlsxParticipantRowReader({required this.extractor, required this.columns, required this.parser});

  @override
  dynamic read(Sheet sheet, int rowIndex) {
    final extractedValues = _extractColumnsValues(sheet, rowIndex);
    return _parseColumnsValues(extractedValues);
  }

  Map<ParticipantField, String> _extractColumnsValues(Sheet sheet, int rowIndex) {
    final Map<ParticipantField, String> values = {};

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

  Participant _parseColumnsValues(Map<ParticipantField, String> values) {
    return parser.parse(
      values[ParticipantField.gender],
      values[ParticipantField.name],
      values[ParticipantField.dateOfBirth],
      values[ParticipantField.belt],
      values[ParticipantField.sportsQualification],
      values[ParticipantField.weight],
      values[ParticipantField.region],
      values[ParticipantField.trainers],
      values[ParticipantField.block],
    );
  }
}

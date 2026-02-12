import 'package:excel/excel.dart';
import 'package:tournament_app/app/gateways/sheets/cell_styler/xlsx_cell_styler.dart';
import 'package:tournament_app/app/gateways/sheets/configs/participant/kyokushin/fields/participant_field.dart';
import 'package:tournament_app/app/gateways/sheets/sheet_cell_mapping/sheet_cell_mapping.dart';
import 'package:tournament_app/app/gateways/sheets/writers/xlsx_row_writer.dart';
import 'package:tournament_app/app/models/participant/participant.dart';

class XlsxParticipantRowWriter implements XlsxRowWriter {
  final SheetCellMapping<ParticipantField, String> headers;
  final SheetCellMapping<ParticipantField, int> columns;
  final XlsxCellStyler styler;

  const XlsxParticipantRowWriter({
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
        columnIndex: columns.get(key)!,
        rowIndex: 0,
      );
      final cell = sheet.cell(cellIndex);

      cell.value = TextCellValue(value);
      cell.cellStyle = styler.createHeaderCellStyle();
    }
  }

  @override
  void writeData(Sheet sheet, value, int rowIndex) {
    Participant participant = value;

    void createCell(dynamic value, ParticipantField field) {
      final columnIndex = columns.get(field);
      if (columnIndex == null) return;

      final cellIndex = CellIndex.indexByColumnRow(
        columnIndex: columnIndex,
        rowIndex: rowIndex,
      );
      final cell = sheet.cell(cellIndex);

      cell.value = TextCellValue(value.toString());
      cell.cellStyle = styler.createRowCellStyle(bold: false);
    }

    createCell(rowIndex, ParticipantField.number);
    createCell(participant.gender.shortLabel, ParticipantField.gender);
    createCell(participant.name.formatted, ParticipantField.name);
    createCell(participant.dateOfBirth, ParticipantField.dateOfBirth);
    createCell(participant.belt.toString(), ParticipantField.belt);
    createCell(
      participant.sportsQualification.label,
      ParticipantField.sportsQualification,
    );
    createCell(participant.weight, ParticipantField.weight);
    createCell(participant.region.value, ParticipantField.region);
    createCell(participant.trainers, ParticipantField.trainers);
    createCell(participant.block.label, ParticipantField.block);
    createCell(participant.dateOfBirth.age, ParticipantField.ageFull);
  }
}

import 'package:excel/excel.dart';
import 'package:tournament_app/app/gateways/sheets/parsers/cell_styler/i_xlsx_cell_styler.dart';
import 'package:tournament_app/app/gateways/sheets/writers/i_xlsx_row_writer.dart';
import 'package:tournament_app/app/models/participant/participant.dart';

class XlsxParticipantRowWriter implements IXlsxRowWriter {
  final Map<String, int> columns;
  final IXlsxCellStyler styler;

  XlsxParticipantRowWriter({required this.columns, required this.styler});

  @override
  void writeHeaders(Sheet sheet) {
    int columnIndex = 0;

    for (final header in columns.keys.toList()) {
      final cellIndex = CellIndex.indexByColumnRow(
        columnIndex: columnIndex,
        rowIndex: 0,
      );
      final cell = sheet.cell(cellIndex);

      cell.value = TextCellValue(header);
      cell.cellStyle = styler.createHeaderCellStyle();
    }
  }

  @override
  void writeData(Sheet sheet, value, int rowIndex) {
    Participant participant = value;

    void createCell(dynamic value, int columnIndex) {
      final cellIndex = CellIndex.indexByColumnRow(
        columnIndex: columnIndex,
        rowIndex: rowIndex,
      );
      final cell = sheet.cell(cellIndex);

      cell.value = TextCellValue(value.toString());
      cell.cellStyle = styler.createRowCellStyle(bold: false);
    }

    createCell(rowIndex, 0);
    createCell(participant.gender.label, 1);
    createCell(participant.name.formatted, 2);
    createCell(participant.dateOfBirth, 3);
    createCell(participant.belt.label, 4);
    createCell(participant.sportsQualification.label, 5);
    createCell(participant.weight, 6);
    createCell(participant.region.value, 7);
    createCell(participant.trainers, 8);
    createCell(participant.block.label, 9);
    createCell(participant.dateOfBirth.age, 10);
  }
}

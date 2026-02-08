import 'package:excel/excel.dart';
import 'package:tournament_app/app/exceptions/sheet_not_found_exception.dart';
import 'package:tournament_app/app/gateways/sheets/parsers/cell_styler/i_xlsx_cell_styler.dart';
import 'package:tournament_app/app/gateways/sheets/parsers/cell_styler/xlsx_participant_cell_styler.dart';
import 'package:tournament_app/app/gateways/sheets/parsers/i_xlsx_parser.dart';
import 'package:tournament_app/app/gateways/sheets/parsers/xlsx_cell_value_extractor/xlsx_text_cell_value_extractor.dart';
import 'package:tournament_app/app/gateways/sheets/readers/participant/xlsx_participant_row_reader.dart';
import 'package:tournament_app/app/gateways/sheets/sheet_columns/participant_sheet_columns.dart';
import 'package:tournament_app/app/gateways/sheets/writers/participant/xlsx_participant_row_writer.dart';
import 'package:tournament_app/app/models/participant/parser/factory/participant_parser_factory.dart';
import 'package:tournament_app/app/models/participant/participant_list.dart';
import 'package:tournament_app/app/models/participant/parser/participant_parser.dart';

class XlsxParticipantParser extends IXlsxParser {
  final String sheetName;

  final Map<String, int> columns = ParticipantSheetColumns.main;
  final ParticipantParser parser = ParticipantParserFactory().createDefaultParser();
  final IXlsxCellStyler styler = XlsxParticipantCellStyler();

  XlsxParticipantParser({required this.sheetName});

  @override
  dynamic concreteXlsxParse(Excel excel) {
    final rowReader = XlsxParticipantRowReader(
      extractor: XlsxTextCellValueExtractor(),
      columns: columns,
      parser: parser,
    );

    final list = ParticipantListBasicImpl();
    final sheet = excel.tables[sheetName];

    if (sheet == null) throw SheetNotFoundException(sheetName);

    for (int i = 1; i < sheet.maxRows; i++) {
      final participant = rowReader.read(sheet, i);
      list.add(participant);
    }

    return list;
  }

  @override
  Excel concreteSave(data) {
    ParticipantListBasicImpl list = data;
    final writer = XlsxParticipantRowWriter(columns: columns, styler: styler);

    final excel = Excel.createExcel();
    final sheet = excel[sheetName];

    writer.writeHeaders(sheet);

    int rowIndex = 1;
    for (final participant in list) {
      writer.writeData(sheet, participant, rowIndex);
      rowIndex++;
    }

    return excel;
  }
}

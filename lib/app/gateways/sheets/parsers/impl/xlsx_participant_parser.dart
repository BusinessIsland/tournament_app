import 'package:excel/excel.dart';
import 'package:tournament_app/app/exceptions/sheet_not_found_exception.dart';
import 'package:tournament_app/app/gateways/sheets/configs/participant/participant_sheet_config.dart';
import 'package:tournament_app/app/gateways/sheets/parsers/xlsx_parser.dart';
import 'package:tournament_app/app/models/participant/participant_list.dart';
import 'package:tournament_app/app/models/parts/name/person_name.dart';

class XlsxParticipantParser extends XlsxParser {
  final ParticipantSheetConfig config;

  const XlsxParticipantParser({required this.config});

  @override
  dynamic concreteXlsxParse(Excel excel) {
    final list = ParticipantListBasicImpl();
    final sheet = excel.tables[config.sheetName];

    if (sheet == null) throw SheetNotFoundException(config.sheetName);

    for (int i = 1; i < sheet.maxRows; i++) {
      final participant = config.reader.read(sheet, i);
      if (participant.name is! UndefinedName) list.add(participant);
    }

    return list;
  }

  @override
  Excel concreteSave(data) {
    ParticipantListBasicImpl list = data;
    final excel = Excel.createExcel();
    final sheet = excel[config.sheetName];
    excel.delete("Sheet1");

    config.writer.writeHeaders(sheet);

    int rowIndex = 1;
    for (final participant in list) {
      config.writer.writeData(sheet, participant, rowIndex);
      rowIndex++;
    }

    return excel;
  }
}

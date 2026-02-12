import 'package:excel/excel.dart';
import 'package:tournament_app/app/exceptions/sheet_not_found_exception.dart';
import 'package:tournament_app/app/gateways/sheets/configs/judge/competition_judge_sheet_config.dart';
import 'package:tournament_app/app/gateways/sheets/parsers/xlsx_parser.dart';
import 'package:tournament_app/app/models/competition_judge/competition_judge_list.dart';
import 'package:tournament_app/app/models/parts/name/person_name.dart';

class XlsxCompetitionJudgeParser extends XlsxParser {
  final CompetitionJudgeSheetConfig config;

  const XlsxCompetitionJudgeParser({required this.config});

  @override
  dynamic concreteXlsxParse(Excel excel) {
    final list = CompetitionJudgeListBasicImpl();
    final sheet = excel.tables[config.sheetName];

    if (sheet == null) throw SheetNotFoundException(config.sheetName);

    for (int i = 1; i < sheet.maxRows; i++) {
      final judge = config.reader.read(sheet, i);
      if (judge.name is! UndefinedName) list.add(judge);
    }

    return list;
  }

  @override
  Excel concreteSave(data) {
    CompetitionJudgeListBasicImpl list = data;
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

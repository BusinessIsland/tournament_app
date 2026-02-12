import 'package:tournament_app/app/gateways/sheets/cell_styler/impl/xlsx_participant_cell_styler.dart';
import 'package:tournament_app/app/gateways/sheets/cell_value_extractor/impl/xlsx_text_cell_value_extractor.dart';
import 'package:tournament_app/app/gateways/sheets/configs/judge/competition_judge_sheet_config.dart';
import 'package:tournament_app/app/gateways/sheets/configs/judge/kyokushin/columns/competition_judge_karate_sheet_columns.dart';
import 'package:tournament_app/app/gateways/sheets/configs/judge/kyokushin/headers/competition_judge_karate_sheet_headers.dart';
import 'package:tournament_app/app/gateways/sheets/readers/impl/xlsx_competition_judge_row_reader.dart';
import 'package:tournament_app/app/gateways/sheets/writers/impl/xlsx_competition_judge_row_writer.dart';
import 'package:tournament_app/app/models/competition_judge/parser/factory/competition_judge_parser_factory.dart';

class CompetitionJudgeSheetKarateConfigFabric {
  static CompetitionJudgeSheetConfig createStandardConfig() {
    final parser = CompetitionJudgeParserFactory.createDefaultParser();

    final sheetName = "Судьи";
    final columns = CompetitionJudgeKarateSheetColumns.standardJudge;
    final headers = CompetitionJudgeKarateSheetHeaders.standardJudge;
    final styler = XlsxParticipantCellStyler();
    final extractor = XlsxTextCellValueExtractor();
    final writer = XlsxCompetitionJudgeRowWriter(
      columns: columns,
      styler: styler,
      headers: headers,
    );

    final reader = XlsxCompetitionJudgeRowReader(
      extractor: extractor,
      columns: columns,
      parser: parser,
    );

    return CompetitionJudgeSheetConfig(
      sheetName: sheetName,
      columns: columns,
      headers: headers,
      styler: styler,
      writer: writer,
      reader: reader,
      extractor: extractor,
    );
  }
}

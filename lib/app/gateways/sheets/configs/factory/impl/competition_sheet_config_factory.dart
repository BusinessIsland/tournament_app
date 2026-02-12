import 'package:tournament_app/app/gateways/sheets/cell_styler/impl/xlsx_competition_judge_cell_styler.dart';
import 'package:tournament_app/app/gateways/sheets/cell_styler/xlsx_cell_styler.dart';
import 'package:tournament_app/app/gateways/sheets/cell_value_extractor/impl/xlsx_text_cell_value_extractor.dart';
import 'package:tournament_app/app/gateways/sheets/cell_value_extractor/xlsx_cell_value_extractor.dart';
import 'package:tournament_app/app/gateways/sheets/configs/factory/sheet_config_factory.dart';
import 'package:tournament_app/app/gateways/sheets/configs/judge/kyokushin/fields/competition_judge_field.dart';
import 'package:tournament_app/app/gateways/sheets/readers/impl/xlsx_competition_judge_row_reader.dart';
import 'package:tournament_app/app/gateways/sheets/readers/xlsx_row_reader.dart';
import 'package:tournament_app/app/gateways/sheets/sheet_cell_mapping/impl/sheet_cell_mapping_map_impl.dart';
import 'package:tournament_app/app/gateways/sheets/sheet_cell_mapping/sheet_cell_mapping.dart';
import 'package:tournament_app/app/gateways/sheets/writers/impl/xlsx_competition_judge_row_writer.dart';
import 'package:tournament_app/app/gateways/sheets/writers/xlsx_row_writer.dart';
import 'package:tournament_app/app/models/competition_judge/parser/factory/competition_judge_parser_factory.dart';

class CompetitionSheetConfigFactory implements SheetConfigFactory {
  @override
  XlsxCellValueExtractor createCellValueExtractor() {
    return XlsxTextCellValueExtractor();
  }

  @override
  SheetCellMapping<dynamic, dynamic> createColumns() {
    return _columns;
  }

  @override
  SheetCellMapping<dynamic, dynamic> createHeaders() {
    return _headers;
  }

  @override
  XlsxRowReader createRowReader() {
    return XlsxCompetitionJudgeRowReader(
      extractor: _extractor,
      columns: _columns,
      parser: CompetitionJudgeParserFactory.createDefaultParser(),
    );
  }

  @override
  XlsxRowWriter createRowWriter() {
    return XlsxCompetitionJudgeRowWriter(
      headers: _headers,
      columns: _columns,
      styler: _styler,
    );
  }

  @override
  String createSheetName() {
    return "Судьи";
  }

  @override
  XlsxCellStyler createStyler() {
    return _styler;
  }

  SheetCellMapping<CompetitionJudgeField, int> get _columns {
    final mapping = SheetCellMappingMapImpl<CompetitionJudgeField, int>();

    mapping.set(CompetitionJudgeField.number, 0);
    mapping.set(CompetitionJudgeField.name, 1);
    mapping.set(CompetitionJudgeField.belt, 2);
    mapping.set(CompetitionJudgeField.sportsQualification, 3);
    mapping.set(CompetitionJudgeField.region, 4);

    return mapping;
  }

  SheetCellMapping<CompetitionJudgeField, String> get _headers {
    final mapping = SheetCellMappingMapImpl<CompetitionJudgeField, String>();

    mapping.set(CompetitionJudgeField.number, "№ п/п");
    mapping.set(CompetitionJudgeField.name, "ФИО");
    mapping.set(CompetitionJudgeField.belt, "Кю, дан");
    mapping.set(
      CompetitionJudgeField.sportsQualification,
      "Судейская категория",
    );
    mapping.set(CompetitionJudgeField.region, "Регион");

    return mapping;
  }

  XlsxCellStyler get _styler {
    return XlsxCompetitionJudgeCellStyler();
  }

  XlsxCellValueExtractor get _extractor {
  return XlsxTextCellValueExtractor();
}
}

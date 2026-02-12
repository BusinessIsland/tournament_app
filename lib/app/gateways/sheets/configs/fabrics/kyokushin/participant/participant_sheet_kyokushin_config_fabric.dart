import 'package:tournament_app/app/gateways/sheets/cell_styler/impl/xlsx_participant_cell_styler.dart';
import 'package:tournament_app/app/gateways/sheets/cell_value_extractor/impl/xlsx_text_cell_value_extractor.dart';
import 'package:tournament_app/app/gateways/sheets/configs/participant/kyokushin/columns/participant_kyokushin_sheet_columns.dart';
import 'package:tournament_app/app/gateways/sheets/configs/participant/kyokushin/headers/participant_kyokushin_sheet_headers.dart';
import 'package:tournament_app/app/gateways/sheets/configs/participant/participant_sheet_config.dart';
import 'package:tournament_app/app/gateways/sheets/readers/impl/xlsx_participant_row_reader.dart';
import 'package:tournament_app/app/gateways/sheets/writers/impl/xlsx_participant_row_writer.dart';
import 'package:tournament_app/app/models/participant/parser/factory/participant_parser_factory.dart';

class ParticipantSheetKyokushinConfigFabric {
  static ParticipantSheetConfig createStandardChampionshipConfig() {
    final parser = ParticipantParserFactory.createDefaultParser();

    final sheetName = "Чемпионат";
    final columns = ParticipantKyokushinSheetColumns.standardChampionship;
    final headers = ParticipantKyokushinSheetHeaders.standardChampionship;
    final styler = XlsxParticipantCellStyler();
    final extractor = XlsxTextCellValueExtractor();
    final writer = XlsxParticipantRowWriter(
      columns: columns,
      styler: styler,
      headers: headers,
    );
    final reader = XlsxParticipantRowReader(
      extractor: extractor,
      columns: columns,
      parser: parser,
    );

    return ParticipantSheetConfig(
      sheetName: sheetName,
      columns: columns,
      headers: headers,
      styler: styler,
      writer: writer,
      reader: reader,
      extractor: extractor,
    );
  }

  static ParticipantSheetConfig createPrimacyChampionshipConfig() {
    final parser = ParticipantParserFactory.createDefaultParser();

    final sheetName = "Первенство";
    final columns = ParticipantKyokushinSheetColumns.primacyChampionship;
    final headers = ParticipantKyokushinSheetHeaders.primacyChampionship;
    final styler = XlsxParticipantCellStyler();
    final extractor = XlsxTextCellValueExtractor();
    final writer = XlsxParticipantRowWriter(
      columns: columns,
      styler: styler,
      headers: headers,
    );
    final reader = XlsxParticipantRowReader(
      extractor: extractor,
      columns: columns,
      parser: parser,
    );

    return ParticipantSheetConfig(
      sheetName: sheetName,
      columns: columns,
      headers: headers,
      styler: styler,
      writer: writer,
      reader: reader,
      extractor: extractor,
    );
  }

  static ParticipantSheetConfig createMassSportsEventConfig() {
    final parser = ParticipantParserFactory.createDefaultParser();

    final sheetName = "Спортивно-массовые мероприятия";
    final columns = ParticipantKyokushinSheetColumns.massSportsEvent;
    final headers = ParticipantKyokushinSheetHeaders.massSportsEvent;
    final styler = XlsxParticipantCellStyler();
    final extractor = XlsxTextCellValueExtractor();
    final writer = XlsxParticipantRowWriter(
      columns: columns,
      styler: styler,
      headers: headers,
    );
    final reader = XlsxParticipantRowReader(
      extractor: extractor,
      columns: columns,
      parser: parser,
    );

    return ParticipantSheetConfig(
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

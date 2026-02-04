import 'package:excel/excel.dart';
import 'package:tournament_app/app/gateways/sheets/dto/participant_sheet_dto.dart';

abstract class ParticipantMapper {
  ParticipantSheetDto mapRowToDto(
    Excel excel,
    int rowIndex,
  );

  String? getValue(Sheet sheet, int colIndex, int rowIndex) {
    return sheet
        .cell(
          CellIndex.indexByColumnRow(columnIndex: colIndex, rowIndex: rowIndex),
        )
        .value
        ?.toString();
  }
}

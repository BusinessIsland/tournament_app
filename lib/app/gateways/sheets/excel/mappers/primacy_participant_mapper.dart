import 'package:excel/excel.dart';
import 'package:tournament_app/app/gateways/sheets/dto/participant_sheet_dto.dart';
import 'package:tournament_app/app/gateways/sheets/excel/mappers/participant_mapper.dart';

class PrimacyParticipantMapper extends ParticipantMapper {
  final String mainSheetName = "Первенство ДФО";
  final String appSheetName = "Служебное Первенство ДФО";

  // номера столбцов для листа "Первенство ДФО"
  final int mainColRowId = 0;
  final int mainColGender = 1;
  final int mainColFullname = 2;
  final int mainColDateOfBirth = 3;
  final int mainColBelt = 4;
  final int mainColSportsTitle = 5;
  final int mainColWeight = 6;
  final int mainColRegion = 7;
  final int mainColTrainers = 8;
  final int mainColBlock = 9;
  final int mainColAge = 10;
  final int mainColCurrentDate = 11;

  // номера столбцов для листа "Служебное"
  final int appColRowId = 0;
  final int appColId = 1;

  @override
  ParticipantSheetDto mapRowToDto(Excel excel, int rowIndex) {
    Sheet mainSheet = excel[mainSheetName];
    Sheet appSheet = excel[appSheetName];

    return ParticipantSheetDto.withValidation(
      rawId: getValue(appSheet, appColId, rowIndex),
      rawRowId: getValue(mainSheet, mainColRowId, rowIndex),
      rawGender: getValue(mainSheet, mainColGender, rowIndex),
      rawFullname: getValue(mainSheet, mainColFullname, rowIndex),
      rawDateOfBirth: getValue(mainSheet, mainColDateOfBirth, rowIndex),
      rawBelt: getValue(mainSheet, mainColBelt, rowIndex),
      rawSportsTitle: getValue(mainSheet, mainColSportsTitle, rowIndex),
      rawWeight: getValue(mainSheet, mainColWeight, rowIndex),
      rawRegion: getValue(mainSheet, mainColRegion, rowIndex),
      rawTrainers: getValue(mainSheet, mainColTrainers, rowIndex),
      rawBlock: getValue(mainSheet, mainColBlock, rowIndex),
    );
  }
}
import 'package:excel/excel.dart';
import 'package:tournament_app/app/gateways/sheets/dto/participant_sheet_dto.dart';

abstract class ParticipantSheetParser {
  List<ParticipantSheetDto> readAll(Excel excel);
  ParticipantSheetDto create(Excel src, Excel dest, ParticipantSheetDto dto);
}
import 'package:excel/excel.dart';
import 'package:tournament_app/app/gateways/sheets/dto/participant_sheet_dto.dart';

abstract class ParticipantSheetParser {
  List<ParticipantSheetDto> readAll(Excel excel);
  ParticipantSheetDto getById(Excel excel, String id);
  ParticipantSheetDto create(Excel src, Excel dest, ParticipantSheetDto dto);
  ParticipantSheetDto update(Excel src, Excel dest, String id, ParticipantSheetDto dto);
  void delete(Excel src, Excel dest, List<String> ids);
}
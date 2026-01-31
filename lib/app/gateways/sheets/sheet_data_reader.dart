import 'package:excel/excel.dart';
import 'package:tournament_app/app/dto/participant_input_dto.dart';

abstract class SheetDataReader<T> {
  List<T> readAll(Excel excel);
  T save(Excel excel, ParticipantInputDto dto);
}
import 'package:tournament_app/app/dto/participant_input_dto.dart';
import 'package:tournament_app/app/gateways/excel/readers/application_far_eastern_reader.dart';
import 'package:tournament_app/app/gateways/repositories/participant/participant_sheet_repository.dart';
import 'package:tournament_app/app/gateways/sheets/sheet_data_reader.dart';
import 'package:tournament_app/app/usecases/participant_usecase.dart';

void main() {

  SheetDataReader<ParticipantInputDto> reader = ApplicationFarEasternReader();
  final repo = ParticipantSheetRepository("/Users/kenedy/Downloads/data-3.xlsx", reader);
  final uc = ParticipantUsecase(repo);


}
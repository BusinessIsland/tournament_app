import 'package:tournament_app/app/gateways/sheets/participant_sheet_repository.dart';
import 'package:tournament_app/app/gateways/sheets/excel/readers/application_far_eastern_reader.dart';
import 'package:tournament_app/app/gateways/sheets/participant_sheet_parser.dart';
import 'package:tournament_app/app/usecases/participant_use_case.dart';

void main() {
  ParticipantSheetParser reader = ApplicationFarEasternReader();
  final repo = ParticipantSheetRepository(
    "/Users/kenedy/Downloads/data-2.xlsx",
    reader,
  );
  final uc = ParticipantUseCase(repo);
  final data = uc.readAll();
  
  for (final d in data) {
    print(d.toString());
  }
}

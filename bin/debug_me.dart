import 'package:tournament_app/app/dto/participant_input_dto.dart';
import 'package:tournament_app/app/gateways/excel/readers/application_far_eastern_reader.dart';
import 'package:tournament_app/app/gateways/repositories/participant/participant_sheet_repository.dart';
import 'package:tournament_app/app/gateways/sheets/sheet_data_reader.dart';
import 'package:tournament_app/app/models/participant/participant.dart';
import 'package:tournament_app/app/models/participant/utils/belt.dart';
import 'package:tournament_app/app/models/participant/utils/belt_type.dart';
import 'package:tournament_app/app/models/participant/utils/gender.dart';
import 'package:tournament_app/app/models/participant/utils/sports_title.dart';
import 'package:tournament_app/app/models/trainer/trainer.dart';
import 'package:tournament_app/app/usecases/participant_usecase.dart';

void main() {
  SheetDataReader<ParticipantInputDto> reader = ApplicationFarEasternReader();
  final repo = ParticipantSheetRepository(
    "/Users/kenedy/Downloads/data-3.xlsx",
    reader,
  );
  final uc = ParticipantUsecase(repo);

  final participant = ParticipantInputDto(
    "м",
    "Журавлев Данил Владимирович",
    DateTime.utc(2020, 2, 10),
    "10 кю",
    "КМС",
    50.5,
    "Хабаровский край",
    ["Мисяченко Я.М."],
    "А",
    12,
  );
  uc.save(participant);
}

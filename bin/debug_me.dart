import 'package:tournament_app/app/dto/participant_create_dto.dart';
import 'package:tournament_app/app/dto/participant_get_all_filter.dart';
import 'package:tournament_app/app/dto/participant_update_dto.dart';
import 'package:tournament_app/app/gateways/sheets/participant_sheet_repository.dart';
import 'package:tournament_app/app/gateways/sheets/excel/readers/application_far_eastern_reader.dart';
import 'package:tournament_app/app/gateways/sheets/participant_sheet_parser.dart';
import 'package:tournament_app/app/usecases/participant_use_case.dart';

void main() {
  // readAll();
  // create();
  // update("9d063aa2-89ff-4fb0-8b14-5539e0b4b2c9");
  // delete([]);
}

void readAll() {
  ParticipantSheetParser reader = ApplicationFarEasternReader();
  final repo = ParticipantSheetRepository(
    "/home/kenedy/Downloads/data-2.xlsx",
    reader,
  );
  final uc = ParticipantUseCase(repo);
  final filter = ParticipantGetAllFilter.withRegionAndTrainerName("Хабаровский край", "Драчинский А.С.");
  final data = uc.readAll(filter);

  for (final d in data) {
    print(d.toString());
  }
}

void create() {
  final dto = ParticipantCreateDto.fromInput(
    "м",
    "Журавлев Данил Владимирович",
    "23.03.2004",
    "10 кю",
    "КМС",
    "50.5",
    "Хабаровский край",
    "Мисяченко Я.М., Шифу М.А.",
    "А",
  );

  ParticipantSheetParser reader = ApplicationFarEasternReader();
  final repo = ParticipantSheetRepository(
    "/home/kenedy/Downloads/data-2.xlsx",
    reader,
  );
  final uc = ParticipantUseCase(repo);
  final data = uc.create(dto);

  print(data);
}

void update(String id) {
  final dto = ParticipantUpdateDto.fromInput(
    id,
    "м",
    "Журавлев Данил Владимирович",
    "23.03.2004",
    "10 кю",
    "КМС",
    "50.5",
    "Хабаровский край",
    "Мисяченко Я.М., Шифу М.А.",
    "А",
  );

  ParticipantSheetParser reader = ApplicationFarEasternReader();
  final repo = ParticipantSheetRepository(
    "/home/kenedy/Downloads/data-2.xlsx",
    reader,
  );
  final uc = ParticipantUseCase(repo);
  final data = uc.update(id, dto);

  print(data);
}

void delete(List<String> ids) {
  ParticipantSheetParser reader = ApplicationFarEasternReader();
  final repo = ParticipantSheetRepository(
    "/home/kenedy/Downloads/data-2.xlsx",
    reader,
  );
  final uc = ParticipantUseCase(repo);
  uc.delete(ids);

  print("successfully delete rows");
}

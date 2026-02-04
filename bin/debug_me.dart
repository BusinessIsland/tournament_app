import 'package:tournament_app/app/dto/participant_create_dto.dart';
import 'package:tournament_app/app/dto/participant_get_all_filter.dart';
import 'package:tournament_app/app/dto/participant_update_dto.dart';
import 'package:tournament_app/app/gateways/sheets/participant_sheet_repository.dart';
import 'package:tournament_app/app/gateways/sheets/excel/readers/application_far_eastern_reader.dart';
import 'package:tournament_app/app/gateways/sheets/participant_sheet_parser.dart';
import 'package:tournament_app/app/usecases/participant_use_case.dart';

void main() {
  readAll();
  // create();
  // update("9d063aa2-89ff-4fb0-8b14-5539e0b4b2c9");
  // delete([]);
}

void readAll() {
  ParticipantSheetParser reader = ApplicationFarEasternReader();
  final repo = ParticipantSheetRepository(
    "/Users/kenedy/Downloads/data-2.xlsx",
    reader,
  );
  final uc = ParticipantUseCase(repo);
  // final filter = ParticipantGetAllFilter(
  //   region: "Хабаровский край",
  //   trainerName: "Драчинский А.С.",
  // );
  // final data = uc.readAll(filter);

  // final data = uc.readAll(ParticipantGetAllFilter(null, null));

    final data = uc.readAll(ParticipantGetAllFilter(
      region: "Республика Саха (Якутия)",
      trainerName: null
    ));

  print("read all data");

  for (final d in data) {
    print(d.toString());
  }
}

void create() {
  final dto = ParticipantCreateDto.fromInput(
    rawGender: "м",
    rawName: "Журавлев Данил Владимирович",
    rawDateOfBirth: "23.03.2004",
    rawBelt: "10 кю",
    rawSportsTitle: "КМС",
    rawWeight: "50.5",
    rawRegion: "Хабаровский край",
    rawTrainers: "Мисяченко Я.М., Шифу М.А.",
    rawBlock: "А",
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
    rawId: id,
    rawGender: "м",
    rawName: "Журавлев Данил Владимирович",
    rawDateOfBirth: "23.03.2004",
    rawBelt: "10 кю",
    rawSportsTitle: "КМС",
    rawWeight: "50.5",
    rawRegion: "Хабаровский край",
    rawTrainers: "Мисяченко Я.М., Шифу М.А.",
    rawBlock: "А",
  );

  ParticipantSheetParser reader = ApplicationFarEasternReader();
  final repo = ParticipantSheetRepository(
    "/home/kenedy/Downloads/data-2.xlsx",
    reader,
  );
  final uc = ParticipantUseCase(repo);
  final data = uc.update(dto);

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

import 'package:tournament_app/app/dto/participant/participant_get_all_filter.dart';
import 'package:tournament_app/app/gateways/repositories/competition_judge/i_competition_judge_repository.dart';
import 'package:tournament_app/app/gateways/repositories/competition_judge/xlsx/xlsx_competition_judge_repository.dart';
import 'package:tournament_app/app/gateways/repositories/participant/i_participant_repository.dart';
import 'package:tournament_app/app/gateways/repositories/participant/xlsx/xlsx_participant_repository.dart';
import 'package:tournament_app/app/gateways/repositories/persistence/i_file_persistable.dart';
import 'package:tournament_app/app/gateways/sheets/configs/fabrics/kyokushin/competition_judge/competition_judge_sheet_karate_config_fabric.dart';
import 'package:tournament_app/app/gateways/sheets/configs/fabrics/kyokushin/participant/participant_sheet_karate_config_fabric.dart';
import 'package:tournament_app/app/gateways/sheets/parsers/xlsx_parsers/competition_judge/xlsx_competition_judge_parser.dart';
import 'package:tournament_app/app/gateways/sheets/parsers/xlsx_parsers/participant/xlsx_participant_parser.dart';
import 'package:tournament_app/app/models/competition_judge/parser/factory/competition_judge_parser_factory.dart';
import 'package:tournament_app/app/models/participant/parser/factory/participant_parser_factory.dart';
import 'package:tournament_app/app/usecases/competition_judge/competition_judge_use_case.dart';
import 'package:tournament_app/app/usecases/participant/participant_use_case.dart';

void main() {
  // readAll();
  // create();
  // update("9d063aa2-89ff-4fb0-8b14-5539e0b4b2c9");
  // delete([]);
  // save();
  readAllJudges();
}

void readAllJudges() {
  final participantSheetParser = XlsxCompetitionJudgeParser(
    config: CompetitionJudgeSheetKarateConfigFabric.createStandardConfig(),
  );

  ICompetitionJudgeRepository judgeRepository = XlsxCompetitionJudgeRepository(
    xlsxParser: participantSheetParser,
    parser: CompetitionJudgeParserFactory.createDefaultParser(),
  );

  final uc = CompetitionJudgeUseCase(repository: judgeRepository);

  IFilePersistable filePersistable = judgeRepository as IFilePersistable;
  filePersistable.loadFromFile("/home/kenedy/Downloads/current.xlsx");

  final list = uc.getAll();

  print("read all data");
  print(list.length);

  for (final j in list) {
    print(j.name);
    print(j.sportsQualification);
  }
}

void readAll() {
  final participantSheetParser = XlsxParticipantParser(
    config:
        ParticipantSheetKarateConfigFabric.createStandardChampionshipConfig(),
  );

  IParticipantRepository participantRepository = XlsxParticipantRepository(
    xlsxParser: participantSheetParser,
    participantParser: ParticipantParserFactory.createDefaultParser(),
  );

  final uc = ParticipantUseCase(repository: participantRepository);

  IFilePersistable filePersistable = participantRepository as IFilePersistable;
  filePersistable.loadFromFile("/home/kenedy/Downloads/current.xlsx");

  final list = uc.getAll(ParticipantGetAllFilter());

  print("read all data");
  print(list.length);
}
//
// void save() {
//   final participantSheetParser = XlsxParticipantParser(
//     config:
//     ParticipantSheetKarateConfigFabric.createMassSportsEventConfig(),
//   );
//
//   IParticipantRepository participantRepository = XlsxParticipantRepository(
//     xlsxParser: participantSheetParser,
//     participantParser: ParticipantParserFactory.createDefaultParser(),
//   );
//
//   final uc = ParticipantUseCase(repository: participantRepository);
//
//   IFilePersistable filePersistable = participantRepository as IFilePersistable;
//   filePersistable.loadFromFile("/home/kenedy/Downloads/current.xlsx");
//
//   final list = uc.getAll(
//     ParticipantGetAllFilter(),
//   );
//
//   print("read all data");
//   print(list.length);
//
//   filePersistable.saveToFile("/home/kenedy/Downloads/saved.xlsx");
// }

// void create() {
//   final dto = ParticipantCreateDto.fromInput(
//     rawGender: "м",
//     rawName: "Журавлев Данил Владимирович",
//     rawDateOfBirth: "23.03.2004",
//     rawBelt: "10 кю",
//     rawSportsTitle: "КМС",
//     rawWeight: "50.5",
//     rawRegion: "Хабаровский край",
//     rawTrainers: "Мисяченко Я.М., Шифу М.А.",
//     rawBlock: "А",
//   );
//
//   ParticipantSheetParser reader = ApplicationFarEasternReader();
//   final repo = ParticipantSheetRepository(
//     "/home/kenedy/Downloads/data-2.xlsx",
//     reader,
//   );
//   final uc = ParticipantUseCase(repo);
//   final data = uc.create(dto);
//
//   print(data);
// }
//
// void update(String id) {
//   final dto = ParticipantUpdateDto.fromInput(
//     rawId: id,
//     rawGender: "м",
//     rawName: "Журавлев Данил Владимирович",
//     rawDateOfBirth: "23.03.2004",
//     rawBelt: "10 кю",
//     rawSportsTitle: "КМС",
//     rawWeight: "50.5",
//     rawRegion: "Хабаровский край",
//     rawTrainers: "Мисяченко Я.М., Шифу М.А.",
//     rawBlock: "А",
//   );
//
//   ParticipantSheetParser reader = ApplicationFarEasternReader();
//   final repo = ParticipantSheetRepository(
//     "/home/kenedy/Downloads/data-2.xlsx",
//     reader,
//   );
//   final uc = ParticipantUseCase(repo);
//   final data = uc.update(dto);
//
//   print(data);
// }
//
// void delete(List<String> ids) {
//   ParticipantSheetParser reader = ApplicationFarEasternReader();
//   final repo = ParticipantSheetRepository(
//     "/home/kenedy/Downloads/data-2.xlsx",
//     reader,
//   );
//   final uc = ParticipantUseCase(repo);
//   uc.delete(ids);
//
//   print("successfully delete rows");
// }

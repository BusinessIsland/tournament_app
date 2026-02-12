import 'package:excel/excel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/gateways/sheets/configs/fabrics/kyokushin/participant/participant_sheet_kyokushin_config_fabric.dart';
import 'package:tournament_app/app/gateways/sheets/parsers/xlsx_parsers/impl/xlsx_participant_parser.dart';
import 'package:tournament_app/app/models/participant/participant.dart';
import 'package:tournament_app/app/models/participant/participant_list.dart';
import 'package:tournament_app/app/models/parts/belt/belt.dart';
import 'package:tournament_app/app/models/parts/block/block.dart';
import 'package:tournament_app/app/models/parts/date_of_birth/date_of_birth.dart';
import 'package:tournament_app/app/models/parts/gender/gender.dart';
import 'package:tournament_app/app/models/parts/id/id.dart';
import 'package:tournament_app/app/models/parts/name/person_name.dart';
import 'package:tournament_app/app/models/parts/region/region.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_ranks/adults/adult_ranks.dart';
import 'package:tournament_app/app/models/parts/weight/weight.dart';
import 'package:tournament_app/app/models/trainer/trainer.dart';
import 'package:tournament_app/app/models/trainer/trainers_list.dart';

void main() {
  group("loadFromFile", () {
    late Excel excel;
    late Sheet sheet;
    late XlsxParticipantParser parser;

    setUp(() {
      final config = ParticipantSheetKyokushinConfigFabric.createPrimacyChampionshipConfig();
      parser = XlsxParticipantParser(config: config);
      excel = Excel.createExcel();
      sheet = excel["Первенство"];

      sheet.insertRowIterables([
        TextCellValue("№ п/п"),
        TextCellValue("Пол"),
        TextCellValue("ФИО"),
        TextCellValue("Дата рождения"),
        TextCellValue("Кю, дан"),
        TextCellValue("Разряд, звание"),
        TextCellValue("Вес"),
        TextCellValue("Регион"),
        TextCellValue("Тренер(ы)"),
        TextCellValue("Блок"),
      ], 0);

      sheet.insertRowIterables([
        TextCellValue("1"),
        TextCellValue("м"),
        TextCellValue("Журавлев Данил Владимирович"),
        TextCellValue("23/03/2004"),
        TextCellValue("10 дан"),
        TextCellValue("1 спорт.р."),
        TextCellValue("52.52"),
        TextCellValue("Хабаровский край"),
        TextCellValue("Шифу М.С., Мисяченко Я.А."),
        TextCellValue("А"),
      ], 1);
    });

    test("load from file", () {
      final list = parser.concreteXlsxParse(excel);

      expect(list.size, 1);
    });
  });

  group("save to file", () {
    late ParticipantListBasicImpl list;
    late XlsxParticipantParser parser;

    setUp(() {
      final config = ParticipantSheetKyokushinConfigFabric.createPrimacyChampionshipConfig();
      parser = XlsxParticipantParser(config: config);

      list = ParticipantListBasicImpl();

      final trainersList = TrainersListBasicImpl();
      trainersList.add(
        Trainer(
          id: Id(),
          name: NameWithInitials(
            lastName: "Мисяченко",
            firstNameInitial: "Я",
            middleNameInitial: "М",
          ),
        ),
      );

      list.add(
        Participant(
          id: Id(),
          gender: MaleGender(),
          name: FullName(
            lastName: "Журавлев",
            firstName: "Данил",
            middleName: "Владимирович",
          ),
          dateOfBirth: DateTimeDateOfBirth(DateTime(2004, 03, 23)),
          belt: KuBelt(rank: 10),
          sportsQualification: FirstAdultRank(),
          weight: StandardWeight(52.52),
          region: StandardRegion("Хабаровский край"),
          trainers: trainersList,
          block: StandardBlock("А"),
        ),
      );
    });

    test("save data", () {
      final newExcel = parser.concreteSave(list);
      final newSheet = newExcel["Первенство"];

      final savedId = newSheet.cell(
        CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 1),
      );
      final savedName = newSheet.cell(
        CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 1),
      );
      final savedTrainers = newSheet.cell(
        CellIndex.indexByColumnRow(columnIndex: 8, rowIndex: 1)
      );

      expect(savedId.cellStyle!.fontFamily, getFontFamily(FontFamily.Arial));
      expect(savedId.value.toString(), "1");
      expect(savedName.value.toString(), "Журавлев Данил Владимирович");
      expect(savedTrainers.value.toString(), "Мисяченко Я.М.");
    });
  });
}

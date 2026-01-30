import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/dto/participant_input_dto.dart';
import 'package:tournament_app/app/gateways/excel/readers/application_far_eastern_reader.dart';

void main() {
  late Excel excel;

  setUp(() {
    excel = Excel.createExcel();

    Sheet sheet = excel["Первенство ДФО"];
    sheet.cell(CellIndex.indexByString("A1")).value = TextCellValue("№");
    sheet.cell(CellIndex.indexByString("B1")).value = TextCellValue("Пол");
    sheet.cell(CellIndex.indexByString("C1")).value = TextCellValue("ФИО");
    sheet.cell(CellIndex.indexByString("D1")).value = TextCellValue(
      "Дата рождения",
    );
    sheet.cell(CellIndex.indexByString("E1")).value = TextCellValue("Кю, дан");
    sheet.cell(CellIndex.indexByString("F1")).value = TextCellValue(
      "Разряд, звание",
    );
    sheet.cell(CellIndex.indexByString("G1")).value = TextCellValue("Вес");
    sheet.cell(CellIndex.indexByString("H1")).value = TextCellValue("Регион");
    sheet.cell(CellIndex.indexByString("I1")).value = TextCellValue(
      "Тренер(ы)",
    );
    sheet.cell(CellIndex.indexByString("J1")).value = TextCellValue("Блок");
    sheet.cell(CellIndex.indexByString("K1")).value = TextCellValue(
      "Полных лет",
    );

    // значение 1
    sheet.cell(CellIndex.indexByString("A2")).value = TextCellValue("1");
    sheet.cell(CellIndex.indexByString("B2")).value = TextCellValue("м");
    sheet.cell(CellIndex.indexByString("C2")).value = TextCellValue(
      "Журавлев Данил Владимирович",
    );
    sheet.cell(CellIndex.indexByString("D2")).value =
        DateCellValue.fromDateTime(DateTime.utc(2004, 3, 23));
    sheet.cell(CellIndex.indexByString("E2")).value = TextCellValue("10 кю");
    sheet.cell(CellIndex.indexByString("F2")).value = TextCellValue("1 юн.р.");
    sheet.cell(CellIndex.indexByString("G2")).value = DoubleCellValue(52);
    sheet.cell(CellIndex.indexByString("H2")).value = TextCellValue(
      "Хабаровский край",
    );
    sheet.cell(CellIndex.indexByString("I2")).value = TextCellValue(
      "Шифу М.С., Кунг-фу П.А.",
    );
    sheet.cell(CellIndex.indexByString("J2")).value = TextCellValue("А");
    sheet.cell(CellIndex.indexByString("K2")).value = IntCellValue(21);

    // значение 2
    sheet.cell(CellIndex.indexByString("A3")).value = TextCellValue("2");
    sheet.cell(CellIndex.indexByString("B3")).value = TextCellValue("ж");
    sheet.cell(CellIndex.indexByString("C3")).value = TextCellValue(
      "Бармина Ева Алексеевна",
    );
    sheet.cell(CellIndex.indexByString("D3")).value =
        DateCellValue.fromDateTime(DateTime.utc(2015, 9, 29));
    sheet.cell(CellIndex.indexByString("E3")).value = TextCellValue("10 кю");
    sheet.cell(CellIndex.indexByString("F3")).value = TextCellValue("-");
    sheet.cell(CellIndex.indexByString("G3")).value = DoubleCellValue(33.6);
    sheet.cell(CellIndex.indexByString("H3")).value = TextCellValue(
      "Хабаровский край",
    );
    sheet.cell(CellIndex.indexByString("I3")).value = TextCellValue(
      "Беляев О.Ю.",
    );
    sheet.cell(CellIndex.indexByString("J3")).value = TextCellValue("Б");
    sheet.cell(CellIndex.indexByString("K3")).value = IntCellValue(10);

    // значение 3
    sheet.cell(CellIndex.indexByString("A4")).value = TextCellValue("2");
    sheet.cell(CellIndex.indexByString("B4")).value = TextCellValue("ж");
    sheet.cell(CellIndex.indexByString("C4")).value = TextCellValue(
      "",
    );
    sheet.cell(CellIndex.indexByString("D4")).value =
        DateCellValue.fromDateTime(DateTime.utc(2015, 9, 29));
    sheet.cell(CellIndex.indexByString("E4")).value = TextCellValue("");
    sheet.cell(CellIndex.indexByString("F4")).value = TextCellValue("");
    sheet.cell(CellIndex.indexByString("G4")).value = DoubleCellValue(33.6);
    sheet.cell(CellIndex.indexByString("H4")).value = TextCellValue(
      "Хабаровский край",
    );
    sheet.cell(CellIndex.indexByString("I4")).value = TextCellValue(
      "Беляев О.Ю.",
    );
    sheet.cell(CellIndex.indexByString("J4")).value = TextCellValue("Б");
    sheet.cell(CellIndex.indexByString("K4")).value = IntCellValue(10);
  });

  group("ApplicationFarEasternReader.readWorkbook", () {
    test("should skip headers and start read values", () {
      final want = [
        ParticipantInputDto(
          "м",
          "Журавлев Данил Владимирович",
          DateTime.utc(2004, 3, 23),
          "10 кю",
          "1 юн.р.",
          52,
          "Хабаровский край",
          ["Шифу М.С.", "Кунг-фу П.А."],
          "А",
          21,
        ),
        ParticipantInputDto(
          "ж",
          "Бармина Ева Алексеевна",
          DateTime.utc(2015, 9, 29),
          "10 кю",
          "-",
          33.6,
          "Хабаровский край",
          ["Беляев О.Ю."],
          "Б",
          10,
        ),
        ParticipantInputDto(
          "ж",
          "",
          DateTime.utc(2015, 9, 29),
          "",
          "",
          33.6,
          "Хабаровский край",
          ["Беляев О.Ю."],
          "Б",
          10,
        ),
      ];

      final reader = ApplicationFarEasternReader();

      final contents = excel.encode();
      final bytes = Uint8List.fromList(contents!);

      final dtos = reader.readAll(bytes);

      expect(dtos.length, 3);

      for (int i = 0; i < want.length; i++) {
        expect(dtos[i].toString(), want[i].toString());
      }
    });
  });
}

import 'package:excel/excel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/gateways/sheets/cell_value_extractor/impl/xlsx_text_cell_value_extractor.dart';
import 'package:tournament_app/app/gateways/sheets/cell_value_extractor/xlsx_cell_value_extractor.dart';

void main() {
  late Sheet sheet;
  late XlsxCellValueExtractor textExtractor;

  group("text cell value extractor", () {
    setUp(() {
      textExtractor = XlsxTextCellValueExtractor();
      final excel = Excel.createExcel();
      sheet = excel["Первенство ДФО"];

      sheet.insertRowIterables([TextCellValue("Привет, мир!")], 0);
    });

    test(
      "extract not null value from cell should return its value as string",
      () {
        final value = textExtractor.extract(
          sheet: sheet,
          colIndex: 0,
          rowIndex: 0,
        );

        expect(value, "Привет, мир!");
      },
    );
  });
}

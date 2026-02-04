import 'package:excel/excel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/gateways/sheets/excel/cell_creator/excel_cell_creator.dart';
import 'package:tournament_app/app/gateways/sheets/excel/cell_creator/excel_cell_type.dart';

void main() {
  late Excel excel;
  late Sheet sheet;
  late ExcelCellCreator cellCreator;

  setUp(() {
    excel = Excel.createExcel();
    sheet = excel['Sheet1'];
    cellCreator = ExcelCellCreator();
  });

  group('ExcelCellCreator.create', () {
    test('should correctly create an integer cell', () {
      cellCreator.create(sheet, 0, 0, 42, ExcelCellType.int);

      final cell = sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0));
      expect(cell.value, isA<IntCellValue>());
      expect((cell.value as IntCellValue).value, equals(42));
    });

    test('should correctly create a double cell', () {
      cellCreator.create(sheet, 1, 0, 75.5, ExcelCellType.double);

      final cell = sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 0));
      expect(cell.value, isA<DoubleCellValue>());
      expect((cell.value as DoubleCellValue).value, equals(75.5));
    });

    test('should correctly create a date cell', () {
      final date = DateTime(2024, 5, 20);
      cellCreator.create(sheet, 2, 0, date, ExcelCellType.date);

      final cell = sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 0));
      expect(cell.value, isA<DateCellValue>());
      // DateCellValue stores date internally
      expect((cell.value as DateCellValue).year, equals(2024));
    });

    test('should correctly create a text cell', () {
      cellCreator.create(sheet, 3, 0, "Hello World", ExcelCellType.text);

      final cell = sheet.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 0));
      expect(cell.value, isA<TextCellValue>());
      expect((cell.value as TextCellValue).value.toString(), equals("Hello World"));
    });

    test('should correctly create a header text cell with header style', () {
      cellCreator.create(sheet, 4, 0, "Header", ExcelCellType.headerText);

      final cell = sheet.cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: 0));
      expect(cell.value, isA<TextCellValue>());
      // Checking if style is applied (not null)
      expect(cell.cellStyle, isNotNull);
    });

    test('should correctly create a formula cell', () {
      const formula = "SUM(A1:A10)";
      cellCreator.create(sheet, 5, 0, formula, ExcelCellType.formula);

      final cell = sheet.cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: 0));
      expect(cell.value, isA<FormulaCellValue>());
      expect((cell.value as FormulaCellValue).formula, equals(formula));
    });
  });
}
import 'package:excel/excel.dart';
import 'package:tournament_app/app/gateways/sheets/excel/cell_creator/excel_cell_creator.dart';
import 'package:tournament_app/app/gateways/sheets/excel/cell_creator/excel_cell_type.dart';

class ExcelRow {
  final Sheet sheet;
  final int row;
  final ExcelCellCreator cellCreator = ExcelCellCreator();

  ExcelRow(this.sheet, this.row);

  void add(int col, dynamic value, ExcelCellType type) {
    cellCreator.create(sheet, col, row, value, type);
  }
}
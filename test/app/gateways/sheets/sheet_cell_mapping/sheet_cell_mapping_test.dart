import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/gateways/sheets/sheet_cell_mapping/impl/sheet_cell_mapping_map_impl.dart';
import 'package:tournament_app/app/gateways/sheets/sheet_cell_mapping/sheet_cell_mapping.dart';

void main() {

  late SheetCellMapping mapping;

  setUp(() {
    mapping = SheetCellMappingMapImpl();
  });

  group("SheetCellMapping", () {
    test("sheet cell mapping should set value into underlying container", () {
      mapping.set("Hello", "World");

      expect(mapping.get("Hello"), "World");
    });

    test("sheet cell mapping should delete value from underlying container", () {
      mapping.set("Hello", "World");
      mapping.remove("Hello");

      expect(mapping.hasKey("Hello"), false);
    });
  });
}
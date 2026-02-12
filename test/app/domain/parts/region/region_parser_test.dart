import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/domain/parts/region/parser/region_parser.dart';
import 'package:tournament_app/app/domain/parts/region/region.dart';

void main() {
  late RegionParser parser;

  setUp(() {
    parser = RegionParser();
  });

  group("StandardRegion_Success", () {
    test("parse_RegExpInput_ReturnsRegionAsStandardRegion", () {
      final given = "Хабаровский край";
      final got = parser.parse(given);

      expect(got, isA<Region>());
    });

    test("parse_RegExpInput_StringifyReturnsRegionAsInput", () {
      final given = "Хабаровский край";
      final got = parser.parse(given);

      expect(got!.label, "Хабаровский край");
    });

    test("parse_RegExpInputWithWhitespaces_StringifyReturnsRegionWithoutWhitespaces", () {
      final given = "   Хабаровский  край   ";
      final got = parser.parse(given);

      expect(got!.label, "Хабаровский край");
    });
  });

  group("UndefinedRegion_Success", () {
    test("parse_WhitespaceInput_ReturnsRegionAsUndefinedRegion", () {
      final given = ' ' * 20;
      final got = parser.parse(given);

      expect(got, isNull);
    });
  });
}

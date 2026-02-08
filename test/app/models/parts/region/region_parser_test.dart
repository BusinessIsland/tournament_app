import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/parts/region/parser/builders/region_parser_builder.dart';
import 'package:tournament_app/app/models/parts/region/region.dart';
import 'package:tournament_app/app/models/parts/region/parser/region_parser.dart';

void main() {

  late RegionParser standardParser;
  late RegionParser commonParser;

  setUp(() {
    standardParser = RegionParserBuilder()
        .addStandardParser().build();

    commonParser = RegionParserBuilder()
        .addStandardParser().build();
  });

  group("StandardRegion_Success", () {
    test("parse_RegExpInput_ReturnsRegionAsStandardRegion", () {
      final given = "Хабаровский край";
      final got = standardParser.parse(given);

      expect(got, isA<StandardRegion>());
    });

    test("parse_RegExpInput_StringifyReturnsRegionAsInput", () {
      final given = "Хабаровский край";
      final got = standardParser.parse(given);

      expect(got.toString(), "Хабаровский край");
    });

    test("parse_RegExpInputWithWhitespaces_StringifyReturnsRegionWithoutWhitespaces", () {
      final given = "   Хабаровский  край   ";
      final got = standardParser.parse(given);

      expect(got.toString(), "Хабаровский край");
    });
  });

  group("UndefinedRegion_Success", () {
    test("parse_WhitespaceInput_ReturnsRegionAsUndefinedRegion", () {
      final given = ' ' * 20;
      final got = commonParser.parse(given);

      expect(got, isA<UndefinedRegion>());
    });

    test("parse_WhitespaceInput_StringifyReturnsText", () {
      final given = ' ' * 20;
      final got = commonParser.parse(given);

      expect(got.toString(), "не указано");
    });
  });
}

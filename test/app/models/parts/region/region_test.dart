import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/parts/region/region.dart';
import 'package:tournament_app/app/models/parts/region/region_parser.dart';

void main() {
  Region parseStandardRegion(String raw) {
    final parser = StandardRegionParser();
    return parser.parse(raw);
  }

  Region parseRegion(String raw) {
    final parser = StandardRegionParser();
    return parser.parse(raw);
  }

  group("StandardRegion_Success", () {
    test("parse_RegExpInput_ReturnsRegionAsStandardRegion", () {
      final given = "Хабаровский край";
      final got = parseStandardRegion(given);

      expect(got, isA<StandardRegion>());
    });

    test("parse_RegExpInput_StringifyReturnsRegionAsInput", () {
      final given = "Хабаровский край";
      final got = parseStandardRegion(given);

      expect(got.stringified, "Хабаровский край");
    });

    test("parse_RegExpInputWithWhitespaces_StringifyReturnsRegionWithoutWhitespaces", () {
      final given = "   Хабаровский  край   ";
      final got = parseStandardRegion(given);

      expect(got.stringified, "Хабаровский край");
    });
  });

  group("UndefinedRegion_Success", () {
    test("parse_WhitespaceInput_ReturnsRegionAsUndefinedRegion", () {
      final given = ' ' * 20;
      final got = parseRegion(given);

      expect(got, isA<UndefinedRegion>());
    });

    test("parse_WhitespaceInput_StringifyReturnsText", () {
      final given = ' ' * 20;
      final got = parseRegion(given);

      expect(got.stringified, "не указано");
    });
  });
}

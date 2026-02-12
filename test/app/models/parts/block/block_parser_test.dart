import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/parts/block/block.dart';
import 'package:tournament_app/app/models/parts/block/parser/block_parser.dart';

void main() {
  late BlockParser parser;

  setUp(() {
    parser = BlockParser();
  });

  group("SimpleBlock_Success", () {
    test("SimpleBlock_RegExpInput_ReturnsBlockAsSimpleBlock", () {
      final given = "А";
      final got = parser.parse(given);

      expect(got, isA<StandardBlock>());
    });

    test("SimpleBlock_RegExpInput_ReturnsSimpleBlockWithLabel", () {
      final given = "Б";
      final got = parser.parse(given);

      expect(got.label, "Б");
    });

    test("SimpleBlock_RegExpInput_StringifyReturnsEqualsInput", () {
      final given = "Б";
      final got = parser.parse(given);

      expect(got.toString(), "Б");
    });
  });

  group("UndefinedBlock_Success", () {
    test("parse_WhitespaceInput_ReturnsBlockAsUndefinedBlock", () {
      final given = ' ' * 10;
      final got = parser.parse(given);

      expect(got, isA<UndefinedBlock>());
    });
  });
}

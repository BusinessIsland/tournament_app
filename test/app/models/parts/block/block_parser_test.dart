import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/parts/block/block.dart';
import 'package:tournament_app/app/models/parts/block/block_parser.dart';

void main() {
  Block parseSimpleBlock(String raw) {
    final parser = SimpleBlockParser();
    return parser.parse(raw);
  }

  group("SimpleBlock_Success", () {
    test("SimpleBlock_RegExpInput_ReturnsBlockAsSimpleBlock", () {
      final given = "А";
      final got = parseSimpleBlock(given);

      expect(got, isA<SimpleBlock>());
    });

    test("SimpleBlock_RegExpInput_ReturnsSimpleBlockWithLabel", () {
      final given = "Б";
      final got = parseSimpleBlock(given);

      expect(got.label, "Б");
    });

    test("SimpleBlock_RegExpInput_StringifyReturnsEqualsInput", () {
      final given = "Б";
      final got = parseSimpleBlock(given);

      expect(got.toString(), "Б");
    });
  });

  group("UndefinedBlock_Success", () {
    test("parse_WhitespaceInput_ReturnsBlockAsUndefinedBlock", () {
        final given = ' ' * 10;
        final got = parseSimpleBlock(given);

        expect(got, isA<UndefinedBlock>());
    });
  });
}

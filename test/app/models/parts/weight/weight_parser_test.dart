import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/parts/weight/weight.dart';
import 'package:tournament_app/app/models/parts/weight/weight_parser.dart';

void main() {

  Weight parseSimpleWeight(String raw) {
    final parser = SimpleWeightParser();
    return parser.parse(raw);
  }

  Weight parseWeight(String raw) {
    final parser = SimpleWeightParser();
    return parser.parse(raw);
  }

  group("Weight_Success", () {
    test("parse_ValidDoubleInput_ReturnsWeightAsSimpleWeight", () {
      final given = "50.5";
      final got = parseSimpleWeight(given);

      expect(got, isA<SimpleWeight>());
    });

    test("parse_ValidDoubleInput_StringifyReturnsStringRepresentationOfDoubleValue", () {
      final given = "50.5";
      final got = parseSimpleWeight(given);

      expect(got.value, 50.5);
    });
  });

  group("UndefinedWeight_Success", () {
    test("parse_InvalidDoubleInput_ReturnsWeightAsUndefinedWeight", () {
      final given = "dwad50.5";
      final got = parseWeight(given);

      expect(got, isA<UndefinedWeight>());
    });

    test("parse_InvalidDoubleInput_StringifyReturnsText", () {
      final given = "dwad50.5";
      final got = parseWeight(given);

      expect(got.toString(), "не указано");
    });

    test("parse_WhitespaceInput_ReturnsWeightAsUndefinedWeight", () {
      final given = ' ' * 20;
      final got = parseWeight(given);

      expect(got, isA<UndefinedWeight>());
    });

    test("parse_NegativeDoubleInput_ReturnsWeightAsUndefinedWeight", () {
      final given = "-20";
      final got = parseWeight(given);

      expect(got, isA<UndefinedWeight>());
    });
  });
}
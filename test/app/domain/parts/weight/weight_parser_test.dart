import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/domain/parts/weight/parser/weight_parser.dart';
import 'package:tournament_app/app/domain/parts/weight/weight.dart';

void main() {
  late WeightParser parser;

  setUp(() {
    parser = WeightParser();
  });

  group("Weight_Success", () {
    test("parse_ValidDoubleInput_ReturnsWeightAsSimpleWeight", () {
      final given = "50.5";
      final got = parser.parse(given);

      expect(got, isA<Weight>());
    });

    test(
      "parse_ValidDoubleInput_StringifyReturnsStringRepresentationOfDoubleValue",
      () {
        final given = "50.5";
        final got = parser.parse(given);

        expect(got!.value, 50.5);
      },
    );
  });

  group("UndefinedWeight_Success", () {
    test("parse_InvalidDoubleInput_ReturnsWeightAsUndefinedWeight", () {
      final given = "invalid50.5";
      final got = parser.parse(given);

      expect(got, isNull);
    });

    test("parse_WhitespaceInput_ReturnsWeightAsUndefinedWeight", () {
      final given = ' ' * 20;
      final got = parser.parse(given);

      expect(got, isNull);
    });

    test("parse_NegativeDoubleInput_ReturnsWeightAsUndefinedWeight", () {
      final given = "-20";
      final got = parser.parse(given);

      expect(got, isNull);
    });
  });
}

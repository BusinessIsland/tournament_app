import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/parts/weight/parser/builders/weight_parser_builder.dart';
import 'package:tournament_app/app/models/parts/weight/weight.dart';
import 'package:tournament_app/app/models/parts/weight/parser/weight_parser.dart';

void main() {
  late WeightParser standardParser;
  late WeightParser commonParser;

  setUp(() {
    standardParser = WeightParserBuilder().addStandardParser().build();
    commonParser = WeightParserBuilder().addStandardParser().build();
  });

  group("Weight_Success", () {
    test("parse_ValidDoubleInput_ReturnsWeightAsSimpleWeight", () {
      final given = "50.5";
      final got = standardParser.parse(given);

      expect(got, isA<SimpleWeight>());
    });

    test(
      "parse_ValidDoubleInput_StringifyReturnsStringRepresentationOfDoubleValue",
      () {
        final given = "50.5";
        final got = standardParser.parse(given);

        expect(got.value, 50.5);
      },
    );
  });

  group("UndefinedWeight_Success", () {
    test("parse_InvalidDoubleInput_ReturnsWeightAsUndefinedWeight", () {
      final given = "dwad50.5";
      final got = commonParser.parse(given);

      expect(got, isA<UndefinedWeight>());
    });

    test("parse_InvalidDoubleInput_StringifyReturnsText", () {
      final given = "dwad50.5";
      final got = commonParser.parse(given);

      expect(got.toString(), "не указано");
    });

    test("parse_WhitespaceInput_ReturnsWeightAsUndefinedWeight", () {
      final given = ' ' * 20;
      final got = commonParser.parse(given);

      expect(got, isA<UndefinedWeight>());
    });

    test("parse_NegativeDoubleInput_ReturnsWeightAsUndefinedWeight", () {
      final given = "-20";
      final got = commonParser.parse(given);

      expect(got, isA<UndefinedWeight>());
    });
  });
}

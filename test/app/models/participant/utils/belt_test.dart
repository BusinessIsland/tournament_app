import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/exceptions/invalid_data_type.dart';
import 'package:tournament_app/app/models/participant/utils/belt.dart';
import 'package:tournament_app/app/models/participant/utils/belt_type.dart';

void main() {
  group('Belt.withValidation', () {
    test('should return undefined when input is null, empty or dash', () {
      final results = [
        Belt.withValidation(null),
        Belt.withValidation(""),
        Belt.withValidation("-"),
        Belt.withValidation("  "),
      ];

      for (var belt in results) {
        expect(belt.beltType, BeltType.undefined);
        expect(belt.rank, 0);
      }
    });

    test('should parse valid "кю" values correctly', () {
      final belt = Belt.withValidation("10 кю");
      expect(belt.rank, 10);
      expect(belt.beltType, BeltType.ku);
    });

    test('should parse valid "дан" values correctly with mixed case', () {
      final belt = Belt.withValidation("2 ДАН");
      expect(belt.rank, 2);
      expect(belt.beltType, BeltType.dan);
    });

    test('should throw InvalidDataType for invalid format', () {
      final invalidInputs = ["10кю", "кю 10", "10", "black belt"];
      for (var input in invalidInputs) {
        expect(() => Belt.withValidation(input), throwsA(isA<InvalidDataType>()));
      }
    });

    test('should throw InvalidDataType for out-of-range ranks', () {
      expect(() => Belt.withValidation("0 кю"), throwsA(isA<InvalidDataType>()));
      expect(() => Belt.withValidation("11 дан"), throwsA(isA<InvalidDataType>()));
    });
  });

  group('Belt Equality', () {
    test('two instances with same properties should be equal', () {
      final belt1 = Belt(BeltType.ku, 5);
      final belt2 = Belt(BeltType.ku, 5);

      expect(belt1, equals(belt2));
      expect(belt1 == belt2, isTrue);
    });

    test('instances with different properties should not be equal', () {
      final belt1 = Belt(BeltType.ku, 5);
      final belt2 = Belt(BeltType.dan, 5);
      final belt3 = Belt(BeltType.ku, 4);

      expect(belt1 == belt2, isFalse);
      expect(belt1 == belt3, isFalse);
    });

    test('hashCodes should be identical for equal instances', () {
      final belt1 = Belt(BeltType.dan, 1);
      final belt2 = Belt(BeltType.dan, 1);

      expect(belt1.hashCode, equals(belt2.hashCode));
    });
  });

  group('Belt Logic (powerLevel & stringified)', () {
    test('powerLevel should calculate correctly for Ku and Dan', () {
      // 10 Ku is weakest (-10), 1 Dan is stronger (1)
      final ku10 = Belt(BeltType.ku, 10);
      final dan1 = Belt(BeltType.dan, 1);

      expect(ku10.powerLevel, -10);
      expect(dan1.powerLevel, 1);
      expect(dan1.powerLevel > ku10.powerLevel, isTrue);
    });

    test('stringified should return correct human-readable format', () {
      expect(Belt(BeltType.ku, 6).stringified, "6 кю");
      expect(Belt(BeltType.undefined, 0).stringified, equals(BeltType.undefined.label));
    });
  });
}
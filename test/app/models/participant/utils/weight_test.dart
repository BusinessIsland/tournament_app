import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/exceptions/invalid_data_type.dart';
import 'package:tournament_app/app/models/participant/utils/weight.dart';

void main() {
  group('Weight.withValidation', () {
    test('should successfully parse a double with a dot', () {
      final weight = Weight.withValidation("75.5");
      expect(weight.value, equals(75.5));
    });

    test('should successfully parse a double with a comma (Excel style)', () {
      final weight = Weight.withValidation("65,2");
      expect(weight.value, equals(65.2));
    });

    test('should handle extra whitespace around the value', () {
      final weight = Weight.withValidation("  80,0  ");
      expect(weight.value, equals(80.0));
    });

    test('should throw InvalidDataType when input is null', () {
      expect(
            () => Weight.withValidation(null),
        throwsA(isA<InvalidDataType>()),
      );
    });

    test('should throw InvalidDataType for negative values', () {
      expect(
            () => Weight.withValidation("-10"),
        throwsA(isA<InvalidDataType>()),
      );
    });

    test('should throw InvalidDataType for zero value', () {
      expect(
            () => Weight.withValidation("0"),
        throwsA(isA<InvalidDataType>()),
      );
    });

    test('should throw InvalidDataType for non-numeric strings', () {
      expect(
            () => Weight.withValidation("seventy kg"),
        throwsA(isA<InvalidDataType>()),
      );
    });
  });

  group('Weight Equality and Hashing', () {
    test('two instances with the same value should be equal', () {
      final w1 = Weight(70.5);
      final w2 = Weight(70.5);

      expect(w1, equals(w2));
      expect(w1 == w2, isTrue);
    });

    test('different values should not be equal', () {
      final w1 = Weight(70.5);
      final w2 = Weight(70.6);

      expect(w1 == w2, isFalse);
    });

    test('hashCodes should match for identical values', () {
      final w1 = Weight(55.0);
      final w2 = Weight(55.0);

      expect(w1.hashCode, equals(w2.hashCode));
    });
  });

  group('Weight Utilities', () {
    test('toString should display the internal double value', () {
      final weight = Weight(100.0);
      expect(weight.toString(), contains('100.0'));
    });
  });
}
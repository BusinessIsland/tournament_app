import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/participant/utils/block.dart';

void main() {
  group('Block.withValidation', () {
    test('should return an empty string when input is null', () {
      final block = Block.withValidation(null);
      expect(block.value, isEmpty);
    });

    test('should trim leading and trailing whitespace', () {
      final block = Block.withValidation("  Block A  ");
      expect(block.value, "Block A");
    });

    test('should preserve valid strings correctly', () {
      final block = Block.withValidation("B-12");
      expect(block.value, "B-12");
    });
  });

  group('Block Equality and Comparison', () {
    test('two blocks with the same value should be equal', () {
      final block1 = Block("Group A");
      final block2 = Block("Group A");

      // Testing operator ==
      expect(block1, equals(block2));
      expect(block1 == block2, isTrue);
    });

    test('two blocks with different values should not be equal', () {
      final block1 = Block("Group A");
      final block2 = Block("Group B");

      expect(block1 == block2, isFalse);
      expect(block1, isNot(equals(block2)));
    });

    test('should have identical hashCodes for identical values', () {
      final block1 = Block("A");
      final block2 = Block("A");

      expect(block1.hashCode, equals(block2.hashCode));
    });

    test('identical objects (same reference) should be equal', () {
      final block = Block("A");
      expect(block == block, isTrue);
    });
  });

  group('Block Utility Methods', () {
    test('toString should return a formatted string with the value', () {
      final block = Block("A1");
      expect(block.toString(), contains('value: A1'));
    });
  });
}
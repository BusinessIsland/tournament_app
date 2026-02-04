import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/exceptions/invalid_data_type.dart';
import 'package:tournament_app/app/models/participant/utils/row_id.dart';

void main() {
  group('RowId.withValidation', () {
    test('should return RowId(0) when input is null', () {
      final rowId = RowId.withValidation(null);

      expect(rowId.value, equals(0));
    });

    test('should successfully parse a valid positive integer string', () {
      final rowId = RowId.withValidation("42");

      expect(rowId.value, equals(42));
    });

    test('should successfully parse "0" as a valid row ID', () {
      final rowId = RowId.withValidation("0");

      expect(rowId.value, equals(0));
    });

    test('should parse a numeric string with leading zeros as a decimal', () {
      final rowId = RowId.withValidation("007");

      expect(rowId.value, equals(7));
    });

    test('should throw InvalidDataType when input is not a number', () {
      expect(
            () => RowId.withValidation("not_a_number"),
        throwsA(isA<InvalidDataType>()),
      );
    });

    test('should throw InvalidDataType when input is a negative number', () {
      expect(
            () => RowId.withValidation("-1"),
        throwsA(isA<InvalidDataType>()),
      );
    });

    test('should throw InvalidDataType when input is a fractional number', () {
      expect(
            () => RowId.withValidation("1.5"),
        throwsA(isA<InvalidDataType>()),
      );
    });
  });

  group('RowId Equality and Hashing', () {
    test('two instances with the same integer value should be equal', () {
      final id1 = RowId(10);
      final id2 = RowId(10);

      expect(id1, equals(id2));
      expect(id1 == id2, isTrue);
    });

    test('different values should not be equal', () {
      final id1 = RowId(10);
      final id2 = RowId(11);

      expect(id1 == id2, isFalse);
    });

    test('hashCodes should match for instances with the same value', () {
      final id1 = RowId(500);
      final id2 = RowId(500);

      expect(id1.hashCode, equals(id2.hashCode));
    });
  });

  group('RowId Utilities', () {
    test('toString should display the internal integer value', () {
      final rowId = RowId(123);
      expect(rowId.toString(), contains('123'));
    });
  });
}
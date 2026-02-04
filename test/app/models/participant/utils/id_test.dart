import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/exceptions/invalid_data_type.dart';
import 'package:tournament_app/app/models/participant/utils/id.dart';

void main() {
  group('Id.withValidation', () {
    test('should generate a new valid UUID when input is null', () {
      final id = Id.withValidation(null);

      expect(id.value, isNotEmpty);
      // Verify the generated string is a valid UUID
      expect(RegExp(r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$')
          .hasMatch(id.value), isTrue);
    });

    test('should successfully create Id from a valid UUID string', () {
      const validUuid = '550e8400-e29b-41d4-a716-446655440000';
      final id = Id.withValidation(validUuid);

      expect(id.value, equals(validUuid));
    });

    test('should throw InvalidDataType when input is not a valid UUID', () {
      const invalidUuid = 'not-a-uuid-123';

      expect(
            () => Id.withValidation(invalidUuid),
        throwsA(isA<InvalidDataType>()),
      );
    });

    test('should throw InvalidDataType when input is an empty string', () {
      expect(
            () => Id.withValidation(""),
        throwsA(isA<InvalidDataType>()),
      );
    });
  });

  group('Id Equality', () {
    test('two instances with the same value should be equal', () {
      const uuidString = '550e8400-e29b-41d4-a716-446655440000';
      final id1 = Id(uuidString);
      final id2 = Id(uuidString);

      expect(id1, equals(id2));
      expect(id1 == id2, isTrue);
    });

    test('should have identical hashCodes for identical values', () {
      const uuidString = '550e8400-e29b-41d4-a716-446655440000';
      final id1 = Id(uuidString);
      final id2 = Id(uuidString);

      expect(id1.hashCode, equals(id2.hashCode));
    });
  });

  group('Id Utilities', () {
    test('toString should contain the ID value', () {
      final id = Id('test-id');
      expect(id.toString(), contains('test-id'));
    });
  });
}
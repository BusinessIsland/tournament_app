import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/exceptions/invalid_data_type.dart';
import 'package:tournament_app/app/models/participant/utils/date_of_birth.dart';

void main() {
  group('DateOfBirth.withValidation', () {
    test('should successfully parse dates in different formats', () {
      expect(DateOfBirth.withValidation("1995-05-15").value, DateTime(1995, 5, 15));
      expect(DateOfBirth.withValidation("15.05.1995").value, DateTime(1995, 5, 15));
      expect(DateOfBirth.withValidation("1995/05/15").value, DateTime(1995, 5, 15));
    });

    test('should throw InvalidDataType for null input', () {
      expect(
            () => DateOfBirth.withValidation(null),
        throwsA(isA<InvalidDataType>()),
      );
    });

    test('should throw InvalidDataType for invalid formats', () {
      expect(() => DateOfBirth.withValidation("15-05-1995"), throwsA(isA<InvalidDataType>()));
      expect(() => DateOfBirth.withValidation("random string"), throwsA(isA<InvalidDataType>()));
    });

    test('should throw InvalidDataType for future dates', () {
      final futureDate = DateTime.now().add(const Duration(days: 1));
      final rawFuture = "${futureDate.year}-${futureDate.month}-${futureDate.day}";

      expect(
            () => DateOfBirth.withValidation(rawFuture),
        throwsA(isA<InvalidDataType>()),
      );
    });
  });

  group('DateOfBirth.age calculation', () {
    test('should calculate correct age for a birthday that has already occurred this year', () {
      // Assuming today is 2026-02-02
      final dob = DateOfBirth(DateTime(1990, 01, 01));
      expect(dob.age, 36);
    });

    test('should calculate correct age for a birthday that has not yet occurred this year', () {
      // Assuming today is 2026-02-02
      final dob = DateOfBirth(DateTime(1990, 12, 31));
      expect(dob.age, 35);
    });

    test('should handle leap year birthdays correctly', () {
      final dob = DateOfBirth(DateTime(2000, 02, 29));
      // In 2026, on Feb 2nd, the birthday hasn't happened yet
      expect(dob.age, 25);
    });
  });

  group('DateOfBirth equality and formatting', () {
    test('two instances with the same date should be equal', () {
      final dob1 = DateOfBirth(DateTime(1995, 5, 15));
      final dob2 = DateOfBirth(DateTime(1995, 5, 15));
      expect(dob1, equals(dob2));
      expect(dob1.hashCode, equals(dob2.hashCode));
    });

    test('toString should return Russian standard format', () {
      final dob = DateOfBirth(DateTime(1995, 5, 15));
      expect(dob.toString(), "15.05.1995");
    });

    test('toIsoString should return ISO standard format', () {
      final dob = DateOfBirth(DateTime(1995, 5, 15));
      expect(dob.toIsoString(), "1995-05-15");
    });
  });
}
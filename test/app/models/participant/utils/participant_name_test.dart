import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/exceptions/invalid_data_type.dart';
import 'package:tournament_app/app/models/participant/utils/participant_name.dart';

void main() {
  group('ParticipantName.withValidation', () {
    test('should capitalize names and trim extra spaces', () {
      final name = ParticipantName.withValidation("  iVAnov   iVAN  iVAnovICh  ");

      expect(name.lastname, "Ivanov");
      expect(name.firstname, "Ivan");
      expect(name.middlename, "Ivanovich");
    });

    test('should parse only lastname when single word is provided', () {
      final name = ParticipantName.withValidation("IVANOV");

      expect(name.lastname, "Ivanov");
      expect(name.firstname, isNull);
      expect(name.middlename, isNull);
    });

    test('should parse complex middlenames (more than 3 words)', () {
      final name = ParticipantName.withValidation("Al-abbadi mohammed ali ahmad");

      expect(name.lastname, "Al-abbadi");
      expect(name.firstname, "Mohammed");
      expect(name.middlename, "Ali Ahmad");
    });

    test('should throw InvalidDataType when input is null or whitespace only', () {
      expect(() => ParticipantName.withValidation(null), throwsA(isA<InvalidDataType>()));
      expect(() => ParticipantName.withValidation("   "), throwsA(isA<InvalidDataType>()));
    });
  });

  group('ParticipantName formatting', () {
    test('getFullName should return space-separated string', () {
      final name = ParticipantName(lastname: "Ivanov", firstname: "Ivan", middlename: "Ivanovich");
      expect(name.getFullName(), "Ivanov Ivan Ivanovich");
    });

    test('getFullName should work with lastname only', () {
      final name = ParticipantName(lastname: "Ivanov");
      expect(name.getFullName(), "Ivanov");
    });

    test('getShortName should return initials', () {
      final name = ParticipantName(lastname: "Ivanov", firstname: "Ivan", middlename: "Ivanovich");
      expect(name.getShortName(), "Ivanov I. I.");
    });

    test('getShortName should handle missing first or middle names', () {
      final name = ParticipantName(lastname: "Ivanov", firstname: "Ivan");
      expect(name.getShortName(), "Ivanov I.");
    });
  });

  group('ParticipantName Equality', () {
    test('two instances with same properties should be equal', () {
      final name1 = ParticipantName(lastname: "Ivanov", firstname: "Ivan");
      final name2 = ParticipantName(lastname: "Ivanov", firstname: "Ivan");

      expect(name1, equals(name2));
      expect(name1.hashCode, equals(name2.hashCode));
    });

    test('different names should not be equal', () {
      final name1 = ParticipantName(lastname: "Ivanov");
      final name2 = ParticipantName(lastname: "Petrov");

      expect(name1 == name2, isFalse);
    });
  });
}
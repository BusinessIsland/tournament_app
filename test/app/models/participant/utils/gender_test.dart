import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/exceptions/invalid_data_type.dart';
import 'package:tournament_app/app/models/participant/utils/gender.dart';

void main() {
  group('Gender.withValidation', () {
    test('should successfully parse male gender from various aliases', () {
      expect(Gender.withValidation("м"), Gender.male);
      expect(Gender.withValidation("М"), Gender.male);
      expect(Gender.withValidation("муж"), Gender.male);
    });

    test('should successfully parse female gender from various aliases', () {
      expect(Gender.withValidation("ж"), Gender.female);
      expect(Gender.withValidation("Ж"), Gender.female);
      expect(Gender.withValidation("жен"), Gender.female);
    });

    test('should handle extra spaces and mixed casing', () {
      expect(Gender.withValidation("  Муж  "), Gender.male);
      expect(Gender.withValidation(" Ж "), Gender.female);
    });

    test('should throw InvalidDataType when input is null', () {
      expect(
            () => Gender.withValidation(null),
        throwsA(predicate((e) =>
        e is InvalidDataType && e.message.contains('обязателен'))),
      );
    });

    test('should throw InvalidDataType for unsupported values', () {
      expect(
            () => Gender.withValidation("unknown"),
        throwsA(isA<InvalidDataType>()),
      );
      expect(
            () => Gender.withValidation("1"),
        throwsA(isA<InvalidDataType>()),
      );
    });
  });

  group('Gender properties and logic', () {
    test('isMale should return true only for male gender', () {
      expect(Gender.male.isMale, isTrue);
      expect(Gender.female.isMale, isFalse);
    });

    test('shortLabel should return correct Russian shorthand', () {
      expect(Gender.male.shortLabel, "м");
      expect(Gender.female.shortLabel, "ж");
    });

    test('toString should return the full Russian label', () {
      expect(Gender.male.toString(), "мужчина");
      expect(Gender.female.toString(), "женщина");
    });
  });
}
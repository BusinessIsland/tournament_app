import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/exceptions/invalid_data_type.dart';
import 'package:tournament_app/app/models/trainer/trainer.dart';

void main() {
  group('Trainer.parseSingle', () {
    test('should successfully parse standard "Lastname I.O." format', () {
      final trainer = Trainer.parseSingle("Ivanov I.V.");
      expect(trainer.lastname, "Ivanov");
      expect(trainer.firstnameInitial, "I");
      expect(trainer.middlenameInitial, "V");
    });

    test('should capitalize lastname and initials', () {
      final trainer = Trainer.parseSingle("petrov a.b.");
      expect(trainer.lastname, "Petrov");
      expect(trainer.firstnameInitial, "A");
      expect(trainer.middlenameInitial, "B");
    });

    test('should work correctly with only one initial', () {
      final trainer = Trainer.parseSingle("Kozlov A.");
      expect(trainer.lastname, "Kozlov");
      expect(trainer.firstnameInitial, "A");
      expect(trainer.middlenameInitial, "");
    });

    test('should throw InvalidDataType fro initials without dots but with spaces', () {
      expect(() => Trainer.parseSingle("Sidorov A B"), throwsA(isA<InvalidDataType>()));
    });

    test('should throw InvalidDataType for invalid formats', () {
      expect(() => Trainer.parseSingle("Ivanov"), throwsA(isA<InvalidDataType>()));
      expect(() => Trainer.parseSingle("Ivanov I.V. Junior"), throwsA(isA<InvalidDataType>()));
    });
  });

  group('Trainer.parseList', () {
    test('should parse multiple trainers separated by various delimiters', () {
      const raw = "Ivanov I.V.; Petrov A.B. / Sidorov C.D.";
      final trainers = Trainer.parseList(raw);

      expect(trainers.length, 3);
      expect(trainers[0].lastname, "Ivanov");
      expect(trainers[1].lastname, "Petrov");
      expect(trainers[2].lastname, "Sidorov");
    });

    test('should throw InvalidDataType for null or empty list string', () {
      expect(() => Trainer.parseList(null), throwsA(isA<InvalidDataType>()));
      expect(() => Trainer.parseList("   "), throwsA(isA<InvalidDataType>()));
    });
  });

  group('Trainer formatting and equality', () {
    test('toString should return formatted string with dots', () {
      final trainer = Trainer(lastname: "Ivanov", firstnameInitial: "I", middlenameInitial: "V");
      expect(trainer.toString(), "Ivanov I.V.");
    });

    test('toString should skip second dot if middle initial is empty', () {
      final trainer = Trainer(lastname: "Ivanov", firstnameInitial: "I", middlenameInitial: "");
      expect(trainer.toString(), "Ivanov I.");
    });

    test('stringify extension should join multiple trainers with commas', () {
      final list = [
        Trainer(lastname: "Ivanov", firstnameInitial: "I", middlenameInitial: "V"),
        Trainer(lastname: "Petrov", firstnameInitial: "A", middlenameInitial: ""),
      ];
      expect(list.stringify(), "Ivanov I.V., Petrov A.");
    });

    test('equality and hashCode should work based on values', () {
      final t1 = Trainer(lastname: "Ivanov", firstnameInitial: "I", middlenameInitial: "V");
      final t2 = Trainer(lastname: "Ivanov", firstnameInitial: "I", middlenameInitial: "V");

      expect(t1, equals(t2));
      expect(t1.hashCode, equals(t2.hashCode));
    });
  });
}
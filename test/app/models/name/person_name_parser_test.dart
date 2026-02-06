import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/parts/name/person_name.dart';
import 'package:tournament_app/app/models/parts/name/person_name_parser.dart';

void main() {
  group('FullNameParser tests', () {
    final parser = FullNameParser();

    test('should parse full name with middle name', () {
      final result = parser.concreteParse('Иванов Иван Иванович');
      expect(result, isA<FullName>());
      final name = result as FullName;
      expect(name.lastName, 'Иванов');
      expect(name.firstName, 'Иван');
      expect(name.middleName, 'Иванович');
    });

    test('should parse last name and first name only', () {
      final result = parser.concreteParse('Петров Петр');
      expect(result, isA<FullName>());
      final name = result as FullName;
      expect(name.lastName, 'Петров');
      expect(name.firstName, 'Петр');
      expect(name.middleName, '');
    });

    test('should return null if first letter is lowercase', () {
      final result = parser.concreteParse('иванов иван');
      expect(result, isNull);
    });
  });

  group('NameWithInitialsParser tests', () {
    final parser = NameWithInitialsParser();

    test('should parse last name with two initials', () {
      final result = parser.concreteParse('Сидоров С.С.');
      expect(result, isA<NameWithInitials>());
      final name = result as NameWithInitials;
      expect(name.lastName, 'Сидоров');
      expect(name.firstNameInitial, 'С');
      expect(name.middleNameInitial, 'С');
    });

    test('should parse last name with single initial', () {
      final result = parser.concreteParse('Козлов К.');
      expect(result, isA<NameWithInitials>());
      final name = result as NameWithInitials;
      expect(name.lastName, 'Козлов');
      expect(name.firstNameInitial, 'К');
      expect(name.middleNameInitial, '');
    });
  });

  group('ShortNameParser tests', () {
    final parser = ShortNameParser();

    test('should parse last name only', () {
      final result = parser.concreteParse('Смирнов');
      expect(result, isA<ShortName>());
      expect((result as ShortName).lastName, 'Смирнов');
    });

    test('should return null for invalid format or numbers', () {
      expect(parser.concreteParse(''), isNull);
      expect(parser.concreteParse('12345'), isNull);
    });
  });

  group('Chain of Responsibility Integration tests', () {
    late PersonNameParser chain;

    setUp(() {
      chain = FullNameParser();
      chain
          .setNext(NameWithInitialsParser())
          .setNext(ShortNameParser());
    });

    test('should return UndefinedName when no parser matches', () {
      final result = chain.parse('Invalid Name 123');
      expect(result, isA<UndefinedName>());
    });

    test('should fall back to ShortNameParser if others fail', () {
      final result = chain.parse('Кузнецов');
      expect(result, isA<ShortName>());
      expect((result as ShortName).lastName, 'Кузнецов');
    });

    test('should handle extra whitespace around the input', () {
      final result = chain.parse('   Иванов И.И.   ');
      expect(result, isA<NameWithInitials>());
      expect((result as NameWithInitials).lastName, 'Иванов');
    });

    test('should return UndefinedName for null or empty input', () {
      expect(chain.parse(null), isA<UndefinedName>());
      expect(chain.parse(''), isA<UndefinedName>());
    });
  });
}
import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/participant/utils/sports_title.dart';

void main() {
  group('SportsTitle.withValidation', () {
    test('should return undefined when input is null, empty, or a dash', () {
      expect(SportsTitle.withValidation(null), SportsTitle.undefined);
      expect(SportsTitle.withValidation(""), SportsTitle.undefined);
      expect(SportsTitle.withValidation("-"), SportsTitle.undefined);
    });

    test('should successfully parse high-level titles (CMS, MS, Grandmaster)', () {
      expect(SportsTitle.withValidation("КМС"), SportsTitle.candidateMaster);
      expect(SportsTitle.withValidation("МС"), SportsTitle.masterOfSports);
      expect(SportsTitle.withValidation("ГР"), SportsTitle.grandmaster);
      expect(SportsTitle.withValidation("МСМК"), SportsTitle.masterOfSportsOfInternationalClass);
    });

    test('should successfully parse sports ranks (1, 2, 3 sports)', () {
      expect(SportsTitle.withValidation("1 ср"), SportsTitle.firstSports);
      expect(SportsTitle.withValidation("2 сп.р."), SportsTitle.secondSports);
      expect(SportsTitle.withValidation("3ср"), SportsTitle.thirdSports);
    });

    test('should successfully parse youth ranks (1, 2, 3 youth)', () {
      expect(SportsTitle.withValidation("1 юр"), SportsTitle.firstYouthSports);
      expect(SportsTitle.withValidation("2 юнош.р."), SportsTitle.secondYouthSports);
      expect(SportsTitle.withValidation("3юр"), SportsTitle.thirdYouthSports);
    });

    test('should handle casing and extra spaces', () {
      expect(SportsTitle.withValidation("  кмс  "), SportsTitle.candidateMaster);
      expect(SportsTitle.withValidation("1 ЮР"), SportsTitle.firstYouthSports);
    });

    test('should return undefined for unknown or invalid titles', () {
      expect(SportsTitle.withValidation("pro athlete"), SportsTitle.undefined);
      expect(SportsTitle.withValidation("random string"), SportsTitle.undefined);
    });
  });

  group('SportsTitle weights and properties', () {
    test('Grandmaster should have the highest weight', () {
      expect(SportsTitle.grandmaster.weight, 10);
      expect(SportsTitle.grandmaster.weight > SportsTitle.masterOfSports.weight, isTrue);
    });

    test('Youth ranks should have lower weights than adult ranks', () {
      expect(SportsTitle.firstSports.weight > SportsTitle.firstYouthSports.weight, isTrue);
    });

    test('undefined should have zero weight', () {
      expect(SportsTitle.undefined.weight, 0);
    });

    test('sheetAlias should return the correct short string for Excel', () {
      expect(SportsTitle.candidateMaster.sheetAlias, "КМС");
      expect(SportsTitle.undefined.sheetAlias, "-");
    });

    test('toString should return the full description', () {
      expect(SportsTitle.grandmaster.toString(), "гроссмейстер России");
    });
  });
}
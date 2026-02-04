import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/participant/utils/region.dart';

void main() {
  group('Region.withValidation', () {
    test('should return an empty string when input is null', () {
      final region = Region.withValidation(null);

      expect(region.value, isEmpty);
    });

    test('should trim leading and trailing whitespace from raw input', () {
      final region = Region.withValidation("  Primorsky Krai  ");

      expect(region.value, equals("Primorsky Krai"));
    });

    test('should preserve the string correctly when no trimming is needed', () {
      const rawValue = "Khabarovsk Region";
      final region = Region.withValidation(rawValue);

      expect(region.value, equals(rawValue));
    });

    test('should handle empty strings correctly', () {
      final region = Region.withValidation("");

      expect(region.value, isEmpty);
    });
  });

  group('Region Equality', () {
    test('two instances with the same value should be equal', () {
      final region1 = Region("Amur");
      final region2 = Region("Amur");

      expect(region1, equals(region2));
      expect(region1 == region2, isTrue);
    });

    test('instances with different values should not be equal', () {
      final region1 = Region("Amur");
      final region2 = Region("Sakhalin");

      expect(region1 == region2, isFalse);
      expect(region1, isNot(equals(region2)));
    });

    test('should have identical hashCodes for identical values', () {
      final region1 = Region("Magadan");
      final region2 = Region("Magadan");

      expect(region1.hashCode, equals(region2.hashCode));
    });

    test('identical objects (same reference) should be equal', () {
      final region = Region("Buryatia");
      expect(region == region, isTrue);
    });
  });

  group('Region Utility Methods', () {
    test('toString should display the region value correctly', () {
      final region = Region("Yakutia");
      expect(region.toString(), contains('Yakutia'));
    });
  });
}
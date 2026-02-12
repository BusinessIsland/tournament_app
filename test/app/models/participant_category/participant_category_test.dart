import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/participant/participant_category/participant_category.dart';
import 'package:tournament_app/app/models/parts/age_category/age_category.dart';
import 'package:tournament_app/app/models/parts/weight_category/weight_category.dart';

void main() {
  group("ParticipantCategory.matches", () {
    test(
      "matches returns true if participant is in weight and age categories",
      () {
        final ageCategory = BelowAgeCategory(maxAge: 20);
        final weightCategory = BelowWeightCategory(maxWeight: 50);

        final participantCategory = ParticipantCategory(
          ageCategory: ageCategory,
          weightCategory: weightCategory,
          label: "мальчики",
        );

        expect(participantCategory.matches(age: 14, weight: 49.99), true);
      },
    );

    test("matches returns false if participant is not in weight or age categories", () {
      final ageCategory = BelowAgeCategory(maxAge: 20);
      final weightCategory = BelowWeightCategory(maxWeight: 50);

      final participantCategory = ParticipantCategory(
        ageCategory: ageCategory,
        weightCategory: weightCategory,
        label: "мальчики",
      );

      expect(participantCategory.matches(age: 30, weight: 49.99), false);
      expect(participantCategory.matches(age: 14, weight: 52), false);
      expect(participantCategory.matches(age: 30, weight: 54.4), false);
    });
  });
}

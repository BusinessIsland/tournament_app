import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/participant/participant_category/labels_providers/kiokusinkay_label_provider/kiokusinkay_label_provider.dart';
import 'package:tournament_app/app/models/participant/participant_category/labels_providers/kiokusinkay_label_provider/kiokusinkay_label_resolve_female_strategy.dart';
import 'package:tournament_app/app/models/participant/participant_category/labels_providers/kiokusinkay_label_provider/kiokusinkay_label_resolve_male_strategy.dart';
import 'package:tournament_app/app/models/participant/participant_category/labels_providers/participant_label_provider.dart';

void main() {
  group("ParticipantLabelProviders", () {
    ParticipantLabelProvider createProvider() {
      return KiokusinkayLabelProvider(
        maleStrategy: KiokusinkayLabelResolveMaleStrategy(),
        femaleStrategy: KiokusinkayLabelResolveFemaleStrategy()
      );
    }

    group("KiokusinkayLabelsProvider", () {
      group("male participants", () {
        test("Male participants with age in range 10-11 are boys", () {
          final provider = createProvider();

          expect(provider.resolveLabelByAge(age: 10, isMale: true), "мальчики");
          expect(provider.resolveLabelByAge(age: 11, isMale: true), "мальчики");
        });

        test("Male participants with age in range 12-13 are youth", () {
          final provider = createProvider();

          expect(provider.resolveLabelByAge(age: 12, isMale: true), "юноши");
          expect(provider.resolveLabelByAge(age: 13, isMale: true), "юноши");
        });

        test("Male participants with age in range 14-15 are youth", () {
          final provider = createProvider();

          expect(provider.resolveLabelByAge(age: 14, isMale: true), "юноши");
          expect(provider.resolveLabelByAge(age: 15, isMale: true), "юноши");
        });

        test("Male participants with age in range 16-17 are juniors", () {
          final provider = createProvider();

          expect(provider.resolveLabelByAge(age: 16, isMale: true), "юниоры");
          expect(provider.resolveLabelByAge(age: 17, isMale: true), "юниоры");
        });

        test("Male participants with age gte 18 are man", () {
          final provider = createProvider();

          expect(provider.resolveLabelByAge(age: 18, isMale: true), "мужчины");
          expect(provider.resolveLabelByAge(age: 20, isMale: true), "мужчины");
        });
      });

      group("female participants", () {
        test("Female participants with age in range 10-11 are girls", () {
          final provider = createProvider();

          expect(provider.resolveLabelByAge(age: 10, isMale: false), "девочки");
          expect(provider.resolveLabelByAge(age: 11, isMale: false), "девочки");
        });

        test("Female participants with age in range 12-13 are girls", () {
          final provider = createProvider();

          expect(provider.resolveLabelByAge(age: 12, isMale: false), "девушки");
          expect(provider.resolveLabelByAge(age: 13, isMale: false), "девушки");
        });

        test("Female participants with age in range 14-15 are girls", () {
          final provider = createProvider();

          expect(provider.resolveLabelByAge(age: 14, isMale: false), "девушки");
          expect(provider.resolveLabelByAge(age: 15, isMale: false), "девушки");
        });

        test("Female participants with age in range 16-17 are juniors", () {
          final provider = createProvider();

          expect(provider.resolveLabelByAge(age: 16, isMale: false), "юниорки");
          expect(provider.resolveLabelByAge(age: 17, isMale: false), "юниорки");
        });

        test("Female participants with age gte 18 are woman", () {
          final provider = createProvider();

          expect(provider.resolveLabelByAge(age: 18, isMale: false), "женщины");
          expect(provider.resolveLabelByAge(age: 20, isMale: false), "женщины");
        });
      });
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/trainer/trainer.dart';

void main() {
  group("Trainer.fromSheet", () {
    test("should create trainer with no exceptions when data is correct", () {
      final inputs = ["Мисяченко Я.А.", "     Мисяченко Я.А.", "Мисяченко Я.А.      ", "      Мисяченко Я.А.    "];
      final want = "Мисяченко Я.А.";

      for (String input in inputs) {
        final got = Trainer.fromSheet(input);
        expect(got.toString(), equals(want));
      }
    });

    test(
      "should throw FormatException when create trainer when count of whitespaces not equals 1",
      () {
        final inputs = ["МисяченкоЯ.А.", "Мисяченко  Я.А."];

        for (String input in inputs) {
          expect(
                () => Trainer.fromSheet(input),
            throwsA(
              isA<FormatException>().having(
                    (e) => e.message,
                'message',
                "Неверный формат ФИО: '$input'. Ожидается 'Фамилия И.О.'",
              ),
            ),
          );
        }
      },
    );

    test(
      "should throw FormatException when create trainer when count of dots not equals 2",
        () {
          final inputs = ["Мисяченко ЯА", "Мисяченко ЯА.", "Мисяченко Я.", "Мисяченко Я.А.Ф"];

          for (String input in inputs) {
            expect(
                  () => Trainer.fromSheet(input),
              throwsA(
                isA<FormatException>().having(
                      (e) => e.message,
                  'message',
                  "Не удалось разобрать инициалы в: '$input'. Ожидается формат 'И.О.'",
                ),
              ),
            );
          }
        }
    );
  });
}

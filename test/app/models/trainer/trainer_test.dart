import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/exceptions/invalid_data_type.dart';
import 'package:tournament_app/app/models/trainer/trainer.dart';

void main() {
  group("Trainer.parseSingle", () {
    test("should create trainer with no exceptions when data is correct", () {
      final inputs = ["Мисяченко Я.А.", "     Мисяченко Я.А.", "Мисяченко Я.А.      ", "      Мисяченко Я.А.    "];
      final want = "Мисяченко Я.А.";

      for (String input in inputs) {
        final got = Trainer.parseSingle(input);
        expect(got.toString(), equals(want));
      }
    });

    test(
      "should throw FormatException when create trainer when count of whitespaces not equals 1",
      () {
        final inputs = ["МисяченкоЯ.А."];

        for (String input in inputs) {
          expect(
                () => Trainer.parseSingle(input),
            throwsA(
              isA<InvalidDataType>().having(
                    (e) => e.message,
                'message',
                "Тренер(ы) '$input': неверный формат ФИО тренера, ожидается Фамилия И.О.",
              ),
            ),
          );
        }
      },
    );

    test(
      "should throw FormatException when create trainer when count of dots not equals 2",
        () {
          final inputs = ["МисяченкоЯА", "МисяченкоЯА.", "МисяченкоЯ"];

          for (String input in inputs) {
            expect(
                  () => Trainer.parseSingle(input),
              throwsA(
                isA<InvalidDataType>().having(
                      (e) => e.message,
                  'message',
                  "Тренер(ы) '$input': неверный формат ФИО тренера, ожидается Фамилия И.О.",
                ),
              ),
            );
          }
        }
    );
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/participant/utils/belt.dart';

void main() {
  group("Belt.fromSheet", () {
    test("create ku belt from correct values throws no errors", () {
      final inputs = [
        "6 кю",
        "6 кю",
        "    6 кю",
        "6 кю      ",
        "    6 кю     ",
      ];
      final want = "6 кю";

      for (String input in inputs) {
        final got = Belt.withValidation(input);
        expect(got.toString(), want);
      }
    });

    test("create dan belt from correct values throws no errors", () {
      final inputs = [
        "10 дан",
        "10 дан",
        "    10 дан",
        "10 дан      ",
        "    10 дан     ",
      ];
      final want = "10 дан";

      for (String input in inputs) {
        final got = Belt.withValidation(input);
        expect(got.toString(), want);
      }
    });

    test("create belt from empty value throws no errors", () {
      final inputs = ["", "-", "               ", "    -     "];
      final want = "не указано";

      for (String input in inputs) {
        final got = Belt.withValidation(input);
        expect(got.toString(), want);
      }
    });

    test("create belt with invalid rank throws FormatException", () {
      final inputs = ["11 дан", "-1 кю"];

      for (String input in inputs) {
        expect(
          () => Belt.withValidation(input),
          throwsA(
            isA<FormatException>().having(
              (e) => e.message,
              'message',
              "Неверный формат разряда кю, дан: '$input'. Разряд должен быть указан в пределах от 1 до 10",
            ),
          ),
        );
      }
    });

    test("create belt with invalid beltType throws FormatException", () {
      final input = "5 пояс";

      expect(
        () => Belt.withValidation(input),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            "Неверный формат ранга участника: '$input'. Примеры '10 кю' или '2 дан'",
          ),
        ),
      );
    });

    test("create belt with invalid sheet data throws FormatException", () {
      final inputs = ["11", "кю", "11 кю дан"];

      for (String input in inputs) {
        expect(
              () => Belt.withValidation(input),
          throwsA(
            isA<FormatException>().having(
                  (e) => e.message,
              'message',
              "Неверный формат кю, дан: '$input'. Примеры '10 кю' или '2 дан'",
            ),
          ),
        );
      }
    });
  });
}

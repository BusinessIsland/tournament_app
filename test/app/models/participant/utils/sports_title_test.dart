import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/participant/utils/sports_title.dart';

void main() {
  group("SportsTitle.fromSheet", () {
    test("should always return correct sports title", () {
      final titles = [
        "1 юн.р.",
        "2 юн.р.",
        "3 юн.р.",
        "1 спорт.р.",
        "2 спорт.р.",
        "3 спорт.р.",
        "КМС",
        "МС",
        "ММС",
        "гроссмейстер",
        "не существует",
      ];

      final want = [
        "первый юношеский спортивный разряд",
        "второй юношеский спортивный разряд",
        "третий юношеский спортивный разряд",
        "первый спортивный разряд",
        "второй спортивный разряд",
        "третий спортивный разряд",
        "кандидат в мастера спорта",
        "мастер спорта России",
        "мастер спорта России международного класса",
        "гроссмейстер России",
        "не указано",
      ];

      for (int i = 0; i < titles.length; i++) {
        final got = SportsTitle.fromSheet(titles[i]);
        expect(got.toString(), want[i]);
      }
    });
  });
}
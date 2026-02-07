import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/judge_ranks/judge_ranks.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/judge_ranks/judge_ranks_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_qualification.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_ranks/adults/adult_ranks.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_ranks/adults/adult_ranks_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_ranks/youth/youth_ranks.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_ranks/youth/youth_ranks_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_titles/sports_title.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_titles/sports_title_parser.dart';

void main() {
  group("AdultRanks_Success", () {
    group("FirstAdultRank_Success", () {
      SportsQualification parseFirstAdultRank(String raw) {
        final parser = FirstAdultRankParser();
        return parser.parse(raw);
      }

      test("parse_RegExpInput_ReturnsSportsQualificationAsFirstAdultRank", () {
        final given = "1 спорт.р.";
        final got = parseFirstAdultRank(given);

        expect(got, isA<FirstAdultRank>());
      });

      test(
        "parse_RegExpInputWithWhitespaces_ReturnsSportsQualificationAsFirstAdultRank",
        () {
          final given = "   1   спорт.р.    ";
          final got = parseFirstAdultRank(given);

          expect(got, isA<FirstAdultRank>());
        },
      );

      test("toString_RegExpInput_ReturnsFirstAdultRankDescription", () {
        final given = "1 спорт.р.";
        final got = parseFirstAdultRank(given);

        expect(got.toString(), "первый спортивный разряд");
      });

      test("sortWeight_RegExpInput_Returns6", () {
        final given = "1 спорт.р.";
        final got = parseFirstAdultRank(given);

        expect(got.sortWeight, 9);
      });
    });

    group("SecondAdultRank_Success", () {
      SportsQualification parseSecondAdultRank(String raw) {
        final parser = SecondAdultRankParser();
        return parser.parse(raw);
      }

      test("parse_RegExpInput_ReturnsSportsQualificationAsSecondAdultRank", () {
        final given = "2 спорт.р.";
        final got = parseSecondAdultRank(given);

        expect(got, isA<SecondAdultRank>());
      });

      test(
        "parse_RegExpInputWithWhitespaces_ReturnsSportsQualificationAsSecondAdultRank",
        () {
          final given = "   2     спорт.р.        ";
          final got = parseSecondAdultRank(given);

          expect(got, isA<SecondAdultRank>());
        },
      );

      test("toString_RegExpInput_ReturnsSecondAdultRankDescription", () {
        final given = "2 спорт.р.";
        final got = parseSecondAdultRank(given);

        expect(got.toString(), "второй спортивный разряд");
      });

      test("sortWeight_RegExpInput_Returns5", () {
        final given = "2 спорт.р.";
        final got = parseSecondAdultRank(given);

        expect(got.sortWeight, 8);
      });
    });

    group("ThirdAdultRank_Success", () {
      SportsQualification parseThirdAdultRank(String raw) {
        final parser = ThirdAdultRankParser();
        return parser.parse(raw);
      }

      test("parse_RegExpInput_ReturnsSportsQualificationAsThirdAdultRank", () {
        final given = "3 спорт.р.";
        final got = parseThirdAdultRank(given);

        expect(got, isA<ThirdAdultRank>());
      });

      test(
        "parse_RegExpInputWithWhitespaces_ReturnsSportsQualificationAsThirdAdultRank",
        () {
          final given = "   3     спорт.р.        ";
          final got = parseThirdAdultRank(given);

          expect(got, isA<ThirdAdultRank>());
        },
      );

      test("toString_RegExpInput_ReturnsThirdAdultRankDescription", () {
        final given = "3 спорт.р.";
        final got = parseThirdAdultRank(given);

        expect(got.toString(), "третий спортивный разряд");
      });

      test("sortWeight_RegExpInput_Returns4", () {
        final given = "3 спорт.р.";
        final got = parseThirdAdultRank(given);

        expect(got.sortWeight, 7);
      });
    });
  });

  group("YouthRanks_Success", () {
    group("FirstYouthRank_Success", () {
      SportsQualification parseFirstYouthRank(String raw) {
        final parser = FirstYouthRankParser();
        return parser.parse(raw);
      }

      test("parse_RegExpInput_ReturnsSportsQualificationAsFirstYouthRank", () {
        final given = "1 юн.р.";
        final got = parseFirstYouthRank(given);

        expect(got, isA<FirstYouthRank>());
      });

      test(
        "parse_RegExpInputWithWhitespaces_ReturnsSportsQualificationAsFirstYouthRank",
        () {
          final given = "   1   юн.р.    ";
          final got = parseFirstYouthRank(given);

          expect(got, isA<FirstYouthRank>());
        },
      );

      test("toString_RegExpInput_ReturnsFirstYouthRankDescription", () {
        final given = "1 юн.р.";
        final got = parseFirstYouthRank(given);

        expect(got.toString(), "первый юношеский спортивный разряд");
      });

      test("sortWeight_RegExpInput_Returns3", () {
        final given = "1 юн.р.";
        final got = parseFirstYouthRank(given);

        expect(got.sortWeight, 6);
      });
    });

    group("SecondYouthRank_Success", () {
      SportsQualification parseSecondYouthRank(String raw) {
        final parser = SecondYouthRankParser();
        return parser.parse(raw);
      }

      test("parse_RegExpInput_ReturnsSportsQualificationAsSecondYouthRank", () {
        final given = "2 юн.р.";
        final got = parseSecondYouthRank(given);

        expect(got, isA<SecondYouthRank>());
      });

      test(
        "parse_RegExpInputWithWhitespaces_ReturnsSportsQualificationAsSecondYouthRank",
        () {
          final given = "   2     юн.р.        ";
          final got = parseSecondYouthRank(given);

          expect(got, isA<SecondYouthRank>());
        },
      );

      test("toString_RegExpInput_ReturnsSecondYouthRankDescription", () {
        final given = "2 юн.р.";
        final got = parseSecondYouthRank(given);

        expect(got.toString(), "второй юношеский спортивный разряд");
      });

      test("sortWeight_RegExpInput_Returns2", () {
        final given = "2 юн.р.";
        final got = parseSecondYouthRank(given);

        expect(got.sortWeight, 5);
      });
    });

    group("ThirdYouthRank_Success", () {
      SportsQualification parseThirdYouthRank(String raw) {
        final parser = ThirdYouthRankParser();
        return parser.parse(raw);
      }

      test("parse_RegExpInput_ReturnsSportsQualificationAsThirdYouthRank", () {
        final given = "3 юн.р.";
        final got = parseThirdYouthRank(given);

        expect(got, isA<ThirdYouthRank>());
      });

      test(
        "parse_RegExpInputWithWhitespaces_ReturnsSportsQualificationAsThirdYouthRank",
        () {
          final given = "   3     юн.р.        ";
          final got = parseThirdYouthRank(given);

          expect(got, isA<ThirdYouthRank>());
        },
      );

      test("toString_RegExpInput_ReturnsThirdYouthRankDescription", () {
        final given = "3 юн.р.";
        final got = parseThirdYouthRank(given);

        expect(got.toString(), "третий юношеский спортивный разряд");
      });

      test("sortWeight_RegExpInput_Returns1", () {
        final given = "3 юн.р.";
        final got = parseThirdYouthRank(given);

        expect(got.sortWeight, 4);
      });
    });
  });

  group("Titles_Success", () {
    group("Grandmaster_Success", () {
      SportsQualification parseGrandmaster(String raw) {
        final parser = GrandmasterRankParser();
        return parser.parse(raw);
      }

      test("parse_RegExpInput_ReturnsSportsQualificationAsGrandmaster", () {
        final given = "гр";
        final got = parseGrandmaster(given);

        expect(got, isA<Grandmaster>());
      });

      test(
        "parse_RegExpInputWithWhitespaces_ReturnsSportsQualificationAsGrandmaster",
        () {
          final given = " гр    ";
          final got = parseGrandmaster(given);

          expect(got, isA<Grandmaster>());
        },
      );

      test("toString_RegExpInput_ReturnsGrandmasterLabel", () {
        final given = "гр";
        final got = parseGrandmaster(given);

        expect(got.toString(), "гроссмейстер России");
      });

      test("sortWeight_RegExpInput_Returns13", () {
        final given = "гр";
        final got = parseGrandmaster(given);

        expect(got.sortWeight, 13);
      });
    });

    group("MasterOfSportsInternational_Success", () {
      SportsQualification parseMasterOfSportsInternational(String raw) {
        final parser = MasterOfSportsInternationalRankParser();
        return parser.parse(raw);
      }

      test("parse_RegExpInput_ReturnsSportsQualificationAsMasterOfSportsInternational", () {
        final given = "мсмк";
        final got = parseMasterOfSportsInternational(given);

        expect(got, isA<MasterOfSportsInternational>());
      });

      test("parse_RegExpInputWithWhitespaces_ReturnsSportsQualificationAsMasterOfSportsInternational", () {
        final given = " мсмк    ";
        final got = parseMasterOfSportsInternational(given);

        expect(got, isA<MasterOfSportsInternational>());
      });

      test("toString_RegExpInput_ReturnsMasterOfSportsInternationalLabel", () {
        final given = "мсмк";
        final got = parseMasterOfSportsInternational(given);

        expect(got.toString(), "мастер спорта России международного класса");
      });

      test("sortWeight_RegExpInput_Returns12", () {
        final given = "мсмк";
        final got = parseMasterOfSportsInternational(given);

        expect(got.sortWeight, 12);
      });
    });

    group("MasterOfSports_Success", () {
      SportsQualification parseMasterOfSports(String raw) {
        final parser = MasterOfSportsRankParser();
        return parser.parse(raw);
      }

      test("parse_RegExpInput_ReturnsSportsQualificationAsMasterOfSports", () {
        final given = "мс";
        final got = parseMasterOfSports(given);

        expect(got, isA<MasterOfSports>());
      });

      test("parse_RegExpInputWithWhitespaces_ReturnsSportsQualificationAsMasterOfSports", () {
        final given = " мс    ";
        final got = parseMasterOfSports(given);

        expect(got, isA<MasterOfSports>());
      });

      test("toString_RegExpInput_ReturnsMasterOfSportsLabel", () {
        final given = "мс";
        final got = parseMasterOfSports(given);

        expect(got.toString(), "мастер спорта России");
      });

      test("sortWeight_RegExpInput_Returns11", () {
        final given = "мс";
        final got = parseMasterOfSports(given);

        expect(got.sortWeight, 11);
      });
    });
  });

  group("JudgeRanks_Success", () {
    group("AllSportsJudge_Success", () {
      SportsQualification parseAllSportsJudge(String raw) {
        final parser = AllSportsJudgeRankParser();
        return parser.parse(raw);
      }

      test("parse_RegExpInput_ReturnsSportsQualificationAsAllSportsJudge", () {
        final given = "вк";
        final got = parseAllSportsJudge(given);

        expect(got, isA<AllSportsJudge>());
      });

      test(
        "parse_RegExpInputWithWhitespaces_ReturnsSportsQualificationAsAllSportsJudge",
            () {
          final given = " вк    ";
          final got = parseAllSportsJudge(given);

          expect(got, isA<AllSportsJudge>());
        },
      );

      test("toString_RegExpInput_ReturnsAllSportsJudgeLabel", () {
        final given = "вк";
        final got = parseAllSportsJudge(given);

        expect(got.toString(), "спортивный судья всероссийской категории");
      });

      test("sortWeight_RegExpInput_Returns5", () {
        final given = "вк";
        final got = parseAllSportsJudge(given);

        expect(got.sortWeight, 5);
      });
    });

    group("FirstCategoryJudge_Success", () {
      SportsQualification parseFirstCategoryJudge(String raw) {
        final parser = FirstCategoryJudgeRankParser();
        return parser.parse(raw);
      }

      test("parse_RegExpInput_ReturnsSportsQualificationAsFirstCategoryJudge", () {
        final given = "1к";
        final got = parseFirstCategoryJudge(given);

        expect(got, isA<FirstCategoryJudge>());
      });

      test("parse_RegExpInputWithWhitespaces_ReturnsSportsQualificationAsFirstCategoryJudge", () {
        final given = " 1  к    ";
        final got = parseFirstCategoryJudge(given);

        expect(got, isA<FirstCategoryJudge>());
      });

      test("toString_RegExpInput_ReturnsFirstCategoryJudgeLabel", () {
        final given = "1к";
        final got = parseFirstCategoryJudge(given);

        expect(got.toString(), "спортивный судья первой категории");
      });

      test("sortWeight_RegExpInput_Returns4", () {
        final given = "1к";
        final got = parseFirstCategoryJudge(given);

        expect(got.sortWeight, 4);
      });
    });

    group("SecondCategoryJudge_Success", () {
      SportsQualification parseSecondCategoryJudge(String raw) {
        final parser = SecondCategoryJudgeRankParser();
        return parser.parse(raw);
      }

      test("parse_RegExpInput_ReturnsSportsQualificationAsSecondCategoryJudge", () {
        final given = "2к";
        final got = parseSecondCategoryJudge(given);

        expect(got, isA<SecondCategoryJudge>());
      });

      test("parse_RegExpInputWithWhitespaces_ReturnsSportsQualificationAsSecondCategoryJudge", () {
        final given = " 2 к    ";
        final got = parseSecondCategoryJudge(given);

        expect(got, isA<SecondCategoryJudge>());
      });

      test("toString_RegExpInput_ReturnsSecondCategoryJudgeLabel", () {
        final given = "2к";
        final got = parseSecondCategoryJudge(given);

        expect(got.toString(), "спортивный судья второй категории");
      });

      test("sortWeight_RegExpInput_Returns3", () {
        final given = "2к";
        final got = parseSecondCategoryJudge(given);

        expect(got.sortWeight, 3);
      });
    });

    group("ThirdCategoryJudge_Success", () {
      SportsQualification parseThirdCategoryJudge(String raw) {
        final parser = ThirdCategoryJudgeRankParser();
        return parser.parse(raw);
      }

      test("parse_RegExpInput_ReturnsSportsQualificationAsThirdCategoryJudge", () {
        final given = "3к";
        final got = parseThirdCategoryJudge(given);

        expect(got, isA<ThirdCategoryJudge>());
      });

      test("parse_RegExpInputWithWhitespaces_ReturnsSportsQualificationAsThirdCategoryJudge", () {
        final given = " 3 к    ";
        final got = parseThirdCategoryJudge(given);

        expect(got, isA<ThirdCategoryJudge>());
      });

      test("toString_RegExpInput_ReturnsThirdCategoryJudgeLabel", () {
        final given = "3к";
        final got = parseThirdCategoryJudge(given);

        expect(got.toString(), "спортивный судья третьей категории");
      });

      test("sortWeight_RegExpInput_Returns2", () {
        final given = "3к";
        final got = parseThirdCategoryJudge(given);

        expect(got.sortWeight, 2);
      });
    });

    group("YouthCategoryJudge_Success", () {
      SportsQualification parseYouthCategoryJudge(String raw) {
        final parser = YouthCategoryJudgeRankParser();
        return parser.parse(raw);
      }

      test("parse_RegExpInput_ReturnsSportsQualificationAsYouthCategoryJudge", () {
        final given = "юс";
        final got = parseYouthCategoryJudge(given);

        expect(got, isA<YouthCategoryJudge>());
      });

      test("parse_RegExpInputWithWhitespaces_ReturnsSportsQualificationAsYouthCategoryJudge", () {
        final given = " ю с    ";
        final got = parseYouthCategoryJudge(given);

        expect(got, isA<YouthCategoryJudge>());
      });

      test("toString_RegExpInput_ReturnsYouthCategoryJudgeLabel", () {
        final given = "юс";
        final got = parseYouthCategoryJudge(given);

        expect(got.toString(), "юный спортивный судья");
      });

      test("sortWeight_RegExpInput_Returns1", () {
        final given = "юс";
        final got = parseYouthCategoryJudge(given);

        expect(got.sortWeight, 1);
      });
    });
  });
}

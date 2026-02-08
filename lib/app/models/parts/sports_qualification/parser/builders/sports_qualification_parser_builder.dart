import 'package:tournament_app/app/models/parts/sports_qualification/parser/adult_ranks_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/builders/i_sports_qualification_parser_builder.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/candidate_rank_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/judge_ranks_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/sports_qualification_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/sports_title_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/youth_ranks_parser.dart';

class SportsQualificationParserBuilder
    implements ISportsQualificationParserBuilder {
  SportsQualificationParser? _head;
  SportsQualificationParser? _tail;

  ISportsQualificationParserBuilder _addParser(
    SportsQualificationParser parser,
  ) {
    if (_head == null) {
      _head = _tail = parser;
    } else {
      _tail!.setNext(parser);
      _tail = parser;
    }

    return this;
  }

  @override
  ISportsQualificationParserBuilder addAllSportsCategoryJudgeParser() =>
      _addParser(AllSportsCategoryJudgeParser());

  @override
  ISportsQualificationParserBuilder addCandidateRankParser() =>
      _addParser(CandidateRankParser());

  @override
  ISportsQualificationParserBuilder addFirstAdultRankParser() =>
      _addParser(FirstAdultRankParser());

  @override
  ISportsQualificationParserBuilder addFirstCategoryJudgeParser() =>
      _addParser(FirstCategoryJudgeParser());

  @override
  ISportsQualificationParserBuilder addFirstYouthRankParser() =>
      _addParser(FirstYouthRankParser());

  @override
  ISportsQualificationParserBuilder addGrandmasterTitleParser() =>
      _addParser(GrandmasterTitleParser());

  @override
  ISportsQualificationParserBuilder
  addMasterOfSportsInternationalTitleParser() =>
      _addParser(MasterOfSportsInternationalTitleParser());

  @override
  ISportsQualificationParserBuilder addMasterOfSportsTitleParser() =>
      _addParser(MasterOfSportsTitleParser());

  @override
  ISportsQualificationParserBuilder addSecondAdultRankParser() =>
      _addParser(SecondAdultRankParser());

  @override
  ISportsQualificationParserBuilder addSecondCategoryJudgeParser() =>
      _addParser(SecondCategoryJudgeParser());

  @override
  ISportsQualificationParserBuilder addSecondYouthRankParser() =>
      _addParser(SecondYouthRankParser());

  @override
  ISportsQualificationParserBuilder addThirdAdultRankParser() =>
      _addParser(ThirdAdultRankParser());

  @override
  ISportsQualificationParserBuilder addThirdCategoryJudgeParser() =>
      _addParser(ThirdCategoryJudgeParser());

  @override
  ISportsQualificationParserBuilder addThirdYouthRankParser() =>
      _addParser(ThirdYouthRankParser());

  @override
  ISportsQualificationParserBuilder addYouthCategoryJudgeParser() =>
      _addParser(YouthCategoryJudgeParser());

  @override
  SportsQualificationParser build() {
    if (_head == null) throw Exception("не удалось получить парсер 'разряд, квалификация'");
    return _head!;
  }
}

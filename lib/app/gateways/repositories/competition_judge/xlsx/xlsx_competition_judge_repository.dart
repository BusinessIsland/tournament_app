import 'dart:io';
import 'package:tournament_app/app/dto/competition_judge/competition_judge_create_dto.dart';
import 'package:tournament_app/app/dto/competition_judge/competition_judge_update_dto.dart';
import 'package:tournament_app/app/gateways/repositories/competition_judge/competition_judge_repository.dart';
import 'package:tournament_app/app/gateways/repositories/persistence/file_persistable.dart';
import 'package:tournament_app/app/gateways/sheets/parsers/impl/xlsx_competition_judge_parser.dart';
import 'package:tournament_app/app/models/competition_judge/competition_judge.dart';
import 'package:tournament_app/app/models/competition_judge/competition_judge_list.dart';
import 'package:tournament_app/app/models/competition_judge/parser/competition_judge_parser.dart';

class XlsxCompetitionJudgeRepository
    implements CompetitionJudgeRepository, FilePersistable {
  CompetitionJudgeList _list = CompetitionJudgeListBasicImpl();
  final CompetitionJudgeParser parser;
  final XlsxCompetitionJudgeParser xlsxParser;

  XlsxCompetitionJudgeRepository({
    required this.parser,
    required this.xlsxParser,
  });

  @override
  CompetitionJudgeList getAll() {
    return _list;
  }

  @override
  CompetitionJudge? getById(String id) {
    return _list.findById(id);
  }

  @override
  CompetitionJudge create(CompetitionJudgeCreateDto dto) {
    final judge = parser.parse(
      dto.name,
      dto.belt,
      dto.sportsQualification,
      dto.region,
    );

    _list.add(judge);
    return judge;
  }

  @override
  CompetitionJudge update(CompetitionJudgeUpdateDto dto, String id) {
    final judge = parser.parse(
      dto.name,
      dto.belt,
      dto.sportsQualification,
      dto.region,
    );

    final found = _list.findById(id);
    if (found == null) {
      _list.add(judge);
    }
    {
      _list.replace(judge, id);
    }

    return judge;
  }

  @override
  void delete(String id) {
    _list.delete(id);
  }

  @override
  Future<void> loadFromFile(String filePath) async {
    final source = File(filePath);
    _list = xlsxParser.parse(source);
  }

  @override
  Future<void> saveToFile(String filePath) async {
    xlsxParser.save(filePath, _list);
  }
}

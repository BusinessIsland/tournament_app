import 'package:tournament_app/app/dto/competition_judge/competition_judge_create_dto.dart';
import 'package:tournament_app/app/dto/competition_judge/competition_judge_update_dto.dart';
import 'package:tournament_app/app/models/competition_judge/competition_judge.dart';
import 'package:tournament_app/app/models/competition_judge/competition_judge_list.dart';

abstract class ICompetitionJudgeRepository {
  CompetitionJudgeList getAll();
  CompetitionJudge? getById(String id);
  CompetitionJudge create(CompetitionJudgeCreateDto dto);
  CompetitionJudge update(CompetitionJudgeUpdateDto dto, String id);
  void delete(String id);
}
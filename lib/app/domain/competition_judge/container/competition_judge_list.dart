import 'package:tournament_app/app/domain/competition_judge/competition_judge.dart';
import 'package:tournament_app/app/domain/parts/id/id.dart';

abstract class CompetitionJudgeList extends Iterable<CompetitionJudge> {
  int get size;

  Iterable<CompetitionJudge> get container;

  CompetitionJudge? findById(Id id);

  void add(CompetitionJudge judge);

  bool replace(CompetitionJudge judge, Id id);

  void delete(Id id);
}

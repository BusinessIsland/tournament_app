import 'package:tournament_app/app/models/competition_judge/competition_judge.dart';
import 'package:tournament_app/app/models/parts/id/id.dart';

abstract class CompetitionJudgeList {
  int get size;

  void add(CompetitionJudge judge);

  CompetitionJudge? findById(Id id);

  void delete(Id id);
}

class CompetitionJudgeListBasicImpl extends CompetitionJudgeList {
  final List<CompetitionJudge> _list = List<CompetitionJudge>.empty(
    growable: true,
  );

  @override
  void add(CompetitionJudge judge) => _list.add(judge);

  @override
  CompetitionJudge? findById(Id id) {
    try {
      return _list.firstWhere((j) => j.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  void delete(Id id) => _list.removeWhere((j) => j.id == id);

  @override
  int get size => _list.length;
}

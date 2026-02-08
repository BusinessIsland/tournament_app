import 'package:tournament_app/app/models/competition_judge/competition_judge.dart';

abstract class CompetitionJudgeList extends Iterable<CompetitionJudge> {
  int get size;

  CompetitionJudge? findById(String id);

  void add(CompetitionJudge judge);

  void replace(CompetitionJudge judge, String id);

  void delete(String id);
}

class CompetitionJudgeListBasicImpl extends CompetitionJudgeList {
  final List<CompetitionJudge> _list = List<CompetitionJudge>.empty(
    growable: true,
  );

  @override
  void add(CompetitionJudge judge) => _list.add(judge);

  @override
  CompetitionJudge? findById(String id) {
    try {
      return _list.firstWhere((j) => j.id.toString() == id);
    } catch (_) {
      return null;
    }
  }

  @override
  void replace(CompetitionJudge judge, String id) {
    final index = _list.indexWhere((j) => j.id.toString() == id);
    if (index != -1) {
      _list[index] = judge;
    }
  }

  @override
  void delete(String id) => _list.removeWhere((j) => j.id.toString() == id);

  @override
  int get size => _list.length;

  @override
  Iterator<CompetitionJudge> get iterator => _list.iterator;
}

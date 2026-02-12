import 'package:collection/collection.dart';
import 'package:tournament_app/app/domain/competition_judge/competition_judge.dart';
import 'package:tournament_app/app/domain/competition_judge/container/competition_judge_list.dart';
import 'package:tournament_app/app/domain/parts/id/id.dart';

class CompetitionJudgeListBasicImpl extends CompetitionJudgeList {
  final List<CompetitionJudge> _list;

  CompetitionJudgeListBasicImpl(this._list);

  factory CompetitionJudgeListBasicImpl.fromIterable(
      Iterable<CompetitionJudge> list) {
    return CompetitionJudgeListBasicImpl(List.of(list));
  }

  @override
  void add(CompetitionJudge judge) {
    if (_list.any((j) => j.id == judge.id)) {
      throw ArgumentError("судья с id ${judge.id} уже существует");
    }

    _list.add(judge);
  }

  @override
  CompetitionJudge? findById(Id id) {
    return _list.firstWhereOrNull((j) => j.id == id);
  }

  @override
  bool replace(CompetitionJudge judge, Id id) {
    final index = _list.indexWhere((j) => j.id == id);

    if (index != -1) {
      _list[index] = judge;
      return true;
    }

    return false;
  }

  @override
  void delete(Id id) => _list.removeWhere((j) => j.id == id);

  @override
  int get size => _list.length;

  @override
  Iterator<CompetitionJudge> get iterator => _list.iterator;

  @override
  Iterable<CompetitionJudge> get container => List.unmodifiable(_list);
}

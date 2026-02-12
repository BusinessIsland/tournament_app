import 'package:collection/collection.dart';
import 'package:tournament_app/app/domain/parts/id/id.dart';
import 'package:tournament_app/app/domain/trainer/container/trainers_list.dart';
import 'package:tournament_app/app/domain/trainer/trainer.dart';

class TrainersListBasicImpl extends TrainersList {
  final List<Trainer> _list;

  TrainersListBasicImpl(this._list);

  factory TrainersListBasicImpl.fromIterable(Iterable<Trainer> list) {
    return TrainersListBasicImpl(List.of(list));
  }

  @override
  Trainer? findById(Id id) {
    return _list.firstWhereOrNull((t) => t.id == id);
  }

  @override
  void add(Trainer trainer) {
    if (_list.any((t) => t.id == trainer.id)) {
      throw ArgumentError("тренер с id ${trainer.id} уже существует");
    }

    _list.add(trainer);
  }

  @override
  bool replace(Trainer trainer, Id id) {
    final index = _list.indexWhere((t) => t.id == id);
    if (index != -1) {
      _list[index] = trainer;
      return true;
    }

    return false;
  }

  @override
  void delete(Id id) => _list.removeWhere((t) => t.id == id);

  @override
  int get size => _list.length;

  @override
  String toString() => _list.map((t) => t.toString()).join(", ");

  @override
  Iterator<Trainer> get iterator => _list.iterator;

  @override
  Iterable<Trainer> get container => List.unmodifiable(_list);
}

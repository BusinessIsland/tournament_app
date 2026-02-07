import 'package:tournament_app/app/models/parts/id/id.dart';
import 'package:tournament_app/app/models/trainer/trainer.dart';

abstract class TrainersList {
  int get size;
  void add(Trainer trainer);
  Trainer? findById(Id id);
  void delete(Id id);
}

class TrainersListBasicImpl extends TrainersList {
  final List<Trainer> _list = List<Trainer>.empty(growable: true);

  @override
  void add(Trainer trainer) => _list.add(trainer);

  @override
  Trainer? findById(Id id) {
    try {
      return _list.firstWhere((t) => t.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  void delete(Id id) => _list.removeWhere((t) => t.id == id);

  @override
  int get size => _list.length;

  @override
  String toString() => _list.map((t) => t.toString()).join(", ");
}
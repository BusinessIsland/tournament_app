import 'package:tournament_app/app/domain/parts/id/id.dart';
import 'package:tournament_app/app/domain/trainer/trainer.dart';

abstract class TrainersList extends Iterable<Trainer> {
  int get size;

  Trainer? findById(Id id);

  void add(Trainer trainer);

  bool replace(Trainer trainer, Id id);

  void delete(Id id);

  Iterable<Trainer> get container;
}



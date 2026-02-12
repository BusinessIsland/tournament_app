import 'package:tournament_app/app/domain/parts/id/id.dart';
import 'package:tournament_app/app/domain/parts/name/parser/person_name_pipeline.dart';
import 'package:tournament_app/app/domain/trainer/container/impl/trainers_list_basic_impl.dart';
import 'package:tournament_app/app/domain/trainer/container/trainers_list.dart';
import 'package:tournament_app/app/domain/trainer/trainer.dart';

class TrainerParser {
  final PersonNamePipeline pipeline;

  TrainerParser(this.pipeline);

  TrainersList parse(String? raw) {
    final list = TrainersListBasicImpl([]);

    if (raw == null || raw.trim().isEmpty) {
      return list;
    }

    final split = raw
        .trim()
        .split(",")
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();

    int id = 0;

    for (var s in split) {
      final name = pipeline.parse(s);
      if (name != null) {
        list.add(Trainer(id: Id.newId(id), name: name));
        id++;
      }
    }

    return list;
  }
}

import 'package:tournament_app/app/models/parts/id/id.dart';
import 'package:tournament_app/app/models/parts/name/parser/person_name_pipeline.dart';
import 'package:tournament_app/app/models/trainer/trainer.dart';
import 'package:tournament_app/app/models/trainer/trainers_list.dart';

class TrainerParser {
  final PersonNamePipeline pipeline;

  TrainerParser(this.pipeline);

  TrainersList parse(String? raw) {
    final list = TrainersListBasicImpl();

    if (raw == null || raw.trim().isEmpty) {
      return list;
    }

    final split = raw
        .trim()
        .split(",")
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();

    for (var s in split) {
      list.add(Trainer(id: Id(), name: pipeline.parse(s)));
    }

    return list;
  }
}


import 'package:tournament_app/app/models/participant/participant_category/labels_providers/participant_label_resolve_strategy.dart';

abstract class ParticipantLabelProvider {
  ParticipantLabelResolveStrategy maleStrategy;
  ParticipantLabelResolveStrategy femaleStrategy;

  ParticipantLabelProvider({
    required this.maleStrategy,
    required this.femaleStrategy,
  });

  String resolveLabelByAge({required int age, required bool isMale});
}

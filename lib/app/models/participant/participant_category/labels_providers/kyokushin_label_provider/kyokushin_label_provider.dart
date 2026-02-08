import 'package:tournament_app/app/models/participant/participant_category/labels_providers/participant_label_provider.dart';

class KyokushinLabelProvider extends ParticipantLabelProvider {
  KyokushinLabelProvider({
    required super.maleStrategy,
    required super.femaleStrategy,
  });

  @override
  String resolveLabelByAge({required int age, required bool isMale}) {
    return isMale
        ? maleStrategy.resolveLabel(age: age)
        : femaleStrategy.resolveLabel(age: age);
  }
}

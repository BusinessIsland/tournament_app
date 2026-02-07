import 'package:tournament_app/app/labels_providers/participant_label_provider.dart';

class KiokusinkayLabelProvider extends ParticipantLabelProvider {
  KiokusinkayLabelProvider({
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

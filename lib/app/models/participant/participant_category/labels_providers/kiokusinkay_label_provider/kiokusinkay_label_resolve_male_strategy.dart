import 'package:tournament_app/app/models/participant/participant_category/labels_providers/participant_label_resolve_strategy.dart';

class KiokusinkayLabelResolveMaleStrategy
    extends ParticipantLabelResolveStrategy {

  static const Map<int, String> _ageRanges = {
    10: "мальчики",
    12: "юноши",
    14: "юноши",
    16: "юниоры",
    18: "мужчины",
  };

  @override
  String resolveLabel({required int age}) {
    return _ageRanges.entries
        .lastWhere((e) => age >= e.key, orElse: () => const MapEntry(0, ""))
        .value;
  }
}

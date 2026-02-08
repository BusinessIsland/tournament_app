import 'package:tournament_app/app/models/participant/participant_category/labels_providers/participant_label_resolve_strategy.dart';

class KiokusinkayLabelResolveFemaleStrategy
    extends ParticipantLabelResolveStrategy {
  static const Map<int, String> _ageRanges = {
    10: "девочки",
    12: "девушки",
    14: "девушки",
    16: "юниорки",
    18: "женщины",
  };

  @override
  String resolveLabel({required int age}) {
    return _ageRanges.entries
        .lastWhere((e) => age >= e.key, orElse: () => const MapEntry(0, ""))
        .value;
  }
}

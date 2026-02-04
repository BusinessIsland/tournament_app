// Перечисление спортивных разрядов и званий
import 'package:tournament_app/app/models/participant/utils/sports_title_type.dart';

class SportsTitle {
  final SportsTitleType type;

  SportsTitle(this.type);

  factory SportsTitle.fromString(String? raw) {
    if (raw == null) {
      return SportsTitle(SportsTitleType.undefined);
    }

    final trimmed = raw.trim().toLowerCase();

    for (final type in SportsTitleType.values) {
      final aliases = type.aliases ?? [];
      if (aliases.contains(trimmed)) {
        return SportsTitle(type);
      }
    }
    
    return SportsTitle(SportsTitleType.undefined);
  }

  String get short => type.shortLabel;

  @override
  String toString() => type.label;
}

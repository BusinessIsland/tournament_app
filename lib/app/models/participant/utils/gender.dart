import 'package:tournament_app/app/models/participant/utils/gender_type.dart';

// пол участника
class Gender {
  final GenderType type;

  Gender(this.type);

  factory Gender.fromString(String? raw) {
    if (raw == null) {
      return Gender(GenderType.undefined);
    }

    final cleanRaw = raw.trim().toLowerCase();

    for (final type in GenderType.values) {
      final aliases = type.aliases ?? [];
      if (aliases.contains(cleanRaw)) return Gender(type);
    }

    return Gender(GenderType.undefined);
  }

  String get short => type.shortLabel;

  @override
  String toString() {
    return type.label;
  }
}

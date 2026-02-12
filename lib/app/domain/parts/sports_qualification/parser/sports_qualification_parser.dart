import 'package:tournament_app/app/domain/parts/sports_qualification/sports_qualification.dart';

class SportsQualificationParser {
  final List<SportsQualification> qualifications;

  const SportsQualificationParser({required this.qualifications});

  SportsQualification? parse(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return null;
    }

    final normalized = _normalize(raw);

    for (final qualification in qualifications) {
      for (final mask in qualification.masks) {
        final regexp = RegExp(mask, caseSensitive: false);

        if (regexp.hasMatch(normalized)) {
          return qualification;
        }
      }
    }

    return null;
  }

  String _normalize(String raw) =>
      raw.trim().toLowerCase().replaceAll(RegExp(r"\s+"), " ");
}

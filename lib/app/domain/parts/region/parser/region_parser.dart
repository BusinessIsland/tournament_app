import 'package:tournament_app/app/domain/parts/region/region.dart';

class RegionParser {
  Region? parse(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return null;
    }

    final prepared = _normalize(raw);
    return Region(label: prepared);
  }

  String _normalize(String raw) {
    return raw.trim().replaceAll(RegExp(r"\s+"), " ");
  }
}

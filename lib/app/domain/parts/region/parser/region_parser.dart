import 'package:tournament_app/app/models/parts/region/region.dart';

class RegionParser {
  Region parse(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return UndefinedRegion();
    }

    final prepared = _normalize(raw);
    return StandardRegion(prepared);
  }

  String _normalize(String raw) {
    return raw.trim().replaceAll(RegExp(r"\s+"), " ");
  }
}

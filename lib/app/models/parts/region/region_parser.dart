import 'package:tournament_app/app/models/parts/region/region.dart';


abstract class RegionParser {
  RegionParser? _next;

  RegionParser setNext(RegionParser nextParser) {
    _next = nextParser;
    return nextParser;
  }

  Region parse(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return _next?.parse(raw) ?? UndefinedRegion();
    }

    final result = concreteParse(raw.trim());
    if (result != null) return result;

    return _next?.parse(raw) ?? UndefinedRegion();
  }

  Region? concreteParse(String raw);
}

class StandardRegionParser extends RegionParser {
  Region? _tryParseRegion(String raw) {
    final replaced = raw.trim().replaceAll(RegExp(r"\s+"), " ");
    return StandardRegion(replaced);
  }

  @override
  Region? concreteParse(String raw) {
    var value = _tryParseRegion(raw);
    if (value != null) return value;

    return null;
  }
}


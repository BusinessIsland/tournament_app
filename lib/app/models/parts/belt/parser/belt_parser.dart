import 'package:tournament_app/app/models/parts/belt/belt.dart';
import 'package:tournament_app/app/models/parts/belt/parser/regexp/belt_regexp.dart';

abstract class BeltParser {
  BeltParser? _next;

  BeltParser setNext(BeltParser nextParser) {
    _next = nextParser;
    return nextParser;
  }

  Belt parse(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return _next?.parse(raw) ?? UndefinedBelt();
    }

    final result = concreteParse(raw.trim());
    if (result != null) return result;
    
    return _next?.parse(raw) ?? UndefinedBelt();
  }

  Belt? concreteParse(String raw);
}

class KuBeltParser extends BeltParser {
  Belt? _tryParseKuBelt(String raw) {
    final match = KuBeltRegexp.kuBelt.firstMatch(raw);
    return match == null
        ? null
        : KuBelt(rank: int.parse(match.namedGroup("rank")!));
  }

  @override
  Belt? concreteParse(String raw) {
    var value = _tryParseKuBelt(raw);
    if (value != null) return value;

    return null;
  }
}

class DanBeltParser extends BeltParser {
  Belt? _tryParseDanBelt(String raw) {
    final match = DanBeltRegexp.danBelt.firstMatch(raw);
    return match == null
        ? null
        : DanBelt(rank: int.parse(match.namedGroup("rank")!));
  }

  @override
  Belt? concreteParse(String raw) {
    var value = _tryParseDanBelt(raw);
    if (value != null) return value;

    return null;
  }
}

import 'package:tournament_app/app/domain/parts/block/block.dart';

class BlockParser {
  Block? parse(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return null;
    }

    final prepared = _normalize(raw);
    return Block(label: prepared);
  }

  String _normalize(String raw) {
    return raw.trim().replaceAll(RegExp(r"\s+"), " ");
  }
}

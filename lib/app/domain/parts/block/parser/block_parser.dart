import 'package:tournament_app/app/models/parts/block/block.dart';

class BlockParser {
  Block parse(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return UndefinedBlock();
    }

    final prepared = _normalize(raw);
    return StandardBlock(prepared);
  }

  String _normalize(String raw) {
    return raw.trim().replaceAll(RegExp(r"\s+"), " ");
  }
}

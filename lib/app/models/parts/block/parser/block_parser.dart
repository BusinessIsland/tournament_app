import 'package:tournament_app/app/models/parts/block/block.dart';

abstract class BlockParser {
  BlockParser? _next;

  BlockParser setNext(BlockParser nextParser) {
    _next = nextParser;
    return nextParser;
  }

  Block parse(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return _next?.parse(raw) ?? UndefinedBlock();
    }

    final prepared = raw.trim().replaceAll(RegExp(r"\s+"), " ");

    final result = concreteParse(prepared);
    if (result != null) return result;

    return _next?.parse(raw) ?? UndefinedBlock();
  }

  Block? concreteParse(String raw);
}

class StandardBlockParser extends BlockParser {
  Block? _tryParse(String raw) {
    return SimpleBlock(raw);
  }

  @override
  Block? concreteParse(String raw) {
    var value = _tryParse(raw);
    if (value != null) return value;

    return null;
  }
}
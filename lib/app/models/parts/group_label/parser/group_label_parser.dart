import 'package:tournament_app/app/models/parts/group_label/group_label.dart';

abstract class GroupLabelParser {
  GroupLabelParser? _next;

  GroupLabelParser setNext(GroupLabelParser nextParser) {
    _next = nextParser;
    return nextParser;
  }

  GroupLabel parse(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return _next?.parse(raw) ?? UndefinedGroupLabel();
    }

    final prepared = raw.trim().toLowerCase().replaceAll(RegExp(r"\s+"), " ");

    final result = concreteParse(prepared);
    if (result != null) return result;

    return _next?.parse(raw) ?? UndefinedGroupLabel();
  }

  GroupLabel? concreteParse(String raw);
}

class StandardGroupLabelParser extends GroupLabelParser {
  GroupLabel? _tryParseLabel(String raw) {
    return StandardGroupLabel(label: raw);
  }

  @override
  GroupLabel? concreteParse(String raw) {
    var value = _tryParseLabel(raw);
    if (value != null) return value;

    return null;
  }
}

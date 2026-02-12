import 'package:tournament_app/app/models/parts/group_label/group_label.dart';

class GroupLabelParser {
  GroupLabel parse(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return UndefinedGroupLabel();
    }

    final prepared = _normalize(raw);
    return StandardGroupLabel(label: prepared);
  }

  String _normalize(String raw) {
    return raw.trim().replaceAll(RegExp(r"\s+"), " ").toLowerCase();
  }
}

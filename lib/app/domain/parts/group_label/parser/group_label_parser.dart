import 'package:tournament_app/app/domain/parts/group_label/group_label.dart';

class GroupLabelParser {
  GroupLabel? parse(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return null;
    }

    final prepared = _normalize(raw);
    return StandardGroupLabel(label: prepared);
  }

  String _normalize(String raw) {
    return raw.trim().replaceAll(RegExp(r"\s+"), " ").toLowerCase();
  }
}

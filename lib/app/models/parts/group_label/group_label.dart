abstract class GroupLabel {
  final String label;

  const GroupLabel({required this.label});
}

class StandardGroupLabel extends GroupLabel {
  const StandardGroupLabel({required super.label});
}

class UndefinedGroupLabel extends GroupLabel {
  const UndefinedGroupLabel() : super(label: "не указано");
}
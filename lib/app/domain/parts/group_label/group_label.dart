sealed class GroupLabel {
  final String label;

  const GroupLabel({required this.label});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupLabel &&
          runtimeType == other.runtimeType &&
          label == other.label;

  @override
  int get hashCode => label.hashCode;

  @override
  String toString() {
    return 'GroupLabel{label: $label}';
  }
}

class StandardGroupLabel extends GroupLabel {
  const StandardGroupLabel({required super.label});
}

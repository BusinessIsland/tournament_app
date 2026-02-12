class DateOfBirth {
  final DateTime value;

  const DateOfBirth({required this.value});

  int ageAt(DateTime date) {
    if (date.isBefore(value)) {
      return 0;
    }

    int age = date.year - value.year;
    if (date.month < value.month ||
        (date.month == value.month && date.day < value.day)) {
      age--;
    }
    return age;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateOfBirth &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'DateOfBirth{value: $value}';
  }
}

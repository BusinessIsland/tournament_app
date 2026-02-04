import 'package:tournament_app/app/exceptions/invalid_data_type.dart';

class Weight {
  static const String _onEmptyMessage = "не указано";
  static const double _defaultValue = 0;
  final double value;

  Weight(this.value);

  factory Weight.fromString(String? raw) {
    if (raw == null) {
      return Weight(_defaultValue);
    }

    final prepared = raw.trim().replaceAll(",", ".");
    final parsed = double.tryParse(prepared);

    if (parsed == null) {
      return Weight(_defaultValue);
    }

    if (parsed <= 0) {
      return Weight(_defaultValue);
    }

    return Weight(parsed);
  }

  @override
  String toString() => value == _defaultValue ? _onEmptyMessage : value.toString();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Weight &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

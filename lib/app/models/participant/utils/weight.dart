import 'package:tournament_app/app/exceptions/invalid_data_type.dart';

class Weight {
  final double value;

  Weight(this.value);

  factory Weight.withValidation(String? raw) {
    if (raw == null) {
      throw InvalidDataType("Вес '$raw': вес участника обязателе для заполнения");
    }

    final prepared = raw.trim().replaceAll(",", ".");
    final weight = double.tryParse(prepared);

    if (weight == null) {
      throw InvalidDataType("Вес '$raw': вес участника не является вещественным числом");
    }

    if (weight <= 0) {
      throw InvalidDataType("Вес '$raw': вес участника должен быть положительным вещественным числом");
    }

    return Weight(weight);
  }

  @override
  String toString() {
    return 'Weight{value: $value}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Weight && runtimeType == other.runtimeType &&
              value == other.value;

  @override
  int get hashCode => value.hashCode;
}

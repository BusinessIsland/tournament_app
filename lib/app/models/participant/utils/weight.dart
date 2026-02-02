import 'package:tournament_app/app/exceptions/invalid_data_type.dart';

class Weight {
  double weight;

  Weight(this.weight);

  factory Weight.withValidation(String raw) {
    final weight = double.tryParse(raw);

    if (weight == null) {
      throw InvalidDataType("Вес '$raw' не является вещественным числом");
    }

    return Weight(weight);
  }
}

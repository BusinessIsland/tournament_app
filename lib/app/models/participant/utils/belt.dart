import 'package:tournament_app/app/exceptions/invalid_data_type.dart';

import 'belt_type.dart';

//сущность ранга участника, включает в себя тип ранга (кю, дан) и целое число - ранг
class Belt {
  final BeltType beltType;
  final int rank;

  Belt(this.beltType, this.rank);

  // фабричный метод для преобразования ранга участника из таблицы Excel в программную сущность
  factory Belt.withValidation(String raw) {
    final trimmed = raw.trim().toLowerCase();

    if (trimmed.isEmpty || trimmed == "-") {
      return Belt(BeltType.undefined, 0);
    }

    final parts = trimmed.split(" ").where((part) => part.isNotEmpty).toList();

    if (parts.length != 2) {
      throw InvalidDataType("Кю, дан '$raw': неверный формат, примеры '10 кю, 2 дан'");
    }

    final rank = int.tryParse(parts[0]);
    if (rank == null) {
      throw InvalidDataType("Кю, дан '$raw': разряд кю (дан) должен быть числом");
    }
    if (rank < 1 || rank > 10) {
      throw InvalidDataType("Кю, дан '$raw': разряд кю (дан) должен быть числом в пределах от 1 до 10 включительно");
    }

    final beltType = switch (parts[1]) {
      "кю" => BeltType.ku,
      "дан" => BeltType.dan,
      _ => BeltType.undefined,
    };

    return Belt(beltType, rank);
  }

  int get powerLevel {
    return switch(beltType) {
      BeltType.ku => -rank,
      BeltType.dan => rank,
      BeltType.undefined => -1000
    };
  }

  String get stringified =>
    beltType == BeltType.undefined ? beltType.label : "$rank ${beltType.label}";

  @override
  String toString() {
    return 'Belt{beltType: $beltType, rank: $rank}';
  }
}

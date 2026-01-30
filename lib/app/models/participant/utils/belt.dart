import 'belt_type.dart';

//сущность ранга участника, включает в себя тип ранга (кю, дан) и целое число - ранг
class Belt {
  final BeltType beltType;
  final int rank;

  Belt(this.beltType, this.rank);

  // фабричный метод для преобразования ранга участника из таблицы Excel в программную сущность
  factory Belt.fromSheet(String rawBelt) {
    final trimmed = rawBelt.trim();

    if (trimmed == "-" || trimmed == "") {
      return Belt(BeltType.undefined, 0);
    }

    final parts = trimmed.split(" ");

    if (parts.length != 2) {
      throw FormatException("Неверный формат кю, дан: '$rawBelt'. Примеры '10 кю' или '2 дан'");
    }

    int? rank = int.tryParse(parts[0]);
    if (rank == null) {
      throw FormatException("Неверный формат разряда кю, дан: '$rawBelt'. Примеры '10 кю' или '2 дан'");
    }

    if (rank > 10 || rank < 1) {
      throw FormatException("Неверный формат разряда кю, дан: '$rawBelt'. Разряд должен быть указан в пределах от 1 до 10");
    }
    
    final rawBeltType = parts[1];
    final BeltType beltType;

    switch (rawBeltType) {
      case "кю":
        beltType = BeltType.ku;
      case "дан":
        beltType = BeltType.dan;
      default:
        throw FormatException("Неверный формат ранга участника: '$rawBelt'. Примеры '10 кю' или '2 дан'");
    }

    return Belt(beltType, rank);
  }

  @override
  String toString() {
    final stringifiedBeltType = beltType.toString();

    if (beltType == BeltType.undefined) {
      return "$stringifiedBeltType";
    }

    return "$rank $stringifiedBeltType";
  }
}
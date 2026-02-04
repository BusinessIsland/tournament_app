import 'belt_type.dart';

//сущность ранга участника, включает в себя тип ранга (кю, дан) и целое число - ранг
class Belt {
  final BeltType beltType;
  final int? rank;

  Belt({required this.beltType, this.rank});

  // фабричный метод для преобразования ранга участника из таблицы Excel в программную сущность
  factory Belt.fromString(String? raw) {
    if (raw == null) {
      return Belt(beltType: BeltType.undefined);
    }

    final parts = raw
        .trim()
        .toLowerCase()
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .toList();

    if (parts.isEmpty) {
      return Belt(beltType: BeltType.undefined);
    }

    if (parts.length != 2) {
      return Belt(beltType: BeltType.undefined);
    }

    final rank = int.tryParse(parts[0]);
    if (rank == null) {
      return Belt(beltType: BeltType.undefined);
    }

    if (rank < 1 || rank > 10) {
      return Belt(beltType: BeltType.undefined);
    }

    return switch (parts[1]) {
      "кю" => Belt(beltType: BeltType.ku, rank: rank),
      "дан" => Belt(beltType: BeltType.dan, rank: rank),
      _ => Belt(beltType: BeltType.undefined),
    };
  }

  int get powerLevel {
    return switch (beltType) {
      BeltType.ku => -rank!,
      BeltType.dan => rank!,
      BeltType.undefined => -1000,
    };
  }

  @override
  String toString() => beltType == BeltType.undefined
      ? beltType.label
      : "$rank ${beltType.label}";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Belt &&
          runtimeType == other.runtimeType &&
          beltType == other.beltType &&
          rank == other.rank;

  @override
  int get hashCode => Object.hash(beltType, rank);
}

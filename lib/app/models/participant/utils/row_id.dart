import 'package:tournament_app/app/exceptions/invalid_data_type.dart';

class RowId {
  final int value;

  RowId(this.value);

  factory RowId.withValidation(String? raw) {
    if (raw == null) {
      return RowId(0);
    }

    final id = int.tryParse(raw, radix: 10);
    if (id == null) {
      throw InvalidDataType("№ п/п '$raw': порядковый номер не является числом");
    }

    if (id < 0) {
      throw InvalidDataType("№ п/п '$raw': порядковый номер должен быть целым неотрицательным числом");
    }

    return RowId(id);
  }

  @override
  String toString() {
    return 'RowId{value: $value}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is RowId && runtimeType == other.runtimeType &&
              value == other.value;

  @override
  int get hashCode => value.hashCode;
}
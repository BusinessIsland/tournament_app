import 'package:tournament_app/app/exceptions/invalid_data_type.dart';
import 'package:uuid/uuid.dart';

class Id {
  final String value;

  Id(this.value);

  factory Id.withValidation(String? raw) {
    final uuid = Uuid();

    if (raw == null) {
      return Id(uuid.v4());
    }

    if (!Uuid.isValidUUID(fromString: raw)) {
      throw InvalidDataType("Служебный идентификатор '$raw': не удалось распознать служебный идентификатор");
    }

    return Id(raw);
  }

  @override
  String toString() {
    return 'Id{id: $value}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Id && runtimeType == other.runtimeType &&
              value == other.value;

  @override
  int get hashCode => value.hashCode;
}

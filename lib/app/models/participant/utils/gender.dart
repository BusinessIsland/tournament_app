import 'package:tournament_app/app/exceptions/invalid_data_type.dart';

// пол участника
enum Gender {
  male("мужчина", "м", ["м", "М", "муж"]),
  female("женщина", "ж", ["ж", "Ж", "жен"]);

  final String label;
  final String shortLabel;
  final List<String> aliases;

  const Gender(this.label, this.shortLabel, this.aliases);

  // фабричный метод для конвертации строкового значения (из Excel) в перечисление
  factory Gender.withValidation(String raw) {
    final cleanRaw = raw.trim().toLowerCase();

    return Gender.values.firstWhere(
        (gender) => gender.aliases.contains(cleanRaw),
        orElse: () => throw InvalidDataType("Пол '$raw': указанное значение не допустимо"),
    );
  }

  @override
  String toString() {
    return label;
  }
}

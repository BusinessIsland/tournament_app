import 'package:tournament_app/app/exceptions/invalid_data_type.dart';

// сущность тренера
class Trainer {
  final String lastname;
  final String firstnameInitial;
  final String middlenameInitial;

  Trainer({
    required this.lastname,
    required this.firstnameInitial,
    required this.middlenameInitial,
  });

  // фабричный конструктор для создания тренера из таблицы (Excel-файла)
  // пример ФИО тренера: Пупкин В.А.
  factory Trainer.parseSingle(String raw) {
    final parts = raw
        .trim()
        .split(RegExp(r'\s+'))
        .where((s) => s.isNotEmpty)
        .toList();

    if (parts.length != 2) {
      throw InvalidDataType(
        "Тренер(ы) '$raw': неверный формат ФИО тренера, ожидается Фамилия И.О.",
      );
    }

    final lastname = _capitalize(parts[0]);

    final rawInitials = parts[1].replaceAll('.', ' ').trim();
    final initialsParts = rawInitials
        .split(RegExp(r'\s+'))
        .where((s) => s.isNotEmpty)
        .toList();

    if (initialsParts.isEmpty) {
      throw InvalidDataType(
        "Тренер(ы) '$raw': неверный формат ФИО тренера, ожидается Фамилия И.О.",
      );
    }

    return Trainer(
      lastname: lastname,
      firstnameInitial: initialsParts[0][0].toUpperCase(),
      middlenameInitial: initialsParts.length > 1
          ? initialsParts[1][0].toUpperCase()
          : '',
    );
  }

  static List<Trainer> parseList(String raw) {
    final rawNames = raw.split(RegExp(r'[;,/|\n]')).where((s) => s.trim().isNotEmpty);

    if (rawNames.isEmpty) {
      throw InvalidDataType("Тренер(ы) '$raw': список тренеров пуст");
    }

    return rawNames.map((name) => Trainer.parseSingle(name)).toList();
  }

  static String _capitalize(String s) =>
      s.isEmpty ? "" : s[0].toUpperCase() + s.substring(1).toLowerCase();

  @override
  String toString() {
    final m = middlenameInitial.isNotEmpty ? "$middlenameInitial." : "";
    return "$lastname $firstnameInitial.$m";
  }
}

extension TrainersStringifier on List<Trainer> {
  String stringify() => map((t) => t.toString()).join(", ");
}

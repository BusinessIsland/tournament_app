
// сущность тренера
class Trainer {
  String firstnameInitial;
  String lastname;
  String middlenameInitial;

  Trainer(this.firstnameInitial, this.lastname, this.middlenameInitial);

  // фабричный конструктор для создания тренера из таблицы (Excel-файла)
  // пример ФИО тренера: Пупкин В.А.
  factory Trainer.fromSheet(String rawFullname) {
    final parts = rawFullname.trim().split(" ");

    if (parts.length != 2) {
      throw FormatException("Неверный формат ФИО: '$rawFullname'. Ожидается 'Фамилия И.О.'");
    }

    final initialsPart = parts[1];

    final initials = initialsPart.split(".").where((s) => s.isNotEmpty).toList();

    if (initials.length != 2) {
      throw FormatException("Не удалось разобрать инициалы в: '$rawFullname'. Ожидается формат 'И.О.'");
    }

    final lastname = parts[0];
    final firstnameInitial = initials[0];
    final middlenameInitial = initials[1];

    return Trainer(firstnameInitial, lastname, middlenameInitial);
  }

  @override
  String toString() {
    return "$lastname $firstnameInitial.$middlenameInitial.";
  }
}
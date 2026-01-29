
// сущность тренера
class Trainer {
  String firstname;
  String lastname;
  String middlename;

  Trainer(this.firstname, this.lastname, this.middlename);

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
      throw FormatException("Не удалось разобрать инициалы в: '$initialsPart'. Ожидается формат 'И.О.'");
    }

    final lastname = parts[0];
    final firstname = initials[0];
    final middlename = initials[1];

    return Trainer(firstname, lastname, middlename);
  }
}
import 'package:tournament_app/app/exceptions/required_param.dart';
import 'package:tournament_app/app/utils/str_capitalizer.dart';

class Name {
  final String lastname;
  final String firstname;
  final String? middlename;

  Name({required this.lastname, required this.firstname, this.middlename});

  factory Name.fromString(String? raw) {
    if (raw == null) {
      throw RequiredParam("ФИО участника обязательно для заполнения");
    }

    final parts = raw
        .trim()
        .toLowerCase()
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .toList();

    if (parts.isEmpty) {
      throw RequiredParam("ФИО участника обязательно для заполнения");
    }

    if (parts.length < 2) {
      throw RequiredParam(
        "В ФИО участника должны быть указаны хотя бы фамилия и имя участника",
      );
    }

    return switch (parts.length) {
      2 => Name(
        lastname: StrCapitalizer.capitalize(parts[0]),
        firstname: StrCapitalizer.capitalize(parts[1]),
      ),
      3 => Name(
        lastname: StrCapitalizer.capitalize(parts[0]),
        firstname: StrCapitalizer.capitalize(parts[1]),
        middlename: StrCapitalizer.capitalize(parts[2]),
      ),
      _ => Name(
        lastname: StrCapitalizer.capitalize(parts[0]),
        firstname: StrCapitalizer.capitalize(parts[1]),
        middlename: parts.sublist(2).map(StrCapitalizer.capitalize).join(" "),
      ),
    };
  }

  String get shortName {
    String initial(String? s) => (s == null || s.isEmpty) ? '' : '${s[0]}.';

    return "$lastname ${initial(firstname)} ${initial(middlename)}"
        .trim()
        .replaceAll(RegExp(r'\s+'), ' ');
  }

  @override
  String toString() {
    return "$lastname $firstname ${middlename ?? ''}".trim().replaceAll(
      RegExp(r'\s+'),
      ' ',
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Name &&
          runtimeType == other.runtimeType &&
          lastname == other.lastname &&
          firstname == other.firstname &&
          middlename == other.middlename;

  @override
  int get hashCode => Object.hash(lastname, firstname, middlename);
}

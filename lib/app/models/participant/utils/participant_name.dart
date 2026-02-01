import 'package:tournament_app/app/exceptions/invalid_data_type.dart';

class ParticipantName {
  final String lastname;
  final String? firstname;
  final String? middlename;

  ParticipantName({required this.lastname, this.firstname, this.middlename});

  factory ParticipantName.withValidation(String fullname) {
    final parts = fullname
        .trim()
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .toList();

    if (parts.isEmpty) {
      throw InvalidDataType(
        "ФИО '$fullname': ФИО участника не должно быть пустым",
      );
    }

    return switch (parts.length) {
      1 => ParticipantName(lastname: _capitalize(parts[0])),
      2 => ParticipantName(
        lastname: _capitalize(parts[0]),
        firstname: _capitalize(parts[1]),
      ),
      3 => ParticipantName(
        lastname: _capitalize(parts[0]),
        firstname: _capitalize(parts[1]),
        middlename: _capitalize(parts[2]),
      ),
      _ => ParticipantName(
        lastname: _capitalize(parts[0]),
        firstname: _capitalize(parts[1]),
        middlename: parts.sublist(2).map(_capitalize).join(" "),
      ),
    };
  }

  static String _capitalize(String s) {
    return s.isEmpty ? "" : s[0].toUpperCase() + s.substring(1).toLowerCase();
  }

  String getShortName() {
    String initial(String? s) => (s == null || s.isEmpty) ? '' : '${s[0]}.';

    return "$lastname ${initial(firstname)} ${initial(middlename)}"
        .trim()
        .replaceAll(RegExp(r'\s+'), ' ');
  }

  String getFullName() {
    return "$lastname ${firstname ?? ''} ${middlename ?? ''}".trim().replaceAll(
      RegExp(r'\s+'),
      ' ',
    );
  }

  @override
  String toString() {
    return 'ParticipantName{lastname: $lastname, firstname: $firstname, middlename: $middlename}';
  }
}

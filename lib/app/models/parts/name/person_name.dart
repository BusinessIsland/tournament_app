sealed class PersonName {
  final String lastName;

  PersonName(this.lastName);

  String get formatted;

  String _sanitize(String s) => s.trim().replaceAll(RegExp(r'\s+'), ' ');
}

class FullName extends PersonName {
  final String firstName;
  final String middleName;

  FullName({
    required String lastName,
    required this.firstName,
    required this.middleName,
  }) : super(lastName);

  @override
  String get formatted => _sanitize("$lastName $firstName $middleName");
}

class NameWithInitials extends PersonName {
  final String firstNameInitial;
  final String middleNameInitial;

  NameWithInitials({
    required String lastName,
    required this.firstNameInitial,
    required this.middleNameInitial,
  }) : super(lastName);

  @override
  String get formatted {
    String f = firstNameInitial.isNotEmpty ? "$firstNameInitial." : "";
    String m = middleNameInitial.isNotEmpty ? "$middleNameInitial." : "";
    return _sanitize("$lastName $f$m");
  }
}

class ShortName extends PersonName {
  ShortName({required String lastName}) : super(lastName);

  @override
  String get formatted => _sanitize(lastName);
}

class UndefinedName extends PersonName {
  UndefinedName() : super("");

  @override
  String get formatted => "не указано";
}

sealed class PersonName {
  final String lastName;

  const PersonName({required this.lastName});

  String get formatted;

  String _sanitize(String s) => s.trim().replaceAll(RegExp(r'\s+'), ' ');

  String _capitalize(String s) {
    return s.isEmpty ? "" : s[0].toUpperCase() + s.substring(1).toLowerCase();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonName &&
          runtimeType == other.runtimeType &&
          formatted == other.formatted;

  @override
  int get hashCode => formatted.hashCode;
}

class FullName extends PersonName {
  final String firstName;
  final String middleName;

  const FullName({
    required super.lastName,
    required this.firstName,
    required this.middleName,
  });

  @override
  String get formatted {
    return _sanitize(
      "${_capitalize(lastName)} ${_capitalize(firstName)} ${_capitalize(middleName)}",
    );
  }
}

class NameWithInitials extends PersonName {
  final String firstNameInitial;
  final String middleNameInitial;

  NameWithInitials({
    required super.lastName,
    required this.firstNameInitial,
    required this.middleNameInitial,
  });

  @override
  String get formatted {
    String f = firstNameInitial.isNotEmpty ? "$firstNameInitial." : "";
    String m = middleNameInitial.isNotEmpty ? "$middleNameInitial." : "";

    return _sanitize(
      "${_capitalize(lastName)} ${_capitalize(f)}${_capitalize(m)}",
    );
  }
}

class ShortName extends PersonName {
  ShortName({required super.lastName});

  @override
  String get formatted {
    return _sanitize(_capitalize(lastName));
  }
}

class UndefinedName extends PersonName {
  static const instance = UndefinedName._();

  const UndefinedName._() : super(lastName: "");

  @override
  String get formatted => "не указано";
}

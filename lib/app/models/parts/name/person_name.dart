import 'package:tournament_app/app/utils/str_capitalizer.dart';

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
  String get formatted {
    final capitalizedFirstName = StrCapitalizer.capitalize(lastName);
    final capitalizedLastName = StrCapitalizer.capitalize(firstName);
    final capitalizedMiddleName = StrCapitalizer.capitalize(middleName);

    return _sanitize(
      "$capitalizedFirstName $capitalizedLastName $capitalizedMiddleName",
    );
  }
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
    String firstNameInitialWithDot = firstNameInitial.isNotEmpty
        ? "$firstNameInitial."
        : "";
    String middleNameInitialWithDot = middleNameInitial.isNotEmpty
        ? "$middleNameInitial."
        : "";

    final capitalizedLastName = StrCapitalizer.capitalize(lastName);

    final capitalizedFormattedFirstNameInitial = StrCapitalizer.capitalize(
      firstNameInitialWithDot,
    );

    final capitalizedFormattedMiddleNameInitial = StrCapitalizer.capitalize(
      middleNameInitialWithDot,
    );

    return _sanitize(
      "$capitalizedLastName ${capitalizedFormattedFirstNameInitial}${capitalizedFormattedMiddleNameInitial}",
    );
  }
}

class ShortName extends PersonName {
  ShortName({required String lastName}) : super(lastName);

  @override
  String get formatted {
    final capitalizedLastName = StrCapitalizer.capitalize(lastName);
    return _sanitize(capitalizedLastName);
  }
}

class UndefinedName extends PersonName {
  UndefinedName() : super("");

  @override
  String get formatted => "не указано";
}

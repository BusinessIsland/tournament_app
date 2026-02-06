sealed class PersonNameRegexp {}

class FullNameRegexp extends PersonNameRegexp {
  static final fullNameWithBothFirstNameAndMiddleName = RegExp(
    r'^(?<last>[А-ЯЁ][а-яё]*)\s+(?<first>[А-ЯЁ][а-яё]*)\s+(?<middle>[А-ЯЁ][а-яё]*)$',
  );

  static final fullNameWithFirstName = RegExp(
    r'^(?<last>[А-ЯЁ][а-яё]*)\s+(?<first>[А-ЯЁ][а-яё]*)$',
  );
}

class NameWithInitialsRegexp extends PersonNameRegexp {
  static final RegExp lastNameWithBothInitials = RegExp(
    r'^(?<last>[А-ЯЁ][а-яё]+)\s+(?<f>[А-ЯЁ])\.\s*(?<m>[А-ЯЁ])\.$',
  );

  static final RegExp lastNameWithFirstNameInitial = RegExp(
    r'^(?<last>[А-ЯЁ][а-яё]+)\s+(?<f>[А-ЯЁ])\.$',
  );
}

class ShortNameRegexp extends PersonNameRegexp {
  static final lastNameOnly = RegExp(r'^(?<last>[А-ЯЁ][а-яё]*)$');
}

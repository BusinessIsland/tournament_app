sealed class PersonNameRegexp {}

class FullNameRegexp extends PersonNameRegexp {
  static final fullNameWithBothFirstNameAndMiddleName = RegExp(
    r'^(?<last>[А-ЯЁа-яё]+)\s+(?<first>[А-ЯЁа-яё]+)\s+(?<middle>[А-ЯЁа-яё]+)$',
  );

  static final fullNameWithFirstName = RegExp(
    r'^(?<last>[А-ЯЁа-яё]+)\s+(?<first>[А-ЯЁа-яё]+)$',
  );
}

class NameWithInitialsRegexp extends PersonNameRegexp {
  static final RegExp lastNameWithBothInitials = RegExp(
    r'^(?<last>[А-ЯЁа-яё]+)\s+(?<f>[А-ЯЁа-яё])\.\s*(?<m>[А-ЯЁа-яё])\.$',
  );

  static final RegExp lastNameWithFirstNameInitial = RegExp(
    r'^(?<last>[А-ЯЁа-яё]+)\s+(?<f>[А-ЯЁа-яё])\.$',
  );
}

class ShortNameRegexp extends PersonNameRegexp {
  static final lastNameOnly = RegExp(r'^(?<last>[А-ЯЁа-яё]+)$');
}

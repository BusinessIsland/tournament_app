class NameWithInitialsPattern {
  static RegExp bothInitials = RegExp(
    r'^(?<last>[А-ЯЁа-яё]+)\s+(?<f>[А-ЯЁа-яё])\.\s*(?<m>[А-ЯЁа-яё])\.$',
    caseSensitive: false,
  );

  static RegExp firstNameInitialOnly = RegExp(
    r'^(?<last>[А-ЯЁа-яё]+)\s+(?<f>[А-ЯЁа-яё])\.$',
    caseSensitive: false,
  );
}

class ShortNamePattern {
  static RegExp lastNameOnly = RegExp(
    r'^(?<last>[А-ЯЁа-яё]+)$',
    caseSensitive: false,
  );
}

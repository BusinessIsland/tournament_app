class FullNamePattern {
  static RegExp bothNames = RegExp(
    r'^(?<last>[А-ЯЁа-яё]+)\s+(?<first>[А-ЯЁа-яё]+)\s+(?<middle>[А-ЯЁа-яё]+)$',
    caseSensitive: false,
  );

  static RegExp firstOnly = RegExp(
    r'^(?<last>[А-ЯЁа-яё]+)\s+(?<first>[А-ЯЁа-яё]+)$',
    caseSensitive: false,
  );
}

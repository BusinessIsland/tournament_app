class BelowAgeCategoryRegexp {
  static final RegExp belowAgeCategoryRegExp = RegExp(
    r"^(?<below>\d+)$",
    caseSensitive: false,
  );
}
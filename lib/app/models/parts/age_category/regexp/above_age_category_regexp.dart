class AboveAgeCategoryRegexp {
  static final RegExp aboveAgeCategoryRegExp = RegExp(
    r"^(?<above>\d+)$",
    caseSensitive: false,
  );
}
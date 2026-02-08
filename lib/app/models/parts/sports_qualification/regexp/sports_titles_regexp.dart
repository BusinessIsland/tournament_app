class GrandmasterTitleRegexp {
  static final RegExp grandmasterTitle = RegExp(
    r"^гроссмейстер|гр$",
    caseSensitive: false,
  );
}

class MasterOfSportsTitleRegexp {
  static final RegExp masterOfSportsTitle = RegExp(
    r"^мс$",
    caseSensitive: false,
  );
}

class MasterOfSportsInternationalTitleRegexp {
  static final RegExp masterOfSportsInternationalTitle = RegExp(
    r"^ммс|мсмк$",
    caseSensitive: false,
  );
}

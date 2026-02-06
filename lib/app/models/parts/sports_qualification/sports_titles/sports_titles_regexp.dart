class GrandmasterRankRegexp {
  static final RegExp grandmasterRank = RegExp(
    r"^гроссмейстер|гр$",
    caseSensitive: false,
  );
}

class MasterOfSportsRankRegexp {
  static final RegExp masterOfSportsRank = RegExp(
    r"^мс$",
    caseSensitive: false,
  );
}

class MasterOfSportsInternationalRankRegexp {
  static final RegExp masterOfSportsInternationalRank = RegExp(
    r"^ммс|мсмк$",
    caseSensitive: false,
  );
}

class FirstAdultRankRegexp {
  static final RegExp adultRank = RegExp(
    r"^1\s+(?<label>спорт\.р\.|ср|сп\.р\.)$",
    caseSensitive: false,
  );
}

class SecondAdultRankRegexp {
  static final RegExp adultRank = RegExp(
    r"^2\s+(?<label>спорт\.р\.|ср|сп\.р\.)$",
    caseSensitive: false,
  );
}

class ThirdAdultRankRegexp {
  static final RegExp adultRank = RegExp(
    r"^3\s+(?<label>спорт\.р\.|ср|сп\.р\.)$",
    caseSensitive: false,
  );
}

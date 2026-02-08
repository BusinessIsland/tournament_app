class FirstAdultRankRegexp {
  static final RegExp firstAdultRank = RegExp(
    r"^1\s+(?<label>спорт\.р\.|ср|сп\.р\.)$",
    caseSensitive: false,
  );
}

class SecondAdultRankRegexp {
  static final RegExp secondAdultRank = RegExp(
    r"^2\s+(?<label>спорт\.р\.|ср|сп\.р\.)$",
    caseSensitive: false,
  );
}

class ThirdAdultRankRegexp {
  static final RegExp thirdAdultRank = RegExp(
    r"^3\s+(?<label>спорт\.р\.|ср|сп\.р\.)$",
    caseSensitive: false,
  );
}

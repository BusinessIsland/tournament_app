class FirstYouthRankRegexp {
  static final RegExp firstYouthRank = RegExp(
    r"^1\s+(?<label>юнош\.р\.|юр|юн\.р\.)$",
    caseSensitive: false,
  );
}

class SecondYouthRankRegexp {
  static final RegExp secondYouthRank = RegExp(
    r"^2\s+(?<label>юнош\.р\.|юр|юн\.р\.)$",
    caseSensitive: false,
  );
}

class ThirdYouthRankRegexp {
  static final RegExp thirdYouthRank = RegExp(
    r"^3\s+(?<label>юнош\.р\.|юр|юн\.р\.)$",
    caseSensitive: false,
  );
}

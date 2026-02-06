class FirstYouthRankRegexp {
  static final RegExp youthRank = RegExp(
    r"^1\s+(?<label>юнош\.р\.|юр|юн\.р\.)$",
    caseSensitive: false,
  );
}

class SecondYouthRankRegexp {
  static final RegExp youthRank = RegExp(
    r"^2\s+(?<label>юнош\.р\.|юр|юн\.р\.)$",
    caseSensitive: false,
  );
}

class ThirdYouthRankRegexp {
  static final RegExp youthRank = RegExp(
    r"^3\s+(?<label>юнош\.р\.|юр|юн\.р\.)$",
    caseSensitive: false,
  );
}

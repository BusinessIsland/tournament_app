class ThirdYouthRankSportsQualificationPattern {
  static RegExp thirdYouthRank = RegExp(
    r"^3\s+(?<label>юнош\.р\.|юр|юн\.р\.)$",
    caseSensitive: false,
  );
}
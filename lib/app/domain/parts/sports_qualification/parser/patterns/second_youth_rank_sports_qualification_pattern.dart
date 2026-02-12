class SecondYouthRankSportsQualificationPattern {
  static final RegExp secondYouthRank = RegExp(
    r"^2\s+(?<label>юнош\.р\.|юр|юн\.р\.)$",
    caseSensitive: false,
  );
}
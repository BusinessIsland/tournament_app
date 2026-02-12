class FirstYouthRankSportsQualificationPattern {
  static RegExp firstYouthRank = RegExp(
    r"^1\s+(?<label>юнош\.р\.|юр|юн\.р\.)$",
    caseSensitive: false,
  );
}
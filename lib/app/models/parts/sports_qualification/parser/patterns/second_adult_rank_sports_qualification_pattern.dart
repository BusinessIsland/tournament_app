class SecondAdultRankSportsQualificationPattern {
  static RegExp secondAdultRank = RegExp(
    r"^2\s+(?<label>спорт\.р\.|ср|сп\.\s*р\.)$",
    caseSensitive: false,
  );
}

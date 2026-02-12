class FirstAdultRankSportsQualificationPattern {
  static RegExp firstAdultRank = RegExp(
    r"^1\s+(?<label>спорт\.р\.|ср|сп\.\s*р\.)$",
    caseSensitive: false,
  );
}

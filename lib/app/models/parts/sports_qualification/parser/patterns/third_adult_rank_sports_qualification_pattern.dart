class ThirdAdultRankSportsQualificationPattern {
  static RegExp thirdAdultRank = RegExp(
    r"^3\s+(?<label>спорт\.р\.|ср|сп\.\s*р\.)$",
    caseSensitive: false,
  );
}
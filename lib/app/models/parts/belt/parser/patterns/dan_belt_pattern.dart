class DanBeltPattern {
  static RegExp danBelt = RegExp(
    r"^(?<rank>10|[1-9])\s+(?<label>дан)$",
    caseSensitive: false,
  );
}

class KuBeltPattern {
  static RegExp kuBelt = RegExp(
    r"^(?<rank>10|[1-9])\s+(?<label>кю)$",
    caseSensitive: false,
  );
}

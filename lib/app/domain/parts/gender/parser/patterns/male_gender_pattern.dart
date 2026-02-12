class MaleGenderPattern {
  static RegExp male = RegExp(
    r"^(?<label>муж|мужч\.|м)$",
    caseSensitive: false,
  );
}

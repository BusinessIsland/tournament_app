class FemaleGenderPattern {
  static RegExp female = RegExp(
    r"^(?<label>жен|женщ\.|ж)$",
    caseSensitive: false,
  );
}

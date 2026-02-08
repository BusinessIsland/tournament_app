sealed class GenderRegexp {}

class MaleGenderRegexp extends GenderRegexp {
  static final RegExp maleRegexp = RegExp(
    r"^(?<label>муж|мужч\.|м)$"
  );
}

class FemaleGenderRegexp extends GenderRegexp {
  static final RegExp femaleRegexp = RegExp(
      r"^(?<label>жен|женщ\.|ж)$"
  );
}
sealed class Gender {
  Gender();

  String get shortLabel;
  String get label;
}

class MaleGender extends Gender {
  MaleGender() : super();

  @override
  String get shortLabel => "м";

  @override
  String get label => "мужской пол";
}

class FemaleGender extends Gender {
  FemaleGender() : super();

  @override
  String get shortLabel => "ж";

  @override
  String get label => "женский пол";
}

class UndefinedGender extends Gender {
  UndefinedGender() : super();

  @override
  String get shortLabel => "не указано";

  @override
  String get label => "не указано";
}
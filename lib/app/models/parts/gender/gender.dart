sealed class Gender {
  Gender();

  String get label;
}

class MaleGender extends Gender {
  MaleGender() : super();

  @override
  String get label => "м";
}

class FemaleGender extends Gender {
  FemaleGender() : super();

  @override
  String get label => "ж";
}

class UndefinedGender extends Gender {
  UndefinedGender() : super();

  @override
  String get label => "не указано";
}
sealed class AgeCategory {
  const AgeCategory();

  String get label;

  bool matches(int age);
}

class BelowAgeCategory extends AgeCategory {
  final int maxAge;

  const BelowAgeCategory({required this.maxAge});

  @override
  String get label => "$maxAge лет и младше";

  @override
  bool matches(int age) => maxAge >= age;
}

class AboveAgeCategory extends AgeCategory {
  final int minAge;

  const AboveAgeCategory({required this.minAge});

  @override
  String get label => "$minAge лет и старше";

  @override
  bool matches(int age) => minAge <= age;
}

class RangeAgeCategory extends AgeCategory {
  final int minAge;
  final int maxAge;

  const RangeAgeCategory({required this.minAge, required this.maxAge});

  @override
  String get label => "$minAge-$maxAge лет";

  @override
  bool matches(int age) => minAge <= age && age <= maxAge;
}

class AbsoluteAgeCategory extends AgeCategory {
  const AbsoluteAgeCategory();

  @override
  String get label => "абсолютная возрастная категория";

  @override
  bool matches(int age) => true;
}

class UndefinedAgeCategory extends AgeCategory {
  const UndefinedAgeCategory();

  @override
  String get label => "не распознана";

  @override
  bool matches(int age) => false;
}

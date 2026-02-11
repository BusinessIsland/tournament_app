sealed class WeightCategory {
  const WeightCategory();

  String get label;

  bool matches(double weight);
}

class BelowWeightCategory extends WeightCategory {
  final double maxWeight;

  const BelowWeightCategory({required this.maxWeight});

  @override
  String get label => "$maxWeight кг";

  @override
  bool matches(double weight) => weight <= maxWeight;
}

class AboveWeightCategory extends WeightCategory {
  final double minWeight;

  const AboveWeightCategory({required this.minWeight});

  @override
  String get label => "$minWeight+ кг";

  @override
  bool matches(double weight) => weight > minWeight;
}

class AbsoluteWeightCategory extends WeightCategory {
  const AbsoluteWeightCategory();

  @override
  String get label => "абсолютная";

  @override
  bool matches(double weight) => true;
}

class UndefinedWeightCategory extends WeightCategory {
  const UndefinedWeightCategory();

  @override
  String get label => "не указано";

  @override
  bool matches(double weight) => false;
}
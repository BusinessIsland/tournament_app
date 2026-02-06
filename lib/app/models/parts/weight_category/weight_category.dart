sealed class WeightCategory {
  final String label;
  const WeightCategory({required this.label});

  bool matches(double weight);
}

class UnderWeightCategory extends WeightCategory {
  final double limit;

  const UnderWeightCategory(this.limit) : super(label: "до $limit кг");

  @override
  bool matches(double weight) => weight <= limit;
}

class PlusWeightCategory extends WeightCategory {
  final double min;

  const PlusWeightCategory(this.min) : super(label: "$min+ кг");

  @override
  bool matches(double weight) => weight > min;
}

class AbsoluteWeightCategory extends WeightCategory {
  const AbsoluteWeightCategory() : super(label: "абсолютная");

  @override
  bool matches(double weight) => true;
}
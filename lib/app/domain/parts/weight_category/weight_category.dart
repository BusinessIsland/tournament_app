import 'package:tournament_app/app/domain/participant/participant.dart';

sealed class WeightCategory {
  const WeightCategory();

  static const double _minLowerBound = 0;
  static const double _maxUpperBound = double.maxFinite;

  String get label;

  double get lowerBound;

  double get upperBound;

  bool matchesParticipant(Participant p) {
    return _matches(p.weight.value);
  }

  bool _matches(double weight);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeightCategory &&
          runtimeType == other.runtimeType &&
          lowerBound == other.lowerBound &&
          upperBound == other.upperBound;

  @override
  int get hashCode => Object.hash(runtimeType, lowerBound, upperBound);

  @override
  String toString() {
    return 'WeightCategory{$label, $lowerBound-$upperBound}';
  }
}

class BelowWeightCategory extends WeightCategory {
  final double maxWeight;

  const BelowWeightCategory({required this.maxWeight});

  @override
  double get lowerBound {
    return WeightCategory._minLowerBound;
  }

  @override
  double get upperBound {
    return maxWeight;
  }

  @override
  String get label => "$maxWeight кг";

  @override
  bool _matches(double weight) {
    return weight <= maxWeight;
  }
}

class AboveWeightCategory extends WeightCategory {
  final double minWeight;

  const AboveWeightCategory({required this.minWeight});

  @override
  double get lowerBound {
    return minWeight;
  }

  @override
  double get upperBound {
    return WeightCategory._maxUpperBound;
  }

  @override
  String get label => "$minWeight+ кг";

  @override
  bool _matches(double weight) {
    return minWeight <= weight;
  }
}

class AbsoluteWeightCategory extends WeightCategory {
  static const instance = AbsoluteWeightCategory._();

  const AbsoluteWeightCategory._();

  @override
  double get lowerBound {
    return WeightCategory._minLowerBound;
  }

  @override
  double get upperBound {
    return WeightCategory._maxUpperBound;
  }

  @override
  String get label => "абсолютная";

  @override
  bool _matches(double weight) => true;
}

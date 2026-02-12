import 'package:tournament_app/app/domain/participant/participant.dart';

sealed class AgeCategory {
  const AgeCategory();

  static const int _minLowerBound = 0;
  static const int _maxUpperBound = -1 >>> 1;

  String get label;

  int get lowerBound;

  int get upperBound;

  bool matchesParticipant(Participant p, DateTime tournamentDate) {
    final age = p.ageAt(tournamentDate);
    return _matches(age);
  }

  bool _matches(int age);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AgeCategory &&
          runtimeType == other.runtimeType &&
          lowerBound == other.lowerBound &&
          upperBound == other.upperBound;

  @override
  int get hashCode => Object.hash(runtimeType, lowerBound, upperBound);

  @override
  String toString() {
    return 'AgeCategory($label, $lowerBound-$upperBound)';
  }
}

class BelowAgeCategory extends AgeCategory {
  final int maxAge;

  const BelowAgeCategory({required this.maxAge});

  @override
  int get lowerBound {
    return AgeCategory._minLowerBound;
  }

  @override
  int get upperBound {
    return maxAge;
  }

  @override
  String get label => "$maxAge лет и младше";

  @override
  bool _matches(int age) => age <= maxAge;
}

class AboveAgeCategory extends AgeCategory {
  final int minAge;

  const AboveAgeCategory({required this.minAge});

  @override
  int get lowerBound {
    return minAge;
  }

  @override
  int get upperBound {
    return AgeCategory._maxUpperBound;
  }

  @override
  String get label => "$minAge лет и старше";

  @override
  bool _matches(int age) => minAge <= age;
}

class RangeAgeCategory extends AgeCategory {
  final int minAge;
  final int maxAge;

  const RangeAgeCategory({required this.minAge, required this.maxAge});

  @override
  int get lowerBound {
    return minAge;
  }

  @override
  int get upperBound {
    return maxAge;
  }

  @override
  String get label => "$minAge-$maxAge лет";

  @override
  bool _matches(int age) => minAge <= age && age <= maxAge;
}

class AbsoluteAgeCategory extends AgeCategory {
  static const instance = AbsoluteAgeCategory._();

  const AbsoluteAgeCategory._();

  @override
  int get lowerBound {
    return AgeCategory._minLowerBound;
  }

  @override
  int get upperBound {
    return AgeCategory._maxUpperBound;
  }

  @override
  String get label => "абсолютная";

  @override
  bool _matches(int age) => true;
}

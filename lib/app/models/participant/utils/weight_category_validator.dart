import 'package:tournament_app/app/models/participant/utils/age_category.dart';
import 'package:tournament_app/app/models/participant/utils/gender.dart';
import 'package:tournament_app/app/models/participant/utils/weight_category.dart';

class WeightCategoryValidator {
  static final Map<AgeCategory, Map<Gender, List<WeightCategory>>> _matrix = {
    AgeCategory.u7: {
      Gender.male: [
        WeightCategory.u10,
        WeightCategory.u15,
        WeightCategory.u20,
        WeightCategory.u25,
        WeightCategory.u25g,
      ],
      Gender.female: [
        WeightCategory.u10,
        WeightCategory.u15,
        WeightCategory.u20,
        WeightCategory.u25,
        WeightCategory.u25g,
      ],
    },
    AgeCategory.u10: {
      Gender.male: [
        WeightCategory.u20,
        WeightCategory.u25,
        WeightCategory.u30,
        WeightCategory.u35,
        WeightCategory.u40,
        WeightCategory.u45,
        WeightCategory.u45g,
      ],
      Gender.female: [
        WeightCategory.u20,
        WeightCategory.u25,
        WeightCategory.u25g,
        WeightCategory.u30,
        WeightCategory.u35,
        WeightCategory.u40,
        WeightCategory.u45,
        WeightCategory.u45g,
      ],
    },
    AgeCategory.u12: {
      Gender.male: [
        WeightCategory.u30,
        WeightCategory.u35,
        WeightCategory.u40,
        WeightCategory.u45,
        WeightCategory.u50,
        WeightCategory.u55,
        WeightCategory.u55g,
      ],
      Gender.female: [
        WeightCategory.u30,
        WeightCategory.u35,
        WeightCategory.u40,
        WeightCategory.u45,
        WeightCategory.u50,
        WeightCategory.u55,
        WeightCategory.u55g,
      ],
    },
    AgeCategory.u14: {
      Gender.male: [
        WeightCategory.u35,
        WeightCategory.u40,
        WeightCategory.u45,
        WeightCategory.u50,
        WeightCategory.u55,
        WeightCategory.u55g,
      ],
      Gender.female: [
        WeightCategory.u40,
        WeightCategory.u45,
        WeightCategory.u50,
        WeightCategory.u55,
        WeightCategory.u55g,
      ],
    },
    AgeCategory.u16: {
      Gender.male: [
        WeightCategory.u40,
        WeightCategory.u45,
        WeightCategory.u50,
        WeightCategory.u55,
        WeightCategory.u60,
        WeightCategory.u65,
        WeightCategory.u65g,
      ],
      Gender.female: [
        WeightCategory.u45,
        WeightCategory.u50,
        WeightCategory.u55,
        WeightCategory.u60,
        WeightCategory.u60g,
      ],
    },
    AgeCategory.u18: {
      Gender.male: [
        WeightCategory.u55,
        WeightCategory.u60,
        WeightCategory.u65,
        WeightCategory.u70,
        WeightCategory.u75,
        WeightCategory.u75g,
      ],
      Gender.female: [
        WeightCategory.u50,
        WeightCategory.u55,
        WeightCategory.u60,
        WeightCategory.u60g,
      ],
    },
    AgeCategory.adult: {
      Gender.male: [
        WeightCategory.u70,
        WeightCategory.u80,
        WeightCategory.u80g,
        WeightCategory.u90,
        WeightCategory.u90g,
        WeightCategory.absolute,
      ],
      Gender.female: [
        WeightCategory.u60,
        WeightCategory.u65,
        WeightCategory.u60g,
        WeightCategory.u65g,
      ],
    },
  };

  static WeightCategory? findWeightCategory({
    required AgeCategory age,
    required Gender gender,
    required double weight,
  }) {
    final available = _matrix[age]?[gender];
    if (available == null) return null;

    final closedAvailable =
        available.where((c) => !c.isOpen && c.maxWeight != null).toList()
          ..sort((a, b) => a.maxWeight!.compareTo(b.maxWeight!));

    for (var cat in closedAvailable) {
      if (weight <= cat.maxWeight!) {
        return cat;
      }
    }

    final openAvailable = available.where((c) => c.isOpen).toList()
      ..sort((a, b) => (a.minWeight ?? 0).compareTo(b.minWeight ?? 0));

    for (var cat in openAvailable.reversed) {
      if (cat == WeightCategory.absolute) return cat;
      if (cat.minWeight != null && weight > cat.minWeight!) {
        return cat;
      }
    }

    return null;
  }
}

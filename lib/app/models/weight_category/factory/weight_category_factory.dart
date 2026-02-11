import 'package:tournament_app/app/models/weight_category/weight_category.dart';

class WeightCategoryFactory {
  static WeightCategory createAboveWeightCategory({required double minWeight}) {
    return AboveWeightCategory(minWeight: minWeight);
  }

  static WeightCategory createBelowWeightCategory({required double maxWeight}) {
    return BelowWeightCategory(maxWeight: maxWeight);
  }

  static WeightCategory createAbsoluteWeightCategory() {
    return AbsoluteWeightCategory();
  }
}
import 'package:tournament_app/app/models/parts/weight_category/weight_category.dart';

abstract class WeightCategoryParser {
  WeightCategoryParser? _next;

  WeightCategoryParser setNext(WeightCategoryParser nextParser) {
    _next = nextParser;
    return nextParser;
  }

  WeightCategory parse(String? rawMinWeight, String? rawMaxWeight) {
    if (rawMinWeight == null && rawMaxWeight == null) {
      return _next?.parse(rawMinWeight, rawMaxWeight) ??
          UndefinedWeightCategory();
    }

    var preparedRawMinWeight = "";
    var preparedRawMaxWeight = "";

    if (rawMinWeight != null) {
      preparedRawMinWeight =
          rawMinWeight.trim().toLowerCase().replaceAll(RegExp(r"\s+"), " ");
    }

    if (rawMaxWeight != null) {
      preparedRawMaxWeight = rawMaxWeight
          .trim().toLowerCase().replaceAll(RegExp(r"\s+"), " ");
    }

    final result = concreteParse(preparedRawMinWeight, preparedRawMaxWeight);
    if (result != null) return result;

    return _next?.parse(preparedRawMinWeight, preparedRawMaxWeight) ??
        UndefinedWeightCategory();
  }

  WeightCategory? concreteParse(String minWeight, String maxWeight);
}

class AboveWeightCategoryParser extends WeightCategoryParser {

}

class BelowWeightCategoryParser extends WeightCategoryParser {

}

class RangeWeightCategoryParser extends WeightCategoryParser {

}

class AbsoluteWeightCategoryParser extends WeightCategoryParser {

}


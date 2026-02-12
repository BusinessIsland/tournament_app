import 'package:tournament_app/app/models/parts/weight_category/weight_category.dart';

class WeightCategoryParser {
  WeightCategory parse(String? rawMinWeight, String? rawMaxWeight) {
    if (rawMinWeight == null && rawMaxWeight == null) {
      return AbsoluteWeightCategory();
    }

    var preparedMinWeight = rawMinWeight == null
        ? ""
        : _normalize(rawMinWeight);
    var preparedMaxWeight = rawMaxWeight == null
        ? ""
        : _normalize(rawMaxWeight);

    var parsedMinWeight = _tryParse(preparedMinWeight);
    var parsedMaxWeight = _tryParse(preparedMaxWeight);

    if (parsedMinWeight == null && parsedMaxWeight != null) {
      return BelowWeightCategory(maxWeight: parsedMaxWeight);
    }

    if (parsedMinWeight != null && parsedMaxWeight == null) {
      return AboveWeightCategory(minWeight: parsedMinWeight);
    }

    if (parsedMinWeight != null && parsedMaxWeight != null) {
      return AbsoluteWeightCategory();
    }

    return UndefinedWeightCategory();
  }

  String _normalize(String raw) {
    return raw
        .trim()
        .replaceAll(RegExp(r"\s+"), " ")
        .replaceAll(RegExp(r","), ".")
        .toLowerCase();
  }

  double? _tryParse(String raw) {
    final parsed = double.tryParse(raw);
    if (parsed == null) return null;
    if (parsed <= 0) return null;
    return parsed;
  }
}

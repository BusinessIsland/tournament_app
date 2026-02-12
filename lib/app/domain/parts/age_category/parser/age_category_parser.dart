import 'package:tournament_app/app/domain/parts/age_category/age_category.dart';

class AgeCategoryParser {
  AgeCategory? parse(String? rawMinAge, String? rawMaxAge) {
    if (rawMinAge == null && rawMaxAge == null) {
      return AbsoluteAgeCategory.instance;
    }

    final preparedMinAge = rawMinAge == null ? "" : _normalize(rawMinAge);
    final preparedMaxAge = rawMaxAge == null ? "" : _normalize(rawMaxAge);

    final parsedMinAge = _tryParse(preparedMinAge);
    final parsedMaxAge = _tryParse(preparedMaxAge);

    if (parsedMinAge == null && parsedMaxAge != null) {
      return BelowAgeCategory(maxAge: parsedMaxAge);
    }

    if (parsedMinAge != null && parsedMaxAge == null) {
      return AboveAgeCategory(minAge: parsedMinAge);
    }

    if (parsedMinAge != null && parsedMaxAge != null) {
      if (parsedMinAge <= parsedMaxAge) {
        return RangeAgeCategory(minAge: parsedMinAge, maxAge: parsedMaxAge);
      }

      throw ArgumentError(
          "минимальный вес не может быть больше максимального веса");
    }

    return null;
  }

  String _normalize(String raw) {
    return raw.trim().replaceAll(RegExp(r"\s+"), " ").toLowerCase();
  }

  int? _tryParse(String raw) {
    return int.tryParse(raw, radix: 10);
  }
}

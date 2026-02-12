import 'package:tournament_app/app/models/parts/age_category/age_category.dart';

class AgeCategoryParser {
  AgeCategory parse(String? rawMinAge, String? rawMaxAge) {
    if (rawMinAge == null && rawMaxAge == null) {
      return AbsoluteAgeCategory();
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
      return RangeAgeCategory(minAge: parsedMinAge, maxAge: parsedMaxAge);
    }

    return UndefinedAgeCategory();
  }

  String _normalize(String raw) {
    return raw.trim().replaceAll(RegExp(r"\s+"), " ").toLowerCase();
  }

  int? _tryParse(String raw) {
    return int.tryParse(raw, radix: 10);
  }
}
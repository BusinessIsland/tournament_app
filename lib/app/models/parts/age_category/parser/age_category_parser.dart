import 'package:tournament_app/app/models/parts/age_category/age_category.dart';
import 'package:tournament_app/app/models/parts/age_category/regexp/above_age_category_regexp.dart';
import 'package:tournament_app/app/models/parts/age_category/regexp/below_age_category_regexp.dart';

abstract class AgeCategoryParser {
  AgeCategoryParser? _next;

  AgeCategoryParser setNext(AgeCategoryParser nextParser) {
    _next = nextParser;
    return nextParser;
  }

  AgeCategory parse(String? rawMinAge, String? rawMaxAge) {
    if (rawMinAge == null && rawMaxAge == null) {
      return _next?.parse(rawMinAge, rawMaxAge) ?? AbsoluteAgeCategory();
    }

    var preparedRawMinAge = "";
    var preparedRawMaxAge = "";

    if (rawMinAge != null) {
      preparedRawMinAge = rawMinAge.trim().toLowerCase().replaceAll(
        RegExp(r"\s+"),
        " ",
      );
    }

    if (rawMaxAge != null) {
      preparedRawMaxAge = rawMaxAge.trim().toLowerCase().replaceAll(
        RegExp(r"\s+"),
        " ",
      );
    }

    final result = concreteParse(preparedRawMinAge, preparedRawMaxAge);
    if (result != null) return result;

    return _next?.parse(preparedRawMinAge, preparedRawMaxAge) ??
        UndefinedAgeCategory();
  }

  AgeCategory? concreteParse(String minAge, String maxAge);
}

class AboveAgeCategoryParser extends AgeCategoryParser {
  AgeCategory? _tryParseAboveAgeCategory(String minAge, String maxAge) {
    final minAgeGroup = AboveAgeCategoryRegexp.aboveAgeCategoryRegExp
        .firstMatch(minAge);
    final maxAgeGroup = BelowAgeCategoryRegexp.belowAgeCategoryRegExp
        .firstMatch(maxAge);

    if (minAgeGroup != null && maxAgeGroup == null) {
      return AboveAgeCategory(
        minAge: int.parse(minAgeGroup.namedGroup("above")!, radix: 10),
      );
    }

    return null;
  }

  @override
  AgeCategory? concreteParse(String minAge, String maxAge) {
    final value = _tryParseAboveAgeCategory(minAge, maxAge);

    if (value != null) return value;
    return null;
  }
}

class BelowAgeCategoryParser extends AgeCategoryParser {
  AgeCategory? _tryParseBelowAgeCategory(String minAge, String maxAge) {
    final minAgeGroup = AboveAgeCategoryRegexp.aboveAgeCategoryRegExp
        .firstMatch(minAge);
    final maxAgeGroup = BelowAgeCategoryRegexp.belowAgeCategoryRegExp
        .firstMatch(maxAge);

    if (minAgeGroup == null && maxAgeGroup != null) {
      return BelowAgeCategory(
        maxAge: int.parse(maxAgeGroup.namedGroup("below")!, radix: 10),
      );
    }

    return null;
  }

  @override
  AgeCategory? concreteParse(String minAge, String maxAge) {
    final value = _tryParseBelowAgeCategory(minAge, maxAge);

    if (value != null) return value;
    return null;
  }
}

class RangeAgeCategoryParser extends AgeCategoryParser {
  AgeCategory? _tryParseRangeAgeCategory(String minAge, String maxAge) {
    final minAgeGroup = AboveAgeCategoryRegexp.aboveAgeCategoryRegExp
        .firstMatch(minAge);
    final maxAgeGroup = BelowAgeCategoryRegexp.belowAgeCategoryRegExp
        .firstMatch(maxAge);

    if (minAgeGroup != null && maxAgeGroup != null) {
      return RangeAgeCategory(
        minAge: int.parse(minAgeGroup.namedGroup("above")!, radix: 10),
        maxAge: int.parse(maxAgeGroup.namedGroup("below")!, radix: 10),
      );
    }

    return null;
  }

  @override
  AgeCategory? concreteParse(String minAge, String maxAge) {
    final value = _tryParseRangeAgeCategory(minAge, maxAge);

    if (value != null) return value;
    return null;
  }
}

class AbsoluteAgeCategoryParser extends AgeCategoryParser {
  AgeCategory? _tryParseAbsoluteAgeCategory(String minAge, String maxAge) {
    final minAgeGroup = AboveAgeCategoryRegexp.aboveAgeCategoryRegExp
        .firstMatch(minAge);
    final maxAgeGroup = BelowAgeCategoryRegexp.belowAgeCategoryRegExp
        .firstMatch(maxAge);

    if (minAgeGroup == null && maxAgeGroup == null) {
      return AbsoluteAgeCategory();
    }

    return null;
  }

  @override
  AgeCategory? concreteParse(String minAge, String maxAge) {
    final value = _tryParseAbsoluteAgeCategory(minAge, maxAge);

    if (value != null) return value;
    return null;
  }
}

import 'package:tournament_app/app/models/parts/gender/gender.dart';
import 'package:tournament_app/app/models/parts/gender/gender_regexp.dart';

abstract class GenderParser {
  GenderParser? _next;

  GenderParser setNext(GenderParser nextParser) {
    _next = nextParser;
    return nextParser;
  }

  Gender parse(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return _next?.parse(raw) ?? UndefinedGender();
    }

    final result = concreteParse(raw.trim());
    if (result != null) return result;

    return _next?.parse(raw) ?? UndefinedGender();
  }

  Gender? concreteParse(String raw);
}

class MaleGenderParser extends GenderParser {
  Gender? _tryParseMaleGender(String raw) {
    final match = MaleGenderRegexp.maleRegexp.firstMatch(raw);

    return match == null
        ? null
        : MaleGender();
  }

  @override
  Gender? concreteParse(String raw) {
    var value = _tryParseMaleGender(raw);
    if (value != null) return value;

    return null;
  }
}

class FemaleGenderParser extends GenderParser {
  Gender? _tryParseFemaleGender(String raw) {
    final match = FemaleGenderRegexp.femaleRegexp.firstMatch(raw);
    return match == null
        ? null
        : FemaleGender();
  }

  @override
  Gender? concreteParse(String raw) {
    var value = _tryParseFemaleGender(raw);
    if (value != null) return value;

    return null;
  }
}
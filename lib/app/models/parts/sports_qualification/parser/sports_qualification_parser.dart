import 'package:tournament_app/app/models/parts/sports_qualification/sports_qualification.dart';

abstract class SportsQualificationParser {
  SportsQualificationParser? _next;

  SportsQualificationParser setNext(SportsQualificationParser nextParser) {
    _next = nextParser;
    return nextParser;
  }

  SportsQualification parse(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return _next?.parse(raw) ?? UndefinedSportsQualification();
    }

    final prepared = raw.trim().toLowerCase().replaceAll(RegExp(r"\s+"), " ");
    
    final result = concreteParse(prepared);
    if (result != null) return result;

    return _next?.parse(raw) ?? UndefinedSportsQualification();
  }

  SportsQualification? concreteParse(String raw);
}
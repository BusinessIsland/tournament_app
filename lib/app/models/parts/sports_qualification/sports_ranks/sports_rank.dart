import 'package:tournament_app/app/models/parts/sports_qualification/sports_qualification.dart';

sealed class SportsRank extends SportsQualification {
  SportsRank(String label, int sortWeight) : super(label: label, sortWeight: sortWeight);
}

class CandidateMaster extends SportsRank {
  CandidateMaster() : super("кандидат в мастера спорта", 10);
}

abstract class AdultRank extends SportsRank {
  AdultRank(super.adultLabel, super.rank);
}

abstract class YouthRank extends SportsRank {
  YouthRank(super.youthLabel, super.rank);
}

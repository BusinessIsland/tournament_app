import 'package:tournament_app/app/models/parts/sports_qualification/sports_qualification.dart';

sealed class SportsRank extends SportsQualification {
  SportsRank(String label, int weight) : super(label: label, weight: weight);
}

class CandidateMaster extends SportsRank {
  CandidateMaster() : super("Кандидат в мастера спорта", 10);
}

abstract class AdultRank extends SportsRank {
  AdultRank(String adultLabel, int rank) : super(adultLabel, 10 - rank);
}

abstract class YouthRank extends SportsRank {
  YouthRank(String youthLabel, int rank) : super(youthLabel, 6 - rank);
}

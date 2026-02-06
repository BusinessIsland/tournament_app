import 'package:tournament_app/app/models/parts/sports_qualification/sports_ranks/sports_rank.dart';

class FirstAdultRank extends AdultRank {
  static final String adultLabel = "первый спортивный разряд";
  static final int rank = 1;

  FirstAdultRank() : super(adultLabel, rank);
}

class SecondAdultRank extends AdultRank {
  static final String youthLabel = "второй спортивный разряд";
  static final int rank = 2;

  SecondAdultRank() : super(youthLabel, rank);
}

class ThirdAdultRank extends AdultRank {
  static final String youthLabel = "третий спортивный разряд";
  static final int rank = 3;

  ThirdAdultRank() : super(youthLabel, rank);
}
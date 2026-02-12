import 'package:tournament_app/app/models/parts/sports_qualification/sports_ranks/sports_rank.dart';

class FirstAdultRank extends AdultRank {
  static final String adultLabel = "первый спортивный разряд";
  static final int rank = 9;

  FirstAdultRank() : super(adultLabel, rank);
}

class SecondAdultRank extends AdultRank {
  static final String adultLabel = "второй спортивный разряд";
  static final int rank = 8;

  SecondAdultRank() : super(adultLabel, rank);
}

class ThirdAdultRank extends AdultRank {
  static final String adultLabel = "третий спортивный разряд";
  static final int rank = 7;

  ThirdAdultRank() : super(adultLabel, rank);
}
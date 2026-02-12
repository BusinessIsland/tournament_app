import 'package:tournament_app/app/models/parts/sports_qualification/sports_ranks/sports_rank.dart';

class FirstYouthRank extends YouthRank {
  static final String youthLabel = "первый юношеский спортивный разряд";
  static final int rank = 6;

  FirstYouthRank() : super(youthLabel, rank);
}

class SecondYouthRank extends YouthRank {
  static final String youthLabel = "второй юношеский спортивный разряд";
  static final int rank = 5;

  SecondYouthRank() : super(youthLabel, rank);
}

class ThirdYouthRank extends YouthRank {
  static final String youthLabel = "третий юношеский спортивный разряд";
  static final int rank = 4;

  ThirdYouthRank() : super(youthLabel, rank);
}

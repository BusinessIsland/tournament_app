import 'package:tournament_app/app/models/parts/sports_qualification/sports_qualification.dart';

sealed class JudgeRanks extends SportsQualification {
  JudgeRanks(String label, int sortWeight)
    : super(label: label, sortWeight: sortWeight);
}

class AllSportsJudge extends JudgeRanks {
  AllSportsJudge() : super("спортивный судья всероссийской категории", 5);
}

class FirstCategoryJudge extends JudgeRanks {
  FirstCategoryJudge() : super("спортивный судья первой категории", 4);
}

class SecondCategoryJudge extends JudgeRanks {
  SecondCategoryJudge() : super("спортивный судья второй категории", 3);
}

class ThirdCategoryJudge extends JudgeRanks {
  ThirdCategoryJudge() : super("спортивный судья третьей категории", 2);
}

class YouthCategoryJudge extends JudgeRanks {
  YouthCategoryJudge() : super("юный спортивный судья", 1);
}

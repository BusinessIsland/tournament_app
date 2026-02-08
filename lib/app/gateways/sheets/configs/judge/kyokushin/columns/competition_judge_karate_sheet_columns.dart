import 'package:tournament_app/app/gateways/sheets/configs/judge/kyokushin/fields/competition_judge_field.dart';

class CompetitionJudgeKarateSheetColumns {
  static const Map<CompetitionJudgeField, int> standardJudge = {
    CompetitionJudgeField.number: 0,
    CompetitionJudgeField.name: 1,
    CompetitionJudgeField.belt: 2,
    CompetitionJudgeField.sportsQualification: 3,
    CompetitionJudgeField.region: 4,
  };
}

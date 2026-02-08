import 'package:tournament_app/app/gateways/sheets/configs/judge/kyokushin/fields/competition_judge_field.dart';

class CompetitionJudgeKarateSheetHeaders {
  static const Map<CompetitionJudgeField, String> standardJudge = {
    CompetitionJudgeField.number: "№ п/п",
    CompetitionJudgeField.name: "ФИО",
    CompetitionJudgeField.belt: "Кю, дан",
    CompetitionJudgeField.sportsQualification: "Судейская категория",
    CompetitionJudgeField.region: "Регион"
  };
}
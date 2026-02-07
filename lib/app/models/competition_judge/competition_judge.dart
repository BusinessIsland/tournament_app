import 'package:tournament_app/app/models/parts/belt/belt.dart';
import 'package:tournament_app/app/models/parts/id/id.dart';
import 'package:tournament_app/app/models/parts/name/person_name.dart';
import 'package:tournament_app/app/models/parts/region/region.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/sports_qualification.dart';

class CompetitionJudge {
  final Id id;
  final PersonName name;
  final Belt belt;
  final SportsQualification qualification;
  final Region region;

  const CompetitionJudge({
    required this.id,
    required this.name,
    required this.belt,
    required this.qualification,
    required this.region,
  });
}

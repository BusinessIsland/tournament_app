import 'package:tournament_app/app/domain/parts/belt/belt.dart';
import 'package:tournament_app/app/domain/parts/id/id.dart';
import 'package:tournament_app/app/domain/parts/name/person_name.dart';
import 'package:tournament_app/app/domain/parts/region/region.dart';
import 'package:tournament_app/app/domain/parts/sports_qualification/sports_qualification.dart';

class CompetitionJudge {
  final Id id;
  final PersonName name;
  final Belt belt;
  final SportsQualification sportsQualification;
  final Region region;

  const CompetitionJudge({
    required this.id,
    required this.name,
    required this.belt,
    required this.sportsQualification,
    required this.region,
  });

  @override
  String toString() {
    return 'CompetitionJudge{id: $id, name: $name, belt: $belt, sportsQualification: $sportsQualification, region: $region}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompetitionJudge &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}

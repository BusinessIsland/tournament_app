import 'package:tournament_app/app/models/parts/sports_qualification/sports_qualification.dart';

sealed class SportsTitle extends SportsQualification {
  SportsTitle(String label, int sortWeight) : super(label: label, sortWeight: sortWeight);
}

class Grandmaster extends SportsTitle {
  Grandmaster() : super("гроссмейстер России", 13);
}

class MasterOfSportsInternational extends SportsTitle {
  MasterOfSportsInternational()
    : super("мастер спорта России международного класса", 12);
}

class MasterOfSports extends SportsTitle {
  MasterOfSports() : super("мастер спорта России", 11);
}

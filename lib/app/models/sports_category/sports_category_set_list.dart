import 'package:tournament_app/app/models/sports_category/sports_category_set.dart';

abstract class SportsCategorySetList extends Iterable<SportsCategorySet> {
  SportsCategorySet? findById(String id);

  void add(SportsCategorySet set);
  void replace(SportsCategorySet set, String id);
  void delete(String id);

  int get size;
}




import 'package:tournament_app/app/models/sports_category/sports_category_set.dart';
import 'package:tournament_app/app/models/sports_category/sports_category_set_list.dart';

abstract class SportsCategoryRepository {
  SportsCategorySetList getAll();
  SportsCategorySet? getById(String id);
  SportsCategorySet create(SportsCategorySetDto dto);
  SportsCategorySet update(SportsCategorySetDto dto, String id);
  void delete(String id);
}
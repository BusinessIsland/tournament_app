import 'package:tournament_app/app/dto/sports_category/sports_category_set_create_dto.dart';
import 'package:tournament_app/app/dto/sports_category/sports_category_set_update_dto.dart';
import 'package:tournament_app/app/models/sports_category/sports_category_set.dart';
import 'package:tournament_app/app/models/sports_category/sports_category_set_list.dart';

abstract class SportsCategorySetRepository {
  SportsCategorySetList getAll();
  SportsCategorySet? getById(String id);
  SportsCategorySet create(SportsCategorySetCreateDto dto);
  SportsCategorySet update(SportsCategorySetUpdateDto dto, String id);
  void delete(String id);
}
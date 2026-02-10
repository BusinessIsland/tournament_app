import 'package:tournament_app/app/models/sports_category/sports_category_set.dart';

abstract class KyokushinSportCategorySetStrategy {
  SportsCategorySet createSet({required bool isMale});
}
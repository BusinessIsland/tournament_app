import 'package:tournament_app/app/models/sports_category/sports_category_set.dart';

abstract class SportsCategorySetList extends Iterable<SportsCategorySet> {
  SportsCategorySet? findById(String id);

  void add(SportsCategorySet set);
  void replace(SportsCategorySet set, String id);
  void delete(String id);

  int get size;
}

class SportsCategorySetListBasicImpl extends SportsCategorySetList {
  final List<SportsCategorySet> _list = List.empty(growable: true);

  @override
  SportsCategorySet? findById(String id) {
    try {
      return _list.firstWhere((s) => s.id.toString() == id);
    } catch(_) {
      return null;
    }
  }

  @override
  void add(SportsCategorySet set) {
    _list.add(set);
  }

  @override
  void replace(SportsCategorySet set, String id) {
    final index = _list.indexWhere((s) => s.id.toString() == id);
    if (index != -1) {
      _list[index] = set;
    }
  }

  @override
  void delete(String id) {
    _list.removeWhere((s) => s.id.toString() == id);
  }

  @override
  int get size => _list.length;

  @override
  Iterator<SportsCategorySet> get iterator => _list.iterator;
}
import 'package:collection/collection.dart';
import 'package:tournament_app/app/domain/parts/id/id.dart';
import 'package:tournament_app/app/domain/sports_category/container/sports_category_set_list.dart';
import 'package:tournament_app/app/domain/sports_category/sports_category_set.dart';

class SportsCategorySetListBasicImpl extends SportsCategorySetList {
  final List<SportsCategorySet> _list;

  SportsCategorySetListBasicImpl(this._list);

  factory SportsCategorySetListBasicImpl.fromIterable(
      Iterable<SportsCategorySet> list) {
    return SportsCategorySetListBasicImpl(List.of(list));
  }

  @override
  int get size => _list.length;

  @override
  Iterator<SportsCategorySet> get iterator => _list.iterator;

  @override
  Iterable<SportsCategorySet> get container => List.unmodifiable(_list);

  @override
  SportsCategorySet? findById(Id id) {
    return _list.firstWhereOrNull((s) => s.id == id);
  }

  @override
  void add(SportsCategorySet set) {
    if (_list.any((s) => s.id == set.id)) {
      throw ArgumentError("спортивная категория с id ${set.id} уже существует");
    }

    _list.add(set);
  }

  @override
  bool replace(SportsCategorySet set, Id id) {
    final index = _list.indexWhere((s) => s.id == id);
    if (index != -1) {
      _list[index] = set;
      return true;
    }

    return false;
  }

  @override
  void delete(Id id) {
    _list.removeWhere((s) => s.id == id);
  }
}

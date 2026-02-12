import 'package:tournament_app/app/gateways/sheets/sheet_cell_mapping/sheet_cell_mapping.dart';

class SheetCellMappingMapImpl<T, K> extends SheetCellMapping<T, K> {
  final Map<T, K> _data = {};

  @override
  K? get(T key) => _data[key];

  @override
  void set(T key, K value) => _data[key] = value;

  @override
  bool hasKey(T key) => _data.containsKey(key);

  @override
  bool hasValue(K value) => _data.containsValue(value);

  @override
  void remove(T key) => _data.remove(key);

  @override
  Iterable<MapEntry<T, K>> get entries => _data.entries;

  @override
  Iterable<T> get keys => _data.keys;

  @override
  Iterable<K> get values => _data.values;
}

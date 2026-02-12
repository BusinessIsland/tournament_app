abstract class SheetCellMapping<T, K> {
  K? get(T key);
  void set(T key, K value);
  bool hasKey(T key);
  bool hasValue(K value);
  void remove(T key);

  Iterable<MapEntry<T, K>> get entries;
  Iterable<T> get keys;
  Iterable<K> get values;
}
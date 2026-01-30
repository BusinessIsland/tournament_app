import 'dart:typed_data';

abstract class SheetDataReader<T> {
  List<T> readAll(Uint8List data);
}
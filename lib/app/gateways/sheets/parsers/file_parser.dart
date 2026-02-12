import 'dart:io';

abstract class FileParser {
  const FileParser();

  dynamic parse(File source);
  void save(String filePath, dynamic data);
}
import 'dart:io';

abstract class IFileParser {
  const IFileParser();

  dynamic parse(File source);
  void save(String filePath, dynamic data);
}
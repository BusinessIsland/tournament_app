import 'dart:io';

import 'package:excel/excel.dart';
import 'package:tournament_app/app/gateways/sheets/parsers/i_file_parser.dart';

abstract class IXlsxParser extends IFileParser {
  const IXlsxParser();

  @override
  dynamic parse(File source) {
    final excel = Excel.decodeBytes(source.readAsBytesSync());
    return concreteXlsxParse(excel);
  }

  @override
  void save(String filePath, dynamic data) {
    final excel = concreteSave(data);

    final fileBytes = excel.save();
    if (fileBytes != null) {
      File(filePath).writeAsBytesSync(fileBytes);
    }
  }

  dynamic concreteXlsxParse(Excel excel);
  Excel concreteSave(dynamic data);
}
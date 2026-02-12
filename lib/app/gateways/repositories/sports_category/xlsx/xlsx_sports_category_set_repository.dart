import 'dart:io';
import 'package:tournament_app/app/dto/sports_category/sports_category_set_create_dto.dart';
import 'package:tournament_app/app/dto/sports_category/sports_category_set_update_dto.dart';
import 'package:tournament_app/app/gateways/repositories/persistence/file_persistable.dart';
import 'package:tournament_app/app/gateways/repositories/sports_category/sports_category_set_repository.dart';
import 'package:tournament_app/app/gateways/sheets/parsers/impl/xlsx_sports_category_set_parser.dart';
import 'package:tournament_app/app/models/sports_category/parser/sports_category_set_parser.dart';
import 'package:tournament_app/app/models/sports_category/sports_category_set.dart';
import 'package:tournament_app/app/models/sports_category/sports_category_set_list.dart';

class XlsxSportsCategorySetRepository
    implements SportsCategorySetRepository, FilePersistable {
  SportsCategorySetList _list = SportsCategorySetListBasicImpl();
  final XlsxSportsCategorySetParser xlsxParser;
  final SportsCategorySetParser setParser;

  XlsxSportsCategorySetRepository({
    required this.xlsxParser,
    required this.setParser,
  });

  @override
  SportsCategorySetList getAll() {
    return _list;
  }

  @override
  SportsCategorySet? getById(String id) {
    return _list.findById(id);
  }

  @override
  SportsCategorySet create(SportsCategorySetCreateDto dto) {
    final category = setParser.parse(
        dto.groupLabel, dto.gender, dto.minAge, dto.maxAge, dto.weights);

    _list.add(category);
    return category;
  }

  @override
  SportsCategorySet update(SportsCategorySetUpdateDto dto, String id) {
    final category = setParser.parse(
        dto.groupLabel, dto.gender, dto.minAge, dto.maxAge, dto.weights);

    final found = _list.findById(id);
    if (found == null) {
      _list.add(category);
    }
    {
      _list.replace(category, id);
    }

    return category;
  }

  @override
  void delete(String id) {
    _list.delete(id);
  }

  @override
  Future<void> loadFromFile(String filePath) async {
    final source = File(filePath);
    _list = xlsxParser.parse(source);
  }

  @override
  Future<void> saveToFile(String filePath) async {
    xlsxParser.save(filePath, _list);
  }
}

import 'package:tournament_app/app/gateways/repositories/persistence/i_file_persistable.dart';
import 'package:tournament_app/app/gateways/repositories/sports_category/sports_category_set_repository.dart';
import 'package:tournament_app/app/models/sports_category/sports_category_set.dart';
import 'package:tournament_app/app/models/sports_category/sports_category_set_list.dart';

class XlsxSportsCategorySetRepository
    implements SportsCategorySetRepository, IFilePersistable {
  final SportsCategorySetList _list = SportsCategorySetListBasicImpl();
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
  SportsCategorySet create(dto) {
    throw UnimplementedError();

    final set = setParser.parse(

    );
  }

  @override
  SportsCategorySet update(dto, String id) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  void delete(String id) {
    _list.delete(id);
  }

  @override
  Future<void> loadFromFile(String filePath) {
    // TODO: implement loadFromFile
    throw UnimplementedError();
  }

  @override
  Future<void> saveToFile(String filePath) {
    // TODO: implement saveToFile
    throw UnimplementedError();
  }
}
